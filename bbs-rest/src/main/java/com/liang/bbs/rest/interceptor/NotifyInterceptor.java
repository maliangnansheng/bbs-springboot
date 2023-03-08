package com.liang.bbs.rest.interceptor;

import com.liang.manage.concern.facade.server.NotifyService;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.constant.HeaderConstants;
import com.liang.nansheng.common.enums.NotifyTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户头像拦截器
 *
 * @author maliangnansheng
 * @date 2021-04-20 22:04
 */
@Slf4j
@Component
public class NotifyInterceptor implements HandlerInterceptor {
    @Reference
    NotifyService notifyService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        if (currentUser != null) {
            response.addHeader(HeaderConstants.SYSTEM_NOTIFY_HEADER,
                    String.valueOf(notifyService.getNotReadNotifyCount(currentUser.getUserId(), NotifyTypeEnum.NS_SYSTEM_NOTIFY.getCode())));
            response.addHeader(HeaderConstants.TASK_NOTIFY_HEADER,
                    String.valueOf(notifyService.getNotReadNotifyCount(currentUser.getUserId(), NotifyTypeEnum.NS_TASK_REMINDER.getCode())));
        }

        return true;
    }

}