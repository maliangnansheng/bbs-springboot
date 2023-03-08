package com.liang.bbs.rest.utils;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author maliangnansheng
 * @date 2022-09-08 14:34
 */
@Component
@Data
@Slf4j
public class FileLengthUtils {
    /**
     * 上传源文件允许的最大值不得大于fileLength
     */
    @Value("${file.source.length}")
    private long fileMaxLength;

    /**
     * 文件是否过大
     *
     * @param bytes
     * @return
     */
    public Boolean isFileNotTooBig(byte[] bytes) {
        // 当前文件大小
        long currentFileSize = bytes.length;
        if (currentFileSize <= fileMaxLength) {
            return true;
        } else {
            return false;
        }
    }

}
