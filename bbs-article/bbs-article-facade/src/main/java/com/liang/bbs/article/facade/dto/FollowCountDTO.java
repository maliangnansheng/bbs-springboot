package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:30
 */
@Data
public class FollowCountDTO implements Serializable {

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
