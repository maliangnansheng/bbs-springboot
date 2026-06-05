package com.liang.bbs.rest.utils;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;
import java.util.regex.Pattern;

/**
 * Http Host 头解析工具类
 * 用于从请求中提取纯净的根域名或IP地址
 *
 * <p>主要功能：
 * <ul>
 *     <li>去除端口号</li>
 *     <li>识别并保留IP地址（IPv4/IPv6）</li>
 *     <li>提取域名的根域名部分（最后两段）</li>
 * </ul>
 *
 * @author maliangnansheng
 * @date 2026-04-22 16:05
 */
@Slf4j
public class HostUtils {
    /**
     * 私有构造方法，禁止实例化
     */
    private HostUtils() {
        throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
    }

    // ==================== 常量定义 ====================

    /**
     * IPv4 地址正则表达式
     */
    private static final Pattern IPV4_PATTERN = Pattern.compile(
            "^((25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.){3}(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)$"
    );

    /**
     * 左方括号（IPv6 地址起始标记）
     */
    private static final char BRACKET_LEFT = '[';

    /**
     * 右方括号（IPv6 地址结束标记）
     */
    private static final char BRACKET_RIGHT = ']';

    /**
     * 冒号（端口分隔符）
     */
    private static final char COLON = ':';

    /**
     * 点号（域名分隔符）
     */
    private static final String DOT = "\\.";

    /**
     * 空字符串
     */
    private static final String EMPTY_STRING = "";

    /**
     * Host 请求头名称
     */
    private static final String HEADER_HOST = "Host";

    // ==================== 公共方法 ====================

    /**
     * 从 HttpServletRequest 中解析纯净的 Host
     *
     * @param request HttpServletRequest 对象
     * @return 解析后的纯净 Host，若解析失败返回空字符串
     */
    public static String getPureHost(HttpServletRequest request) {
        return Optional.ofNullable(request)
                // 修复：明确传入 Host 头名称
                .map(req -> req.getHeader(HEADER_HOST))
                .map(String::trim)
                .filter(host -> !host.isEmpty())
                .map(HostUtils::removePortSafely)
                .map(HostUtils::processHostByType)
                .orElse(EMPTY_STRING);
    }

    // ==================== 私有方法（按调用顺序排列） ====================

    /**
     * 根据 Host 类型进行处理
     *
     * @param host 已去除端口的 Host
     * @return 处理后的结果
     */
    private static String processHostByType(String host) {
        if (isIpv4Address(host) || host.startsWith(String.valueOf(BRACKET_LEFT))) {
            return host;
        }
        return extractRootDomain(host);
    }

    /**
     * 安全地移除端口号
     *
     * @param host 原始 Host 字符串
     * @return 移除端口后的 Host
     */
    private static String removePortSafely(String host) {
        // 处理 IPv6 带端口的情况，例如：[::1]:8080
        if (host.startsWith(String.valueOf(BRACKET_LEFT))) {
            return removePortFromIpv6(host);
        }

        // 处理 IPv4 或域名带端口的情况
        return removePortFromNormalHost(host);
    }

    /**
     * 从 IPv6 地址中移除端口
     *
     * @param host IPv6 Host 字符串
     * @return 移除端口后的 IPv6 地址
     */
    private static String removePortFromIpv6(String host) {
        int closeBracketIndex = host.indexOf(BRACKET_RIGHT);
        if (closeBracketIndex > 0 && isPortFollowed(host, closeBracketIndex)) {
            return host.substring(0, closeBracketIndex + 1);
        }
        return host;
    }

    /**
     * 从普通 Host（IPv4 或域名）中移除端口
     *
     * @param host 普通 Host 字符串
     * @return 移除端口后的 Host
     */
    private static String removePortFromNormalHost(String host) {
        int lastColonIndex = host.lastIndexOf(COLON);
        if (lastColonIndex > 0) {
            String maybePort = host.substring(lastColonIndex + 1);
            if (isNumeric(maybePort)) {
                return host.substring(0, lastColonIndex);
            }
        }
        return host;
    }

    /**
     * 判断右方括号后是否紧跟端口号
     *
     * @param host              Host 字符串
     * @param closeBracketIndex 右方括号位置
     * @return 是否紧跟端口号
     */
    private static boolean isPortFollowed(String host, int closeBracketIndex) {
        return host.length() > closeBracketIndex + 1
                && host.charAt(closeBracketIndex + 1) == COLON;
    }

    /**
     * 提取根域名（最后两段）
     *
     * @param host 完整域名
     * @return 根域名
     */
    private static String extractRootDomain(String host) {
        String[] parts = host.split(DOT);
        int length = parts.length;

        if (length <= 1) {
            return host;
        }

        // 注意：如需支持 .com.cn/.co.uk 等多级顶级域名，请在此处扩展逻辑
        return parts[length - 2] + "." + parts[length - 1];
    }

    /**
     * 判断字符串是否为合法的 IPv4 地址
     *
     * @param ip 待判断的字符串
     * @return 是否为 IPv4 地址
     */
    private static boolean isIpv4Address(String ip) {
        return Optional.ofNullable(ip)
                .filter(IPV4_PATTERN.asPredicate())
                .isPresent();
    }

    /**
     * 判断字符串是否为纯数字
     *
     * @param str 待判断的字符串
     * @return 是否为纯数字
     */
    private static boolean isNumeric(String str) {
        return Optional.ofNullable(str)
                .filter(s -> !s.isEmpty())
                .map(s -> s.chars().allMatch(Character::isDigit))
                .orElse(false);
    }
}
