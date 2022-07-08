package com.liang.bbs.article.service.utils;


import com.liang.nansheng.common.constant.PathConstants;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class FileUploadUtils {
    @Autowired
    QiniuUtils qiniuUtils;

    /**
     * 允许上传的文件后缀名
     */
    @Value("${file.compress.suffix}")
    private String suffix;
    private List<String> suffixList = null;

    @PostConstruct
    private void init() {
        if (StringUtils.isNotEmpty(suffix)) {
            suffixList = Stream.of(suffix.split("(, *)+")).map(s -> s.trim().toLowerCase()).collect(Collectors.toList());
        }
    }

    /**
     * 文件上传到七牛云
     *
     * @param bytes          源文件字节数组
     * @param sourceFileName 源文件名称
     * @param type           类型（头像/...）
     * @return
     */
    public String fileUpload(byte[] bytes, String sourceFileName, String type) {
        // 检查文件后缀名
        if (checkFile(sourceFileName)) {
            throw BusinessException.build(ResponseCode.NOT_MATCH, "只能上传png,jpg,jpeg类型的图片");
        }
        // 构造文件名（type-：给文件加标签-前缀）
        String fileName = type + "-" + generateFileName(sourceFileName);
        // 上传到七牛云
        qiniuUtils.upload(bytes, fileName);

        return qiniuUtils.getDomain() + PathConstants.PATH_SEPARATOR + fileName;
    }

    /**
     * 构造存储文件名
     *
     * @param orginalName 原始文件名
     * @return 返回新的文件名
     */
    public String generateFileName(String orginalName) {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        if (orginalName.length() < 10) {
            // 上传时间_文件名
            return format.format(new Date()) + "_" + orginalName;
        }
        // 上传时间_文件名
        return format.format(new Date()) + "_" + orginalName.substring(orginalName.length() - 10);
    }

    /**
     * 检查文件后缀名
     *
     * @param fileName 文件名
     * @return 通过检查为true，不通过为false
     */
    public boolean checkFile(String fileName) {
        if (CollectionUtils.isEmpty(suffixList)) {
            return false;
        }
        return suffixList.contains(fileName.substring(fileName.indexOf(".")));
    }
}