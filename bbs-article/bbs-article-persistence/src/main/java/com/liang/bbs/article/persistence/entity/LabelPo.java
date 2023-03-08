package com.liang.bbs.article.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_label
 * 
 * @author maliang
 * @date 2022/05/29 21:12
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LabelPo implements Serializable {
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