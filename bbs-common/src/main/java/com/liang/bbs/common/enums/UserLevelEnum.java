package com.liang.bbs.common.enums;

/**
 * @author 马亮
 * @date 2022/6/13 18:04
 */
public enum UserLevelEnum {
    /**
     * 等级
     */
    Lv1(0, "0 <= x < 100"),
    Lv2(100, "100 <= x < 300"),
    Lv3(300, "300 <= x < 600"),
    Lv4(600, "600 <= x < 1000"),
    Lv5(1000, "1000 <= x < 1500"),
    Lv6(1500, "1500 <= x < 2100");

    /**
     * 积分
     */
    private final Integer code;
    /**
     * 说明
     */
    private final String desc;

    public static UserLevelEnum get(Integer code) {
        if (code >= Lv2.getCode() && code < Lv3.getCode()) {
            return Lv2;
        }
        if (code >= Lv3.getCode() && code < Lv4.getCode()) {
            return Lv3;
        }
        if (code >= Lv4.getCode() && code < Lv5.getCode()) {
            return Lv4;
        }
        if (code >= Lv5.getCode() && code < Lv6.getCode()) {
            return Lv5;
        }
        if (code >= Lv6.getCode()) {
            return Lv6;
        }

        return Lv1;
    }

    public Integer getCode() {
        return this.code;
    }

    public String getName() {
        return this.desc;
    }

    UserLevelEnum(final Integer code, final String name) {
        this.code = code;
        this.desc = name;
    }
}
