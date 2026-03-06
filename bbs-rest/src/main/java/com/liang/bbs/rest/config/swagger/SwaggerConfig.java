package com.liang.bbs.rest.config.swagger;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:39
 */
@Configuration
public class SwaggerConfig {

    /**
     * 文档首页概述
     *
     * @return
     */
    @Bean
    public OpenAPI openAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("南生论坛 Restful API 文档")
                        .version(ApiVersionConstant.V_LATEST)
                        .description("南生论坛，是南生系列元老级系统，也是梦开始的地方！")
                        .contact(new Contact().name("马亮南生")
                                .url("https://github.com/maliangnansheng")
                                .email("924818949@qq.com")));
    }

//    @Bean
//    public GroupedOpenApi publicApi() {
//        return GroupedOpenApi.builder()
//                .group("default")
//                .pathsToMatch("/api/**")
//                .build();
//    }


}
