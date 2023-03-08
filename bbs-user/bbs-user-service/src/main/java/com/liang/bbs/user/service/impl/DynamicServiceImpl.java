package com.liang.bbs.user.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ArticleDTO;
import com.liang.bbs.article.facade.dto.CommentDTO;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.article.facade.server.CommentService;
import com.liang.bbs.common.enums.DynamicTypeEnum;
import com.liang.bbs.user.facade.dto.DynamicDTO;
import com.liang.bbs.user.facade.dto.FollowDTO;
import com.liang.bbs.user.facade.dto.LikeCommentDTO;
import com.liang.bbs.user.facade.dto.LikeDTO;
import com.liang.bbs.user.facade.server.DynamicService;
import com.liang.bbs.user.facade.server.FollowService;
import com.liang.bbs.user.facade.server.LikeCommentService;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.persistence.entity.DynamicPo;
import com.liang.bbs.user.persistence.entity.DynamicPoExample;
import com.liang.bbs.user.persistence.mapper.DynamicPoMapper;
import com.liang.bbs.user.service.mapstruct.DynamicMS;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.utils.CommonUtils;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class DynamicServiceImpl implements DynamicService {
    @Autowired
    private DynamicPoMapper dynamicPoMapper;

    @Reference
    private ArticleService articleService;

    @Reference
    private CommentService commentService;

    @Reference
    private UserService userService;

    @Autowired
    private LikeService likeService;

    @Autowired
    private LikeCommentService likeCommentService;

    @Autowired
    private FollowService followService;

    /**
     * 获取用户的动态信息
     *
     * @param userId
     * @param currentPage
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<DynamicDTO> getByUserId(Long userId, Integer currentPage, Integer pageSize) {
        DynamicPoExample example = new DynamicPoExample();
        example.createCriteria().andUserIdEqualTo(userId);
        example.setOrderByClause("create_time desc");

        PageHelper.startPage(currentPage, pageSize);
        List<DynamicPo> dynamicPos = dynamicPoMapper.selectByExample(example);
        PageInfo<DynamicDTO> pageInfo = DynamicMS.INSTANCE.toPage(new PageInfo<>(dynamicPos));
        if (CollectionUtils.isNotEmpty(pageInfo.getList())) {
            pageInfo.getList().forEach(dynamicDTO -> {
                UserDTO userDTO = userService.getById(dynamicDTO.getUserId());
                dynamicDTO.setUserName(userDTO.getName());
                dynamicDTO.setPicture(userDTO.getPicture());
                // 文章相关
                if (DynamicTypeEnum.writeArticle.name().equals(dynamicDTO.getType()) ||
                        DynamicTypeEnum.likeArticle.name().equals(dynamicDTO.getType()) ||
                        DynamicTypeEnum.commentArticle.name().equals(dynamicDTO.getType())) {
                    List<ArticleDTO> articleDTOS = articleService.getByIds(Collections.singletonList(Integer.parseInt(dynamicDTO.getObjectId())), null, null);
                    dynamicDTO.setTitle(articleDTOS.get(0).getTitle());
                }
                // 评论相关
                if (DynamicTypeEnum.likeComment.name().equals(dynamicDTO.getType()) ||
                        DynamicTypeEnum.commentReply.name().equals(dynamicDTO.getType())) {
                    List<ArticleDTO> articleDTOS = articleService.getByIds(Collections.singletonList(Integer.parseInt(dynamicDTO.getObjectId())), null, null);
                    dynamicDTO.setTitle(articleDTOS.get(0).getTitle() + " > " + CommonUtils.html2Text(commentService.getById(dynamicDTO.getCommentId()).getContent()));
                }
                if (DynamicTypeEnum.followUser.name().equals(dynamicDTO.getType())) {
                    UserDTO userDTO1 = userService.getById(Long.parseLong(dynamicDTO.getObjectId()));
                    dynamicDTO.setTitle(userDTO1.getName());
                }
            });
        }

        return pageInfo;
    }

    /**
     * 创建用户动态信息
     *
     * @param dynamicDTO
     * @return
     */
    @Override
    public Boolean create(DynamicDTO dynamicDTO) {
        if (dynamicPoMapper.insertSelective(DynamicMS.INSTANCE.toPo(dynamicDTO)) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "添加用户动态失败");
        }

        return true;
    }

    /**
     * 删除用户动态信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    @Override
    public Boolean delete(LocalDateTime startTime, LocalDateTime endTime) {
        DynamicPoExample example = new DynamicPoExample();
        if (startTime != null && endTime != null) {
            example.createCriteria().andCreateTimeBetween(startTime, endTime);
        }

        return dynamicPoMapper.deleteByExample(example) > 0;
    }

    /**
     * 更新所有用户的动态信息
     *
     * @return
     */
    @Override
    public void updateAll() {
//        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        LocalDateTime startTime = LocalDateTime.parse("2000-01-01 00:00:00", df);
        LocalDateTime startTime = CommonUtils.getCurrentStartTime();
        LocalDateTime endTime = CommonUtils.getCurrentEndTime();
        List<DynamicDTO> dynamicDTOS = new ArrayList<>();
        // 写文章
        List<ArticleDTO> articleDTOS = articleService.getPassAll(startTime, endTime);
        if (CollectionUtils.isNotEmpty(articleDTOS)) {
            articleDTOS.forEach(articleDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.writeArticle.name());
                dynamicDTO.setUserId(articleDTO.getCreateUser());
                dynamicDTO.setObjectId(String.valueOf(articleDTO.getId()));
                dynamicDTO.setCreateTime(articleDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        // 点赞文章
        List<LikeDTO> likeDTOS = likeService.getPaasAll(startTime, endTime);
        if (CollectionUtils.isNotEmpty(likeDTOS)) {
            likeDTOS.forEach(likeDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.likeArticle.name());
                dynamicDTO.setUserId(likeDTO.getLikeUser());
                dynamicDTO.setObjectId(String.valueOf(likeDTO.getArticleId()));
                dynamicDTO.setCreateTime(likeDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        // 点赞评论
        List<LikeCommentDTO> likeCommentDTOS = likeCommentService.getPaasAll(startTime, endTime);
        if (CollectionUtils.isNotEmpty(likeCommentDTOS)) {
            likeCommentDTOS.forEach(likeCommentDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.likeComment.name());
                dynamicDTO.setUserId(likeCommentDTO.getLikeUser());
                dynamicDTO.setObjectId(String.valueOf(commentService.getArticleIdByCommentId(likeCommentDTO.getCommentId())));
                dynamicDTO.setCommentId(likeCommentDTO.getCommentId());
                dynamicDTO.setCreateTime(likeCommentDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        // 评论文章
        List<CommentDTO> commentDTOS = commentService.getAllArticleComment(startTime, endTime);
        if (CollectionUtils.isNotEmpty(commentDTOS)) {
            commentDTOS.forEach(commentDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.commentArticle.name());
                dynamicDTO.setUserId(commentDTO.getCommentUser());
                dynamicDTO.setObjectId(String.valueOf(commentDTO.getArticleId()));
                dynamicDTO.setCommentId(commentDTO.getId());
                dynamicDTO.setCreateTime(commentDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        // 评论回复
        List<CommentDTO> allCommentReply = commentService.getAllCommentReply(startTime, endTime);
        if (CollectionUtils.isNotEmpty(allCommentReply)) {
            allCommentReply.forEach(commentDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.commentReply.name());
                dynamicDTO.setUserId(commentDTO.getCommentUser());
                dynamicDTO.setObjectId(String.valueOf(commentDTO.getArticleId()));
                dynamicDTO.setCommentId(commentDTO.getPreId());
                dynamicDTO.setCreateTime(commentDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        // 关注
        List<FollowDTO> followDTOS = followService.getPaasAll(startTime, endTime);
        if (CollectionUtils.isNotEmpty(followDTOS)) {
            followDTOS.forEach(followDTO -> {
                DynamicDTO dynamicDTO = new DynamicDTO();
                dynamicDTO.setType(DynamicTypeEnum.followUser.name());
                dynamicDTO.setUserId(followDTO.getFromUser());
                dynamicDTO.setObjectId(String.valueOf(followDTO.getToUser()));
                dynamicDTO.setCreateTime(followDTO.getCreateTime());
                dynamicDTO.setUpdateTime(dynamicDTO.getCreateTime());
                dynamicDTOS.add(dynamicDTO);
            });
        }

        log.info("dynamicDTOS size: {}", dynamicDTOS.size());
        this.delete(startTime, endTime);
        if (CollectionUtils.isNotEmpty(dynamicDTOS)) {
            dynamicDTOS.forEach(this::create);
        }
    }
}
