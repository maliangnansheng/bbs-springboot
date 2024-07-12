package com.liang.bbs.article.service.interceptor;

import com.alibaba.fastjson.JSON;
import com.liang.manage.auth.facade.server.UrlAccessRightService;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 后端路径级别的权限控制
 *
 * @author maliangnansheng
 * @date 2021-04-20 22:04
 */
@Slf4j
@Component
public class UrlAccessCheckInterceptor implements HandlerInterceptor {
    @Reference
    UrlAccessRightService urlAccessRightService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        if (currentUser != null) {
            String uri = request.getRequestURI();
            // 得到 @PathVariable 的参数和值
            Object attribute = request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
            Boolean b = urlAccessRightService.checkUrlAccess(currentUser, uri, JSON.toJSONString(attribute));
            if (!b) {
                log.info("访问无权限的接口，uri={}, user={}", uri, currentUser);
                throw BusinessException.build(ResponseCode.URL_ACCESS_REFUSED);
            }
        }
        return true;
    }

}
