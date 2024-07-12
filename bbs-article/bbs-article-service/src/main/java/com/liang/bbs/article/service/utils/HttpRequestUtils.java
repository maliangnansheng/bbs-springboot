package com.liang.bbs.article.service.utils;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.DigestUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Map;

/**
 * HttpServletRequest相关的工具类
 *
 * @author 马亮南生
 * @date 2021-04-25 22:10
 */
@Slf4j
public class HttpRequestUtils {
    public static String parseCookie(HttpServletRequest request, String cookieName) {
        Cookie cookie = findCookie(request, cookieName);
        if (cookie != null) {
            return cookie.getValue();
        }
        return "default";
    }

    /**
     * 获取cookie中的信息
     *
     * @param request
     * @param cookieName
     * @return
     */
    public static Cookie findCookie(HttpServletRequest request, String cookieName) {
        // 所有的 cookie
        Cookie[] cookies = request.getCookies();
        // 遍历所有的 Cookie 寻找 用户帐号信息与登录次数信息
        for (int i = 0; cookies != null && i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            if (cookieName.equals(cookie.getName())) {
                return cookie;
            }
        }
        return null;
    }

    public static void cleanCookie(HttpServletResponse response, String cookieName) {
        cleanCookie(response, new Cookie(cookieName, null));
    }

    public static void cleanCookie(HttpServletResponse response, Cookie cookie) {
        cookie.setValue(null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }

    /**
     * 重定向
     *
     * @param request
     * @param response
     * @param location
     * @throws IOException
     */
    public static void redirect(HttpServletRequest request, HttpServletResponse response, String location) throws IOException {
        String accept = request.getHeader("accept");
        if (StringUtils.isNotEmpty(accept) && accept.contains(MediaType.APPLICATION_JSON_VALUE)) {
            response.setCharacterEncoding(StandardCharsets.UTF_8.name());
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            PrintWriter writer = response.getWriter();
            JSONObject o = new JSONObject();
            o.put("code", 302);
            JSONObject target = new JSONObject();
            target.put("target", location);
            o.put("data", target);
            o.put("desc", "请先登录!");
            writer.print(o);
            writer.flush();
        } else {
            response.sendRedirect(location);
        }
    }

    public static String createHTTPURLGetParams(Map<String, String> uriVariables) {
        StringBuffer params = new StringBuffer();
        for (String keyStr : uriVariables.keySet()) {
            params.append(keyStr + "=" + uriVariables.get(keyStr) + "&");
        }
        return params.substring(0, params.length() - 1);
    }

    /**
     * @param uriVariables (default)MediaType.APPLICATION_FORM_URLENCODED
     * @return
     */
    public static HttpEntity<MultiValueMap<String, String>> createHTTPURLPOSTParams(Map<String, String> uriVariables) {
        return createHTTPURLPOSTParams(uriVariables, MediaType.APPLICATION_FORM_URLENCODED);
    }

    public static HttpEntity<MultiValueMap<String, String>> createHTTPURLPOSTParams(Map<String, String> uriVariables,
                                                                                    MediaType mediaType) {
        // headers
        HttpHeaders requestHeaders = new HttpHeaders();
        requestHeaders.setContentType(mediaType);
        // body
        MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
        for (Map.Entry<String, String> entry : uriVariables.entrySet()) {
            requestBody.add(entry.getKey(), entry.getValue());
        }
        // HttpEntity
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(
                requestBody, requestHeaders);
        return requestEntity;
    }

    public static String generateSign(Map<String, String> args) {
        String strForSign = createHTTPURLGetParams(args);
        log.debug("生成签名的字符串：{}", strForSign);
        return DigestUtils.md5DigestAsHex(strForSign.getBytes());
    }

    public static boolean isMultiPart(HttpServletRequest req) {
        ServletContext context = req.getSession().getServletContext();
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(context);
        return multipartResolver.isMultipart(req);
    }

    public static Long getParamLong(HttpServletRequest req, String key, long def) {
        String value = req.getParameter(key);
        try {
            return Long.parseLong(value);
        } catch (Exception e) {
        }
        return def;
    }


    public static Integer getParamInteger(HttpServletRequest req, String key, int def) {
        String value = req.getParameter(key);
        try {
            return Integer.parseInt(value);
        } catch (Exception e) {
        }
        return def;
    }


    public static String getParamString(HttpServletRequest req, String key, String def) {
        String value = req.getParameter(key);
        return value == null ? def : value;
    }

}
