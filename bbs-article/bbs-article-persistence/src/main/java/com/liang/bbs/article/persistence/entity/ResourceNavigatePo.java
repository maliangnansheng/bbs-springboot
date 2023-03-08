package com.liang.bbs.article.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_resource_navigate
 * 
 * @author maliang
 * @date 2022/07/16 23:33
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResourceNavigatePo implements Serializable {
    /**
     * 资源导航编号
     */
    private Integer id;

    /**
     * 资源名字
     */
    private String resourceName;

    /**
     * logo(图片)
     */
    private String logo;

    /**
     * 类别
     */
    private String category;

    /**
     * 描述
     */
    private String desc;

    /**
     * 链接
     */
    private String link;

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