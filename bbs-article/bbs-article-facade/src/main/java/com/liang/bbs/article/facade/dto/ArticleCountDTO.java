package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 马亮
 * @date 2022/4/6 14:30
 */
@Data
public class ArticleCountDTO implements Serializable {
    /**
     * 是否点赞
     */
    private Boolean isLike;

    /**
     * 点赞数量
     */
    private Long likeCount;

    /**
     * 评论数量
     */
    private Long commentCount;

    /**
     * 是否关注
     */
    private Boolean isFollow;

    /**
     * 等级（Lv6）
     */
    private String level;

    private static final long serialVersionUID = 1L;

}
