package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author 马亮
 * @date 2022/4/6 14:30
 */
@Data
public class ResourceNavigateDTO implements Serializable {
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
