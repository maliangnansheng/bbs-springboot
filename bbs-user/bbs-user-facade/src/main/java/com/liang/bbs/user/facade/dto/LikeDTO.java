package com.liang.bbs.user.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class LikeDTO implements Serializable {
    /**
     * 点赞编号
     */
    private Integer id;

    /**
     * 文章id
     */
    private Integer articleId;

    /**
     * 状态(0取消,1点赞)
     */
    private Boolean state;

    /**
     * 点赞用户id
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
