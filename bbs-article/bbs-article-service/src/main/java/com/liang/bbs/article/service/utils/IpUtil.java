package com.liang.bbs.article.service.utils;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;
import java.util.StringTokenizer;

/**
 * ip解析
 *
 * @author maliangnansheng
 * @date 2021-04-20 21:49
 */
@Slf4j
public class IpUtil {

    /**
     * 获取访问者ip
     *
     * @param request
     * @return
     */
    public static String getIP(HttpServletRequest request) {
        /**
         * X-Forwarded-For:简称XFF头，它代表客户端，也就是HTTP的请求端真实的IP 只有在通过了HTTP 代理或者负载均衡服务器时才会添加该项
         * 标准格式如下：X-Forwarded-For: client_ip, proxy1_ip, proxy2_ip
         * 此头是可构造的，因此某些应用中应该对获取到的ip进行验证
         */
        String ip = request.getHeader("X-Real-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        /**
         * 在多级代理网络中，直接用getHeader("x-forwarded-for")可能获取到的是unknown信息
         * 此时需要获取代理代理服务器重新包装的HTTP头信息，
         */
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }

        return ip;
    }

    /**
     * 获取访问者操作系统
     *
     * @param request
     * @return
     */
    public static String getOS(HttpServletRequest request) {
        String agent = request.getHeader("User-Agent");
        log.info("User-Agent: {}", agent);
        StringTokenizer st = new StringTokenizer(agent, ";");
        st.nextToken();
        // 得到访问者的操作系统名
        String os = st.nextToken();

        // 优化操作系统名 win
        boolean isWin2K = agent.contains("Windows NT 5.0") || agent.contains("Windows 2000");
        if (isWin2K) {
            os = "Windows 2000";
        }
        boolean isWinXP = agent.contains("Windows NT 5.1") || agent.contains("Windows XP");
        if (isWinXP) {
            os = "Windows XP";
        }
        boolean isWin2003 = agent.contains("Windows NT 5.2") || agent.contains("Windows 2003");
        if (isWin2003) {
            os = "Windows 2003";
        }
        boolean isWinVista = agent.contains("Windows NT 6.0") || agent.contains("Windows Vista");
        if (isWinVista) {
            os = "Windows Vista";
        }
        boolean isWin7 = agent.contains("Windows NT 6.1") || agent.contains("Windows 7");
        if (isWin7) {
            os = "Windows 7";
        }
        boolean isWin8 = agent.contains("Windows NT 6.2") || agent.contains("Windows NT 6.3") || agent.contains("Windows 8");
        if (isWin8) {
            os = "Windows 8";
        }
        boolean isWin10 = agent.contains("Windows NT 10") || agent.contains("Windows 10");
        if (isWin10) {
            os = "Windows 10";
        }
        // mac
        boolean mac = agent.contains("Mac OS X");
        if (mac) {
            os = "Mac OS X";
        }
        // linux
        boolean linux = agent.contains("Linux x86_64");
        if (linux) {
            os = "Linux x86_64";
        }
        // Android 5.0) AppleWebKit
        boolean android = agent.contains("Android 5.0) AppleWebKit");
        if (android) {
            os = "Android 5.0";
        }

        // 特殊处理U的情况
        if ("U".equalsIgnoreCase(os.trim())) {
            os = st.nextToken();
        }

        return os;
    }

}
