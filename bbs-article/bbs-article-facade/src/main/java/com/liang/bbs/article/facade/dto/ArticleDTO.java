package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class ArticleDTO implements Serializable {
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
     * 文章内容（markdown）
     */
    private String markdown;

    /**
     * 文章内容（html）
     */
    private String html;

    /**
     * 文章所拥有的标签
     */
    private List<LabelDTO> labelDTOS;

    /**
     * 状态(-1待审核,0禁用,1启用)
     */
    private Integer state;

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
     * 创建用户名称
     */
    private String createUserName;

    /**
     * 等级（Lv6）
     */
    private String level;

    /**
     * 更新用户id
     */
    private Long updateUser;

    /**
     * 更新用户名称
     */
    private String updateUserName;

    /**
     * 一些统计数据
     */
    private ArticleCountDTO articleCountDTO;

    /**
     * 用户头像
     */
    private String picture;

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
