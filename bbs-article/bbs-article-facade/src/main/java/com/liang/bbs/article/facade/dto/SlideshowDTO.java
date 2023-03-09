package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class SlideshowDTO implements Serializable {
    /**
     * 轮播图编号
     */
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 轮播图
     */
    private String image;

    /**
     * 跳转地址
     */
    private String jumpAddress;

    /**
     * 描述
     */
    private String desc;

    /**
     * 状态(0禁用,1启用)
     */
    private Boolean state;

    /**
     * 逻辑删除(0正常,1删除)
     */
    private Boolean isDeleted;

    /**
     * 创建用户id
     */
    private Long createUser;

    /**
     * 更新用户id
     */
    private Long updateUser;

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
