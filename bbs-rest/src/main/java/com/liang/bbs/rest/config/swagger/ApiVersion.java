package com.liang.bbs.rest.config.swagger;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:40
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface ApiVersion {
    /**
     * 接口版本号(对应swagger中的group)
     *
     * @return String[]
     */
    String[] group();
}
