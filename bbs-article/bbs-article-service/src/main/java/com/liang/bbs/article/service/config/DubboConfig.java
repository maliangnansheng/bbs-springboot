package com.liang.bbs.article.service.config;

import org.apache.dubbo.config.spring.context.annotation.DubboComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * 一般我们需要配置@DubboComponentScan，定义@Service的扫描路径。如果不配置@DubboComponentScan，默认使用@EnableDubbo注解的类的包路径
 *
 * @author maliangnansheng
 * @date 2021-04-21 20:32
 */
@Configuration
@DubboComponentScan(basePackages = {"com.liang.bbs.article.service.impl"})
public class DubboConfig {
}
