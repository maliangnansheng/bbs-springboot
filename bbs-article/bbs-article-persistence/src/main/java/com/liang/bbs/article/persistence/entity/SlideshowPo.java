package com.liang.bbs.article.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_slideshow
 * 
 * @author maliangnansheng
 * @date 2023/02/01 15:32
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SlideshowPo implements Serializable {
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
