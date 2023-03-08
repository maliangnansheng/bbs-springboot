package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class LabelDTO implements Serializable {
    /**
     * 标签编号
     */
    private Integer id;

    /**
     * 标签名字
     */
    private String labelName;

    /**
     * logo(图片)
     */
    private String logo;

    /**
     * 文章使用数量
     */
    private Long articleUseCount;

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
