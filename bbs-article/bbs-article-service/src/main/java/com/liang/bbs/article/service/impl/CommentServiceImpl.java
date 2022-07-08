package com.liang.bbs.article.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.CommentDTO;
import com.liang.bbs.article.facade.dto.CommentSearchDTO;
import com.liang.bbs.article.facade.server.CommentService;
import com.liang.bbs.article.persistence.entity.CommentPo;
import com.liang.bbs.article.persistence.entity.CommentPoExample;
import com.liang.bbs.article.persistence.mapper.CommentPoMapper;
import com.liang.bbs.article.service.mapstruct.CommentMS;
import com.liang.bbs.article.service.utils.CommentTreeUtils;
import com.liang.bbs.user.facade.dto.UserLevelDTO;
import com.liang.bbs.user.facade.server.LikeCommentService;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author 马亮
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentPoMapper commentPoMapper;

    @Autowired
    private CommentService commentService;

    @Reference
    private UserService userService;

    @Reference
    private UserLevelService userLevelService;

    @Reference
    private LikeCommentService likeCommentService;

    /**
     * 获取文章的评论信息
     *
     * @param articleId
     * @param currentUser
     * @return
     */
    @Override
    public List<CommentDTO> getCommentByArticleId(Integer articleId, UserSsoDTO currentUser) {
        CommentPoExample example = new CommentPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true)
                .andArticleIdEqualTo(articleId);
        List<CommentDTO> commentDTOS = CommentMS.INSTANCE.toDTO(commentPoMapper.selectByExample(example));
        if (CollectionUtils.isNotEmpty(commentDTOS)) {
            // 构建评论信息
            buildCommentInfo(commentDTOS, currentUser);
        }

        return CommentTreeUtils.toTree(commentDTOS);
    }

    /**
     * 获取最新评论信息
     *
     * @param commentSearchDTO
     * @return
     */
    @Override
    public PageInfo<CommentDTO> getLatestComment(CommentSearchDTO commentSearchDTO) {
        CommentPoExample example = new CommentPoExample();
        CommentPoExample.Criteria criteria = example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true);
        if (StringUtils.isNotBlank(commentSearchDTO.getContent())) {
            criteria.andContentLike("%" + commentSearchDTO.getContent() + "%");
        }
        if (commentSearchDTO.getCommentUser() != null) {
            criteria.andCommentUserEqualTo(commentSearchDTO.getCommentUser());
        }
        example.setOrderByClause("`id` desc");

        PageHelper.startPage(commentSearchDTO.getCurrentPage(), commentSearchDTO.getPageSize());
        PageInfo<CommentDTO> pageInfo = CommentMS.INSTANCE.toPage(new PageInfo<>(commentPoMapper.selectByExample(example)));
        if (CollectionUtils.isNotEmpty(pageInfo.getList())) {
            // 构建评论信息
            buildCommentInfo(pageInfo.getList(), null);
        }

        return pageInfo;
    }

    /**
     * 获取文章的评论数量
     *
     * @param articleId
     * @return
     */
    @Override
    public Long getCommentCountByArticle(Integer articleId) {
        CommentPoExample example = new CommentPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true)
                .andArticleIdEqualTo(articleId);

        return commentPoMapper.countByExample(example);
    }

    /**
     * 获取评论数量
     *
     * @return
     */
    @Override
    public Long getTotal() {
        CommentPoExample example = new CommentPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true);
        return commentPoMapper.countByExample(example);
    }

    /**
     * 创建评论
     *
     * @param commentDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(CommentDTO commentDTO, UserSsoDTO currentUser) {
        LocalDateTime now = LocalDateTime.now();
        commentDTO.setIsDeleted(false);
        commentDTO.setState(true);
        commentDTO.setCommentUser(currentUser.getUserId());
        commentDTO.setCreateTime(now);
        commentDTO.setUpdateTime(now);
        if (commentPoMapper.insertSelective(CommentMS.INSTANCE.toPo(commentDTO)) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "添加评论失败");
        }

        return true;
    }

    /**
     * 删除评论
     *
     * @param commentId
     * @return
     */
    @Override
    public Boolean delete(Integer commentId) {
        CommentPo commentPo = new CommentPo();
        commentPo.setId(commentId);
        commentPo.setIsDeleted(true);
        commentPo.setUpdateTime(LocalDateTime.now());
        if (commentPoMapper.updateByPrimaryKey(commentPo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "删除评论失败");
        }
        return true;
    }

    /**
     * 构建评论信息
     *
     * @param commentDTOS
     * @param currentUser
     */
    private void buildCommentInfo(List<CommentDTO> commentDTOS, UserSsoDTO currentUser) {
        // 通过用户id集合获取用户信息
        List<Long> userIds = commentDTOS.stream().map(CommentDTO::getCommentUser).collect(Collectors.toList());
        Map<Long, List<UserDTO>> idUsers = userService.getByIds(userIds).stream().collect(Collectors.groupingBy(UserDTO::getId));
        // 用于回复数量提取
        Map<Integer, List<CommentDTO>> preIdMap = commentDTOS.stream().collect(Collectors.groupingBy(CommentDTO::getPreId));
        commentDTOS.forEach(commentDTO -> {
            if (idUsers.containsKey(commentDTO.getCommentUser())) {
                commentDTO.setCommentUserName(idUsers.get(commentDTO.getCommentUser()).get(0).getName());
                commentDTO.setPicture(idUsers.get(commentDTO.getCommentUser()).get(0).getPicture());
            }
            // 获取用户等级
            List<UserLevelDTO> userLevelDTOS = userLevelService.getByUserId(commentDTO.getCommentUser());
            if (CollectionUtils.isNotEmpty(userLevelDTOS)) {
                commentDTO.setLevel(userLevelDTOS.get(0).getLevel());
            }
            // 获取文章点赞数量
            commentDTO.setLikeCount(likeCommentService.getLikeCountCommentId(commentDTO.getId()));
            // 是否已经点赞
            if (currentUser != null) {
                commentDTO.setIsLike(likeCommentService.isLike(commentDTO.getId(), currentUser.getUserId()));
            }
            // 回复数量
            if (preIdMap.containsKey(commentDTO.getId())) {
                commentDTO.setRepliesCount(preIdMap.get(commentDTO.getId()).size());
            }
        });
    }

}
