package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class ArticleCheckCountDTO implements Serializable {

    /**
     * 启用文章数量
     */
    private Long enableCount;

    /**
     * 禁用文章数量
     */
    private Long disabledCount;

    /**
     * 待审核文章数量
     */
    private Long pendingReviewCount;


    private static final long serialVersionUID = 1L;

}
