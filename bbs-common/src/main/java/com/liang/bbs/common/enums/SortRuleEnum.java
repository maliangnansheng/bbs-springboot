package com.liang.bbs.common.enums;

import lombok.Getter;

/**
 * @author 马亮
 * @date 2022/6/13 18:04
 */
@Getter
public enum SortRuleEnum {
    /**
     * 最热
     */
    hottest("最热"),
    newest("最新");

    /**
     * 说明
     */
    private String desc;

    SortRuleEnum(String name) {
        this.desc = name;
    }

}
