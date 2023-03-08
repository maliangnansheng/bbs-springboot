package com.liang.bbs.article.service.config;

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
        "com.liang.bbs.article.persistence",
        "com.liang.bbs.article.service.mapstruct"
})
@MapperScan(basePackages = {"com.liang.bbs.article.persistence.mapper"})
public class MybatisConfig {

}
