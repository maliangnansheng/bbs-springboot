package com.liang.bbs.common.enums;

import lombok.Getter;

/**
 * @author maliangnansheng
 * @date 2022/6/13 18:04
 */
@Getter
public enum ArticleStateEnum {
    /**
     * 待审核
     */
    pendingReview(-1, "待审核"),
    disabled(0, "禁用"),
    enable(1, "启用");

    /**
     * 积分
     */
    private Integer code;

    /**
     * 说明
     */
    private String desc;

    ArticleStateEnum(Integer code, String name) {
        this.code = code;
        this.desc = name;
    }

}
