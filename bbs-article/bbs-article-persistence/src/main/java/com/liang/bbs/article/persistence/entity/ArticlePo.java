package com.liang.bbs.article.persistence.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据表为：fs_article
 * 
 * @author maliang
 * @date 2022/06/13 21:03
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticlePo implements Serializable {
    /**
     * 文章编号
     */
    private Integer id;

    /**
     * 题图
     */
    private String titleMap;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 状态(0禁用,1启用)
     */
    private Boolean state;

    /**
     * 文章浏览量
     */
    private Integer pv;

    /**
     * 置顶（数字越大越置顶）
     */
    private Integer top;

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