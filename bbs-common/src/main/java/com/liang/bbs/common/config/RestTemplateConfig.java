package com.liang.bbs.common.config;


import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.config.RequestConfig;
import org.apache.hc.client5.http.impl.classic.HttpClientBuilder;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.client5.http.impl.io.PoolingHttpClientConnectionManager;
import org.apache.hc.core5.http.io.SocketConfig;
import org.apache.hc.core5.util.Timeout;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * spring用RestTemplate，代替之前的HttpClient
 *
 * @author maliangnansheng
 * @date 2021-04-21 20:32
 */
@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(httpRequestFactory());
        return restTemplate;
    }

    @Bean
    public ClientHttpRequestFactory httpRequestFactory() {
        return new HttpComponentsClientHttpRequestFactory(httpClient());
    }

    @Bean
    public HttpClient httpClient() {
        return httpClientBuilder().build();
    }

    @Bean
    public HttpClientBuilder httpClientBuilder() {
        return HttpClients.custom()
                .setConnectionManager(poolingHttpClientConnectionManager())
                .setDefaultRequestConfig(requestConfig());
    }

    @Bean
    public RequestConfig requestConfig() {
        return RequestConfig.custom()
                .setResponseTimeout(Timeout.ofMilliseconds(10000)) // 设置响应超时时间
                .setConnectionRequestTimeout(Timeout.ofMilliseconds(1000)) // 设置从连接池获取连接的超时时间
                .build();
    }

    @Bean
    public PoolingHttpClientConnectionManager poolingHttpClientConnectionManager() {
        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager();
        SocketConfig socketConfig = SocketConfig.custom()
                .setSoTimeout(Timeout.ofMilliseconds(10000)) // 设置读取超时时间
                .build();
        connectionManager.setDefaultSocketConfig(socketConfig);
        connectionManager.setMaxTotal(200); // 设置最大连接数
        connectionManager.setDefaultMaxPerRoute(200); // 设置每个路由的最大连接数
        return connectionManager;
    }

}
