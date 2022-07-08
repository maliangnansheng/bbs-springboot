package com.liang.bbs.user.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author 马亮
 * @date 2022/4/6 14:30
 */
@Data
public class FollowDTO implements Serializable {
    /**
     * 关注编号
     */
    private Integer id;

    /**
     * 发起关注的人
     */
    private Long fromUser;

    /**
     * 状态(0取消,1关注)
     */
    private Boolean state;

    /**
     * 被关注的人
     */
    private Long toUser;

    /**
     * 用户名
     */
    private String name;

    /**
     * 头像
     */
    private String picture;

    /**
     * 等级（Lv6）
     */
    private String level;

    /**
     * 是否关注
     */
    private Boolean isFollow;

    /**
     * 简介
     */
    private String intro;

    /**
     * 获得的点赞数
     */
    private Long likeCount;

    /**
     * 获得的阅读量
     */
    private Long readCount;

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
