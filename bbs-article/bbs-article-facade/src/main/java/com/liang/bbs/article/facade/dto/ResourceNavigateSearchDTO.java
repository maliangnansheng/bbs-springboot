package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 马亮
 * @date 2022/4/6 15:06
 */
@Data
public class ResourceNavigateSearchDTO implements Serializable {
    /**
     * 类别
     */
    private String category;

    /**
     * 当前页
     */
    private Integer currentPage;

    /**
     * 每页条数
     */
    private Integer pageSize;

    private static final long serialVersionUID = 1L;

}
