package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.CommentPo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author W9009820
 */
public interface CommentPoExMapper {

    /**
     * 获取最新评论信息
     *
     * @param content
     * @param commentUser
     * @return
     */
    List<CommentPo> selectLatestComments(String content, Long commentUser);

    /**
     * 获取所有通过审核文章的评论信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<CommentPo> getAllArticleComment(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);

    /**
     * 获取所有通过审核文章的评论回复信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<CommentPo> getAllCommentReply(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);

}