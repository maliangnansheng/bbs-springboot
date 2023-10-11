package com.liang.bbs.rest.config;

import com.liang.bbs.rest.interceptor.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * 配置类
 *
 * @author maliangnansheng
 * @date 2021-04-20 21:49
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    /**
     * 不需要登录的接口
     */
    private static final String[] NOT_LOGIN_URLS = {
            "/swagger-resources/**",
            "/webjars/**",
            "/v2/**",
            "/doc.html/**",
            "/favicon.ico/**",
            "/error/**"
    };

    @Autowired
    private RequestMonitor requestMonitor;

    @Autowired
    private LoginInterceptor loginInterceptor;

    @Autowired
    private UrlAccessCheckInterceptor urlAccessCheckInterceptor;

    @Autowired
    private UserPictureInterceptor userPictureInterceptor;

    @Autowired
    private VisitInterceptor visitInterceptor;

    @Autowired
    private NotifyInterceptor notifyInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 监控请求耗时等信息拦截器
        registry.addInterceptor(requestMonitor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

        // 用户有效性验证拦截器
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

        // 后端路径级别的访问权限控制
        registry.addInterceptor(urlAccessCheckInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

        // 用户头像拦截器
        registry.addInterceptor(userPictureInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

        // 访问记录拦截器
        registry.addInterceptor(visitInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

        // 消息通知拦截器
        registry.addInterceptor(notifyInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(NOT_LOGIN_URLS);

    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // doc.html文件，都会去后面配置的路径下查找资源
        registry.addResourceHandler("doc.html")
                // 要开放的资源
                .addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }

}
