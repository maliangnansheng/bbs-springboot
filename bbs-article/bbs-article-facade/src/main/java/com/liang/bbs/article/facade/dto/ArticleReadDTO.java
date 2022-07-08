package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 马亮
 * @date 2022/4/6 14:30
 */
@Data
public class ArticleReadDTO implements Serializable {

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 文章阅读量
     */
    private Long articleReadCount;

    private static final long serialVersionUID = 1L;

}
