package com.liang.bbs.article.service.utils;

import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;

/**
 * @author maliang
 * @create 2020-05-26 16:11
 */
@Component
@Data
@Slf4j
public class QiniuUtils {
    /**
     * 需要操作的账号的AccessKey
     */
    @Value("${qiniu.AccessKey}")
    private String AccessKey;
    /**
     * 需要操作的账号的SecretKey
     */
    @Value("${qiniu.SecretKey}")
    private String SecretKey;
    /**
     * 要上传的空间
     */
    @Value("${qiniu.bucket}")
    private String bucket;
    /**
     * 域名
     */
    @Value("${qiniu.domain}")
    private String domain;

    /**
     * 密钥
     */
    private Auth auth;
    /**
     * token
     */
    private String upToken;
    /**
     * 构造一个带指定 Region 对象的配置类（华南）
     */
    private Configuration cfg;
    /**
     * 创建上传对象
     */
    private UploadManager uploadManager;

    @PostConstruct
    private void init() {
        auth = Auth.create(AccessKey, SecretKey);
        upToken = auth.uploadToken(bucket);
        cfg = new Configuration(Region.huanan());
        uploadManager = new UploadManager(cfg);
    }

    /**
     * 字节数组上传
     *
     * @param uploadBytes 文件字节数组
     * @param fileName    七牛保存的文件名
     * @throws IOException
     */
    public void upload(byte[] uploadBytes, String fileName) {
        try {
            // token默认是生命周期是1小时，过期重新生成
            upToken = auth.uploadToken(bucket);
            // 调用put方法上传
            uploadManager.put(uploadBytes, fileName, upToken);
        } catch (Exception e) {
            log.error("七牛云上传异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "图片上传失败!");
        }
    }

}