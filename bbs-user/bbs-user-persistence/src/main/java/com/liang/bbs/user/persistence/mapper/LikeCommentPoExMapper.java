package com.liang.bbs.user.persistence.mapper;

import com.liang.bbs.user.persistence.entity.LikeCommentPo;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 */
public interface LikeCommentPoExMapper {

    /**
     * 获取所有通过审核文章的评论的点赞信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<LikeCommentPo> selectAllCommentLike(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);

}
