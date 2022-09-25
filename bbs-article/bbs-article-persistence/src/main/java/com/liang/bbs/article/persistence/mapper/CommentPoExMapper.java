package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.CommentPo;

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

}