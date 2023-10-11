package com.liang.bbs.user.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_comment_like
 * 
 * @author maliangnansheng
 * @date 2022/05/23 10:27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeCommentPo implements Serializable {
    /**
     * 评论点赞编号
     */
    private Integer id;

    /**
     * 评论id
     */
    private Integer commentId;

    /**
     * 状态(0取消,1点赞)
     */
    private Boolean state;

    /**
     * 评论点赞用户id
     */
    private Long likeUser;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    private static final long serialVersionUID = 1L;
}
