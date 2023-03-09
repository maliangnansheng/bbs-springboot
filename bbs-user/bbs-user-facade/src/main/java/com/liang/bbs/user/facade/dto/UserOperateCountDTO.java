package com.liang.bbs.user.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2023/3/7 14:30
 */
@Data
public class UserOperateCountDTO implements Serializable {

    /**
     * 文章数量
     */
    private Long articleCount;

    /**
     * 点赞数量
     */
    private Long likeCount;

    /**
     * 关注数量
     */
    private Long followCount;

    /**
     * 粉丝数量
     */
    private Long fanCount;

    private static final long serialVersionUID = 1L;

}
