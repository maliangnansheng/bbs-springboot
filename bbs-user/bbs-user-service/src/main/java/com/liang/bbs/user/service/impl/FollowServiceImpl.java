package com.liang.bbs.user.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.user.facade.dto.FollowCountDTO;
import com.liang.bbs.user.facade.dto.FollowDTO;
import com.liang.bbs.user.facade.dto.FollowSearchDTO;
import com.liang.bbs.user.facade.server.FollowService;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.bbs.user.persistence.entity.FollowPo;
import com.liang.bbs.user.persistence.entity.FollowPoExample;
import com.liang.bbs.user.persistence.mapper.FollowPoMapper;
import com.liang.bbs.user.service.mapstruct.FollowMS;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

/**
 * @author 马亮
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class FollowServiceImpl implements FollowService {
    @Autowired
    private FollowPoMapper followPoMapper;

    @Reference
    private UserService userService;

    @Reference
    private ArticleService articleService;

    @Autowired
    private UserLevelService userlevelService;

    @Autowired
    private LikeService likeService;

    /**
     * 获取关注的用户信息
     *
     * @param followSearchDTO
     * @param currentUser
     * @return
     */
    @Override
    public PageInfo<FollowDTO> getFollowUsers(FollowSearchDTO followSearchDTO, UserSsoDTO currentUser) {
        // 获取大牛（粉丝的id）
        Long getBigCow = followSearchDTO.getGetBigCow();
        // 获取粉丝（大牛的id）
        Long getFan = followSearchDTO.getGetFan();
        if (getBigCow == null && getFan == null) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        if (getBigCow != null && getFan != null) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        FollowPoExample example = new FollowPoExample();
        FollowPoExample.Criteria criteria = example.createCriteria().andStateEqualTo(true);
        if (getBigCow != null) {
            // 获取大牛信息
            criteria.andFromUserEqualTo(getBigCow);
        }
        if (getFan != null) {
            // 获取粉丝信息
            criteria.andToUserEqualTo(getFan);
        }
        example.setOrderByClause("`id` desc");

        PageHelper.startPage(followSearchDTO.getCurrentPage(), followSearchDTO.getPageSize());
        List<FollowPo> followPos = followPoMapper.selectByExample(example);
        PageInfo<FollowDTO> pageInfo = FollowMS.INSTANCE.toPage(new PageInfo<>(followPos));
        pageInfo.getList().forEach(followDTO -> {
            UserDTO userDTO = new UserDTO();
            if (getBigCow != null) {
                userDTO = userService.getById(followDTO.getToUser());
            }
            if (getFan != null) {
                userDTO = userService.getById(followDTO.getFromUser());
            }
            followDTO.setName(userDTO.getName());
            followDTO.setPicture(userDTO.getPicture());
            followDTO.setIntro(userDTO.getIntro());
            followDTO.setLevel(userlevelService.getByUserId(userDTO.getId()).get(0).getLevel());
            followDTO.setLikeCount(likeService.getUserLikeCount(userDTO.getId()));
            followDTO.setReadCount(articleService.getUserReadCount(Collections.singletonList(userDTO.getId()))
                    .get(0).getArticleReadCount());
            // 通过fromUser和toUser获取关注信息
            if (currentUser != null) {
                FollowDTO followed = getByFromToUser(currentUser.getUserId(), userDTO.getId(), false);
                if (followed != null) {
                    followDTO.setIsFollow(true);
                }
            }
        });

        return pageInfo;
    }

    /**
     * 通过id或者关注信息
     *
     * @param id
     * @return
     */
    @Override
    public FollowDTO getById(Integer id) {
        return FollowMS.INSTANCE.toDTO(followPoMapper.selectByPrimaryKey(id));
    }

    /**
     * 通过fromUser和toUser获取关注信息
     *
     * @param fromUser
     * @param toUser
     * @param isAll true:不区分关注与否，false:只查询关注了的
     * @return
     */
    @Override
    public FollowDTO getByFromToUser(Long fromUser, Long toUser, Boolean isAll) {
        FollowPoExample example = new FollowPoExample();
        FollowPoExample.Criteria criteria = example.createCriteria().andFromUserEqualTo(fromUser)
                .andToUserEqualTo(toUser);
        if (!isAll) {
            criteria.andStateEqualTo(true);
        }

        List<FollowPo> followPos = followPoMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(followPos)) {
            return null;
        }

        return FollowMS.INSTANCE.toDTO(followPos.get(0));
    }

    /**
     * 更新关注状态
     *
     * @param fromUser
     * @param toUser
     * @return
     */
    @Override
    public Boolean updateFollowState(Long fromUser, Long toUser) {
        if (fromUser.equals(toUser)) {
            throw BusinessException.build(ResponseCode.DATA_ILLEGAL, "不可以关注自己");
        }
        FollowDTO followDTO = getByFromToUser(fromUser, toUser, true);
        LocalDateTime now = LocalDateTime.now();
        // 没有，新增
        if (followDTO == null) {
            FollowPo followPo = new FollowPo();
            followPo.setFromUser(fromUser);
            followPo.setToUser(toUser);
            followPo.setState(true);
            followPo.setCreateTime(now);
            followPo.setUpdateTime(now);
            if (followPoMapper.insertSelective(followPo) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "添加关注失败");
            }
        } else {
            FollowPo followPo = new FollowPo();
            followPo.setId(followDTO.getId());
            // 状态取反
            followPo.setState(!followDTO.getState());
            followPo.setUpdateTime(now);
            if (followPoMapper.updateByPrimaryKeySelective(followPo) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新关注状态失败");
            }
        }

        return true;
    }

    /**
     * 获取关注/粉丝数量
     *
     * @param userId
     * @return
     */
    @Override
    public FollowCountDTO getFollowCount(Long userId) {
        // 关注数量
        FollowCountDTO followCountDTO = new FollowCountDTO();
        FollowPoExample example = new FollowPoExample();
        example.createCriteria().andStateEqualTo(true)
                .andFromUserEqualTo(userId);
        followCountDTO.setFollowCount(followPoMapper.countByExample(example));

        // 粉丝数量
        FollowPoExample example2 = new FollowPoExample();
        example2.createCriteria().andStateEqualTo(true)
                .andToUserEqualTo(userId);
        followCountDTO.setFanCount(followPoMapper.countByExample(example2));

        return followCountDTO;
    }
}
