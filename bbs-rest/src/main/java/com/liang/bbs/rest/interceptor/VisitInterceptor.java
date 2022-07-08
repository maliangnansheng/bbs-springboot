package com.liang.bbs.rest.interceptor;

import com.liang.bbs.rest.utils.IpUtil;
import com.liang.manage.concern.facade.dto.visit.VisitDTO;
import com.liang.manage.concern.facade.server.VisitService;
import com.liang.nansheng.common.enums.ProjectEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.InetAddress;
import java.util.Map;

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

    @Autowired
    IpUtil ipUtil;

    @Autowired
    private RedissonClient redissonClient;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        VisitDTO visitDTO = new VisitDTO();
        // 访问来自哪个系统
        visitDTO.setProjectId(ProjectEnum.NS_BBS.getCode());
        // ip
        visitDTO.setIp(ipUtil.getIP(request));

        // 加锁是为了防止同一时间记录同一ip的多次访问记录
        RLock lock = redissonClient.getFairLock(visitDTO.getProjectId() + visitDTO.getIp());
        try {
            boolean b = lock.tryLock();
            if (b) {
                // 该ip过期后才重新记录该ip的访问信息
                if (visitService.isIpExpires(visitDTO.getIp(), visitDTO.getProjectId())) {
                    // 操作系统
                    visitDTO.setOs(ipUtil.getOS(request));
                    // 主机
                    visitDTO.setHostName(InetAddress.getLocalHost().getHostName());
                    Map<String, Object> terrainInfo = ipUtil.getTerrainInfo(visitDTO.getIp());
                    // 国家
                    if (terrainInfo.get("country") != null) {
                        visitDTO.setCountry(terrainInfo.get("country").toString());
                    }
                    // 省份
                    if (terrainInfo.get("region") != null) {
                        visitDTO.setProvince(terrainInfo.get("region").toString());
                    }
                    // 城市
                    if (terrainInfo.get("city") != null) {
                        visitDTO.setCity(terrainInfo.get("city").toString());
                    }
                    visitService.create(visitDTO);
                }
            }
        } catch (Exception e) {
            log.error("VisitInterceptor failed!", e);
        } finally {
            // 由当前线程持有 and 锁住状态
            if (lock.isHeldByCurrentThread() && lock.isLocked()) {
                lock.unlock();
            }
        }

        return true;
    }

}
