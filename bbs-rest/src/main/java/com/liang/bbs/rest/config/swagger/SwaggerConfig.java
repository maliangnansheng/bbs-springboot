package com.liang.bbs.rest.config.swagger;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Arrays;
import java.util.Optional;
import java.util.function.Predicate;

/**
 * @author 马亮南生
 * @date 2021-04-20 22:39
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Value("${swagger.show}")
    private Boolean swaggerShow;

    /**
     * 默认版本接口
     *
     * @return
     */
    @Bean
    public Docket createRestApi() {
        Predicate<RequestHandler> predicate = requestHandler -> {
            Class<?> declaringClass = requestHandler.declaringClass();
            if (declaringClass == BasicErrorController.class) {
                return false;
            }
            if (declaringClass.isAnnotationPresent(Controller.class)) {
                return true;
            }
            if (declaringClass.isAnnotationPresent(RestController.class)) {
                return true;
            }
            if (requestHandler.isAnnotatedWith(ResponseBody.class)) {
                return true;
            }
            return false;
        };
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo())
                .enable(swaggerShow)
                .groupName("all")
//                .useDefaultResponseMessages(false)
                .select()
                .apis(predicate)
                .build();
    }

    /**
     * V1.0.0版本接口
     *
     * @return
     */
    @Bean
    Docket version300() {
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo())
                .enable(swaggerShow)
                .groupName(ApiVersionConstant.V_300)
                .select()
                .apis(input -> {
                    Optional<ApiVersion> apiVersionOptional = input.findAnnotation(ApiVersion.class);
                    if (apiVersionOptional.isPresent()) {
                        if (Arrays.asList(apiVersionOptional.get().group()).contains(ApiVersionConstant.V_300)) {
                            return true;
                        }
                    }
                    return false;
                })
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("南生论坛 Restful API 文档")
                // 展示最新版本
                .version(ApiVersionConstant.V_LATEST)
                .description("南生论坛，是南生系列元老级系统，也是梦开始的地方！")
                .contact(new Contact("马亮南生",
                        "https://github.com/maliangnansheng",
                        "924818949@qq.com"))
                .build();
    }
}
