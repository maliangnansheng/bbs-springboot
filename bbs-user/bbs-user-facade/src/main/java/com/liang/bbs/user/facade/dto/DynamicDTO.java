package com.liang.bbs.user.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class DynamicDTO implements Serializable {
    /**
     * 用户动态编号
     */
    private Integer id;

    /**
     * 类型（写文章、评论、点赞、关注等）
     */
    private String type;

    /**
     * 发起人
     */
    private Long userId;

    /**
     * 发起人名称
     */
    private String userName;

    /**
     * 发起人（头像）
     */
    private String picture;

    /**
     * 操作的对象ID（文章id、用户id等非评论id）
     */
    private String objectId;

    /**
     * 评论id
     */
    private Integer commentId;

    /**
     * 操作的对象名称（用户名称、文章名、评论内容等）
     */
    private String title;

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
