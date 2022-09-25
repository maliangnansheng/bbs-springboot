package com.liang.bbs.rest.interceptor;

import com.liang.bbs.rest.utils.IpUtil;
import com.liang.manage.concern.facade.dto.visit.VisitDTO;
import com.liang.manage.concern.facade.server.VisitService;
import com.liang.nansheng.common.enums.ProjectEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户头像拦截器
 *
 * @author 马亮南生
 * @date 2021-04-20 22:04
 */
@Slf4j
@Component
public class VisitInterceptor implements HandlerInterceptor {
    @Reference
    VisitService visitService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            VisitDTO visitDTO = new VisitDTO();
            // 访问来自哪个系统
            visitDTO.setProjectId(ProjectEnum.NS_BBS.getCode());
            // ip
            visitDTO.setIp(IpUtil.getIP(request));
            // 操作系统
            visitDTO.setOs(IpUtil.getOS(request));
            visitService.create(visitDTO);
        } catch (Exception e) {
            log.error("VisitInterceptor异常：", e);
        }

        return true;
    }

}
