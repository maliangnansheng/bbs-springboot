package com.liang.bbs.user.service.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis配置
 *
 * @author maliangnansheng
 * @date 2021-04-21 20:32
 */
@Configuration
@ComponentScan(basePackages = {
        "com.liang.bbs.user.persistence",
        "com.liang.bbs.user.service.mapstruct"
})
@MapperScan(basePackages = {"com.liang.bbs.user.persistence.mapper"})
public class MybatisConfig {

}
