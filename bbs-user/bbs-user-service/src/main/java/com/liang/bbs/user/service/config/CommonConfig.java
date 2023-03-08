package com.liang.bbs.user.service.config;

import com.liang.bbs.common.config.RestTemplateConfig;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.context.annotation.Configuration;

/**
 * 公共配置
 *
 * @author maliangnansheng
 * @date 2021-04-21 20:32
 */
@ImportAutoConfiguration(value = {RestTemplateConfig.class})
@Configuration
public class CommonConfig {
}
