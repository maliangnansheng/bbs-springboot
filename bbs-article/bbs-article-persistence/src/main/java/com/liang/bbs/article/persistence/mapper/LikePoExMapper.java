package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.LikePo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 */
public interface LikePoExMapper {

    /**
     * 通过用户id获取点赞的文章信息
     *
     * @param likeUser
     * @return
     */
    List<LikePo> selectArticleByUserId(Long likeUser);

    /**
     * 获取点赞的所有文章信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<LikePo> selectAllArticle(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);

}
