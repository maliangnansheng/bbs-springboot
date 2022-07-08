package com.liang.bbs.rest.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * ip解析
 *
 * @author 马亮南生
 * @date 2021-04-20 21:49
 */
@Slf4j
@PropertySource({"classpath:ip.properties"})
@Component
public class IpUtil {
    /**
     * ip解析的token
     */
    @Value("${ip.parse.token}")
    private String token;

    /**
     * ip解析的url
     */
    @Value("${ip.parse.url}")
    private String url;

    /**
     * 通过ip获取并构造地域信息
     *
     * @param ip
     * @return
     */
    public Map<String, Object> getTerrainInfo(String ip) {
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(String.format(url, ip)).openConnection();
            conn.setConnectTimeout(5 * 1000);
            conn.setReadTimeout(5 * 1000);
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setUseCaches(false);
            conn.setInstanceFollowRedirects(false);
            conn.setRequestMethod("GET");
            conn.setRequestProperty("token", token);
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                StringBuilder builder = new StringBuilder();
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
                for (String s = br.readLine(); s != null; s = br.readLine()) {
                    builder.append(s);
                }
                br.close();
                return trim(builder.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 一个或多个空格分割字符串
     *
     * @param str
     * @return
     */
    public Map<String, Object> trim(String str) {
        // 正则表达式\s表示匹配任何空白字符，+表示匹配一次或多次。
        String[] arr = str.split("\\s+");
        Map<String, Object> map = new HashMap<>();
        for (int i = 0; i < arr.length; i++) {
            switch (i) {
                case 0:
                    map.put("ip", arr[i]);
                    break;
                case 1:
                    map.put("country", arr[i]);
                    break;
                case 2:
                    map.put("region", arr[i]);
                    break;
                case 3:
                    map.put("city", arr[i]);
                    break;
                case 4:
                    map.put("communication", arr[i]);
                    break;
                default:
                    break;
            }
        }

        return map;
    }

    /**
     * 获取访问者操作系统
     *
     * @param request
     * @return
     */
    public String getOS(HttpServletRequest request) {
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

    /**
     * 获取访问者ip
     *
     * @param request
     * @return
     */
    public String getIP(HttpServletRequest request) {
        String ip = null;
        /**
         * X-Forwarded-For:简称XFF头，它代表客户端，也就是HTTP的请求端真实的IP 只有在通过了HTTP 代理或者负载均衡服务器时才会添加该项
         * 标准格式如下：X-Forwarded-For: client_ip, proxy1_ip, proxy2_ip
         * 此头是可构造的，因此某些应用中应该对获取到的ip进行验证
         */
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
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

}