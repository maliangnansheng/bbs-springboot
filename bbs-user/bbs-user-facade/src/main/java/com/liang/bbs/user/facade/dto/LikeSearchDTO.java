package com.liang.bbs.user.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2022/4/6 15:06
 */
@Data
public class LikeSearchDTO implements Serializable {

    /**
     * 文章id
     */
    private Integer articleId;

    /**
     * 点赞用户id
     */
    private Long likeUser;

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
