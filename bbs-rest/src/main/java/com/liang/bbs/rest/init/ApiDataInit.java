package com.liang.bbs.rest.init;

import com.liang.bbs.common.constant.RedisConstants;
import com.liang.nansheng.common.constant.PathConstants;
import com.liang.nansheng.common.enums.ProjectEnum;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * 路径级别权限信息数据初始化
 *
 * @author 马亮
 * @date 2021/3/8 15:13
 */
@Slf4j
@Component
public class ApiDataInit implements ApplicationContextAware {
    @Autowired
    private RedisTemplate redisTemplate;

    @Value("${server.servlet.context-path}")
    public String contextPath;
    /**
     * k:权限代码，v:权限说明
     */
    public static Map<String, String> apiDescMap = new HashMap<>();

    @Override
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {
        Map<String, Object> beanMap = ctx.getBeansWithAnnotation(Controller.class);
        initData(beanMap);
    }

    /**
     * 初始化所有的接口和请求参数
     *
     * @param beanMap
     */
    private void initData(Map<String, Object> beanMap) {
        if (beanMap != null) {
            for (Object bean : beanMap.values()) {
                Class<?> clz = bean.getClass();
                Method[] methods = clz.getMethods();
                for (Method method : methods) {
                    // 初始化
                    ApiOperation apiOperation = AnnotationUtils.findAnnotation(method, ApiOperation.class);
                    if (apiOperation != null) {
                        // 权限说明
                        String desc = apiOperation.value();
                        // 权限代码
                        String uri = getApiUri(clz, method);
                        apiDescMap.put(uri, desc);
                    }
                }
            }
        }
        String key = RedisConstants.API_KEY + ProjectEnum.NS_BBS.getCode();
        redisTemplate.opsForValue().set(key, apiDescMap);
        log.info("【apiDescMap】 {}", apiDescMap);
    }

    /**
     * 构造请求类型和请求地址并返回
     *
     * @param clz
     * @param method
     * @return
     */
    private String getApiUri(Class<?> clz, Method method) {
        String methodType = "";
        StringBuilder uri = new StringBuilder();

        // Controller类有@RequestMapping的情况
        RequestMapping reqMapping = AnnotationUtils.findAnnotation(clz, RequestMapping.class);
        if (reqMapping != null) {
            uri.append(formatUri(reqMapping.value()[0]));
        }

        // 方法上有@RequestMapping的情况
        GetMapping getMapping = AnnotationUtils.findAnnotation(method, GetMapping.class);
        if (getMapping != null) {
            methodType = RequestMethod.GET.name();
            if (uri.toString().endsWith(PathConstants.PATH_SEPARATOR)) {
                uri.delete(uri.length() - 1, uri.length());
            }
            uri.append(formatUri(getMapping.value()[0]));
        }
        PostMapping postMapping = AnnotationUtils.findAnnotation(method, PostMapping.class);
        if (postMapping != null) {
            methodType = RequestMethod.POST.name();
            if (uri.toString().endsWith(PathConstants.PATH_SEPARATOR)) {
                uri.delete(uri.length() - 1, uri.length());
            }
            uri.append(formatUri(postMapping.value()[0]));
        }
        PutMapping putMapping = AnnotationUtils.findAnnotation(method, PutMapping.class);
        if (putMapping != null) {
            methodType = RequestMethod.PUT.name();
            if (uri.toString().endsWith(PathConstants.PATH_SEPARATOR)) {
                uri.delete(uri.length() - 1, uri.length());
            }
            uri.append(formatUri(putMapping.value()[0]));
        }
        DeleteMapping deleteMapping = AnnotationUtils.findAnnotation(method, DeleteMapping.class);
        if (deleteMapping != null) {
            methodType = RequestMethod.DELETE.name();
            if (uri.toString().endsWith(PathConstants.PATH_SEPARATOR)) {
                uri.delete(uri.length() - 1, uri.length());
            }
            uri.append(formatUri(deleteMapping.value()[0]));
        }
        RequestMapping requestMapping = AnnotationUtils.findAnnotation(method, RequestMapping.class);
        if (requestMapping != null && !StringUtils.hasText(methodType)) {
            if (uri.toString().endsWith(PathConstants.PATH_SEPARATOR)) {
                uri.delete(uri.length() - 1, uri.length());
            }
            uri.append(formatUri(requestMapping.value()[0]));
        }

        return contextPath + uri;
    }

    /**
     * 构造uri
     *
     * @param uri
     * @return
     */
    private String formatUri(String uri) {
        if (uri.startsWith(PathConstants.PATH_SEPARATOR)) {
            return uri;
        }
        return PathConstants.PATH_SEPARATOR + uri;
    }

}