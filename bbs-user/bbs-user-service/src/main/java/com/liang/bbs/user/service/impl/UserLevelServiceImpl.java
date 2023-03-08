package com.liang.bbs.user.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ArticleReadDTO;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.common.enums.UserLevelEnum;
import com.liang.bbs.user.facade.dto.FollowDTO;
import com.liang.bbs.user.facade.dto.UserForumDTO;
import com.liang.bbs.user.facade.dto.UserLevelDTO;
import com.liang.bbs.user.facade.dto.UserSearchDTO;
import com.liang.bbs.user.facade.server.FollowService;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.bbs.user.persistence.entity.UserLevelPo;
import com.liang.bbs.user.persistence.entity.UserLevelPoExample;
import com.liang.bbs.user.persistence.mapper.UserLevelPoMapper;
import com.liang.bbs.user.service.mapstruct.UserLevelMS;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.dto.user.UserListDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class UserLevelServiceImpl implements UserLevelService {
    @Autowired
    private UserLevelPoMapper userLevelPoMapper;

    @Autowired
    private LikeService likeService;

    @Autowired
    private FollowService followService;

    @Reference
    private ArticleService articleService;

    @Reference
    private UserService userService;

    /**
     * 创建用户等级信息
     *
     * @param userId
     * @return
     */
    @Override
    public Boolean create(Long userId) {
        List<UserLevelDTO> userLevelDTOS = this.getByUserId(userId);
        if (CollectionUtils.isEmpty(userLevelDTOS)) {
            UserLevelPo userLevelPo = new UserLevelPo();
            userLevelPo.setUserId(userId);
            LocalDateTime now = LocalDateTime.now();
            userLevelPo.setCreateTime(now);
            userLevelPo.setUpdateTime(now);
            if (userLevelPoMapper.insertSelective(userLevelPo) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "创建用户等级信息失败");
            }
        }

        return true;
    }

    /**
     * 更新用户等级信息
     *
     * @param userId 用户id
     * @param points 积分
     * @return
     */
    @Override
    public Boolean update(Long userId, Integer points) {
        UserLevelPoExample example = new UserLevelPoExample();
        example.createCriteria().andUserIdEqualTo(userId);
        List<UserLevelPo> userLevelPos = userLevelPoMapper.selectByExample(example);
        if (CollectionUtils.isNotEmpty(userLevelPos)) {
            UserLevelPo userLevelPo = userLevelPos.get(0);
            userLevelPo.setUpdateTime(LocalDateTime.now());
            userLevelPo.setPoints(points);
            userLevelPo.setLevel(UserLevelEnum.get(points).name());
            if (userLevelPoMapper.updateByExampleSelective(userLevelPo, example) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新用户等级信息失败");
            }
        }

        return true;
    }

    /**
     * 更新所有用户等级信息
     *
     * @return
     */
    @Override
    public Boolean updatePointsAll() {
        // 所有的用户id
        List<Long> userIds = userService.getAllList().stream().map(UserListDTO::getId).collect(Collectors.toList());
        // 用户的文章阅读数量
        Map<Long, Long> userIdToArticleReadCount = articleService.getUserReadCount(userIds).stream()
                .collect(Collectors.toMap(ArticleReadDTO::getUserId, ArticleReadDTO::getArticleReadCount, (v1, v2) -> v1));
        userIds.forEach(userId -> {
            // 南生值 = 文章的阅读数 / 10 + 获得的点赞数
            long points = (userIdToArticleReadCount.getOrDefault(userId, 0L)) / 10 + likeService.getUserLikeCount(userId);
            this.update(userId, (int) points);
        });

        return true;
    }

    @Override
    public Boolean syncAll() {
        // 所有的用户id
        List<Long> userIds = userService.getAllList().stream().map(UserListDTO::getId).collect(Collectors.toList());
        // 创建用户等级信息
        userIds.forEach(this::create);
        return true;
    }

    /**
     * 获取热门作者列表
     *
     * @param userSearchDTO
     * @param currentUser
     * @return
     */
    @Override
    public PageInfo<UserForumDTO> getHotAuthorsList(UserSearchDTO userSearchDTO, UserSsoDTO currentUser) {
        PageHelper.startPage(userSearchDTO.getCurrentPage(), userSearchDTO.getPageSize()).setOrderBy("points desc, user_id desc");
        // 通过用户id获取用户等级信息
        List<UserLevelDTO> userLevelDTOS = getByUserId(null);
        if (CollectionUtils.isEmpty(userLevelDTOS)) {
            return new PageInfo<>(new ArrayList<>());
        }
        // 通过用户id集合去获取用户信息（这样可以大大减少数据库的操作次数）
        List<Long> userIds = userLevelDTOS.stream().map(UserLevelDTO::getUserId).collect(Collectors.toList());
        // 用户基础信息
        Map<Long, List<UserDTO>> userIdToUsersMap = userService.getByIds(userIds).stream().collect(Collectors.groupingBy(UserDTO::getId));
        // 用户的文章阅读数量
        Map<Long, Long> userIdToArticleReadCount = articleService.getUserReadCount(userIds).stream()
                .collect(Collectors.toMap(ArticleReadDTO::getUserId, ArticleReadDTO::getArticleReadCount, (v1, v2) -> v1));
        List<UserForumDTO> userForumDTOS = new ArrayList<>();
        userLevelDTOS.forEach(userLevelDTO -> {
            UserForumDTO userForumDTO = new UserForumDTO();
            BeanUtils.copyProperties(userIdToUsersMap.get(userLevelDTO.getUserId()).get(0), userForumDTO);
            userForumDTO.setLikeCount(likeService.getUserLikeCount(userForumDTO.getId()));
            userForumDTO.setReadCount(userIdToArticleReadCount.getOrDefault(userForumDTO.getId(), 0L));
            userForumDTO.setLevel(userLevelDTO.getLevel());
            // 通过fromUser和toUser获取关注信息
            if (currentUser != null) {
                FollowDTO followDTO = followService.getByFromToUser(currentUser.getUserId(), userForumDTO.getId(), false);
                if (followDTO != null) {
                    userForumDTO.setIsFollow(true);
                }
            }

            userForumDTOS.add(userForumDTO);
        });

        return new PageInfo<>(userForumDTOS);
    }

    /**
     * 通过用户id获取用户等级信息
     *
     * @param userId
     * @return
     */
    @Override
    public List<UserLevelDTO> getByUserId(Long userId) {
        UserLevelPoExample example = new UserLevelPoExample();
        UserLevelPoExample.Criteria criteria = example.createCriteria();
        if (userId != null) {
            criteria.andUserIdEqualTo(userId);
        }
        return UserLevelMS.INSTANCE.toDTO(userLevelPoMapper.selectByExample(example));
    }

    /**
     * 通过用户id集合获取用户等级信息
     *
     * @param userIds
     * @return
     */
    @Override
    public List<UserLevelDTO> getByUserIds(List<Long> userIds) {
        UserLevelPoExample example = new UserLevelPoExample();
        example.createCriteria().andUserIdIn(userIds);
        return UserLevelMS.INSTANCE.toDTO(userLevelPoMapper.selectByExample(example));
    }

    /**
     * 获取用户信息
     *
     * @param userId
     * @param currentUser
     * @return
     */
    @Override
    public UserForumDTO getUserInfo(Long userId, UserSsoDTO currentUser) {
        UserForumDTO userForumDTO = new UserForumDTO();
        // 通过用户id获取用户等级信息
        List<UserLevelDTO> userLevelDTOS = getByUserId(userId);
        if (CollectionUtils.isEmpty(userLevelDTOS)) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "用户不存在");
        }

        UserDTO userDTO = userService.getByIds(Collections.singletonList(userId)).get(0);
        BeanUtils.copyProperties(userDTO, userForumDTO);
        userForumDTO.setLikeCount(likeService.getUserLikeCount(userDTO.getId()));
        List<ArticleReadDTO> articleReadDTOS = articleService.getUserReadCount(Collections.singletonList(userDTO.getId()));
        userForumDTO.setReadCount(CollectionUtils.isEmpty(articleReadDTOS) ? 0L : articleReadDTOS.get(0).getArticleReadCount());
        userForumDTO.setLevel(userLevelDTOS.get(0).getLevel());
        userForumDTO.setPoints(userLevelDTOS.get(0).getPoints());
        // 通过fromUser和toUser获取关注信息
        if (currentUser != null) {
            FollowDTO followDTO = followService.getByFromToUser(currentUser.getUserId(), userDTO.getId(), false);
            if (followDTO != null) {
                userForumDTO.setIsFollow(true);
            }
        }

        return userForumDTO;
    }

}
