package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 马亮
 * @date 2022/4/6 15:06
 */
@Data
public class CommentSearchDTO implements Serializable {
    /**
     * 评论编号
     */
    private Integer id;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论用户id
     */
    private Long commentUser;

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
