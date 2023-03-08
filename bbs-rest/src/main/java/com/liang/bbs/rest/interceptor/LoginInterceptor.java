package com.liang.bbs.rest.interceptor;

import com.liang.bbs.rest.config.login.NoNeedLogin;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.constant.AuthSystemConstants;
import com.liang.nansheng.common.utils.HttpRequestUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;


/**
 * 验证用户的有效性，无效则重定向到登录页面进行登录
 *
 * @author maliangnansheng
 * @date 2021-04-25 22:10
 */
@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Reference
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserSsoDTO currentUser = null;
        // 获取cookie中的信息
        Cookie ssoAccount = HttpRequestUtils.findCookie(request, AuthSystemConstants.NS_ACCOUNT_SSO_COOKIE);

        // 使用用户名密码从sso登录
        if (ssoAccount != null) {
            currentUser = sso(request, ssoAccount);
        }
        // 用户上下文设置添加用户信息（线程变量）
        UserContextUtils.setCurrentUser(currentUser);

        // 无需登录
        if (handler instanceof HandlerMethod) {
            // 方法上的注解
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            NoNeedLogin methodAnnotation = handlerMethod.getMethodAnnotation(NoNeedLogin.class);
            if (Objects.nonNull(methodAnnotation)) {
                return true;
            }
            // 类上的注解
            Class<?> clazz = handlerMethod.getBeanType();
            if (Objects.nonNull(AnnotationUtils.findAnnotation(clazz, NoNeedLogin.class))) {
                return true;
            }
        }

        // 获取用户信息失败，跳转登录页面
        if (currentUser == null) {
            // 获取当前页面地址
            String referer = request.getHeader("referer");
            if (referer.contains("?")) {
                referer = referer.substring(0, referer.indexOf("?"));
            }
            String redirect = userService.innerLoginUrl(referer);
            log.info("登录跳转[{}]", redirect);
            HttpRequestUtils.redirect(request, response, redirect);
            return false;
        }
        return true;
    }

    /**
     * sso鉴权处理，获取登录用户信息
     *
     * @param request
     * @return
     * @throws IOException
     */
    private UserSsoDTO sso(HttpServletRequest request, Cookie cookie) throws Exception {
        String token = cookie.getValue();
        if (StringUtils.isEmpty(token)) {
            return null;
        }
        // 校验Token是否正确
        if (!userService.verifyToken(token)) {
            return null;
        }
        // token已过期
        if (userService.isExpired(token)) {
            return null;
        }

        // 通过token获取用户信息
        return userService.getUserSsoDTOByToken(token);
    }

}

