package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2022/4/6 15:06
 */
@Data
public class UserSearchDTO implements Serializable {

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
