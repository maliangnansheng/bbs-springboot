package com.liang.bbs.user.persistence.mapper;

import com.liang.bbs.user.persistence.entity.LikePo;

import java.util.List;

/**
 * @author W9009820
 */
public interface LikePoExMapper {

    /**
     * 通过用户id获取点赞的文章信息
     *
     * @param likeUser
     * @return
     */
    List<LikePo> selectArticleByUserId(Long likeUser);

}