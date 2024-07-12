package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2022/4/6 15:06
 */
@Data
public class FollowSearchDTO implements Serializable {
    /**
     * 获取大牛
     */
    private Long getBigCow;

    /**
     * 获取粉丝
     */
    private Long getFan;

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
