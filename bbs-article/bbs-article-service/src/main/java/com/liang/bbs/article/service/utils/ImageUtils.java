package com.liang.bbs.article.service.utils;

import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * google使用的开源的工具类-Thumbnailator
 * 问题：经过使用后的反馈，这个工具无法正确压缩出png格式的图片
 * 解决：建议将图片压缩后的格式设置成jpg来解决；.outputFormat("jpg")
 *
 * @author 马亮
 * @date 2021/4/26 14:36
 */
@Component
@Data
@Slf4j
public class ImageUtils {
    /**
     * 上传源文件允许的最大值不得大于fileLength
     */
    @Value("${file.source.length}")
    private long fileLength;

    /**
     * 压缩后的图片大小不得大于imgLength
     */
    @Value("${file.compress.length}")
    private int imgLength;

    /**
     * 需要压缩的图片格式
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
     * 按照比例进行缩放图片
     *
     * @param sourceImg 原图片
     * @return 处理后的图片
     */
    public byte[] pictureScale(byte[] sourceImg) {
        // 处理后的图片
        byte[] outBytes = new byte[imgLength];
        try (ByteArrayInputStream inputStream = new ByteArrayInputStream(sourceImg);
             ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ) {
            // 原图片超过最大限制时才压缩
            if (sourceImg.length > imgLength) {
                log.info("图片压缩中...");
                Thumbnails.of(inputStream)
                        .scale(0.9f)
                        .outputQuality(0.7f)
                        .toOutputStream(outputStream);
                // 压缩结果不满足要求继续压缩
                while (outputStream.toByteArray().length > imgLength) {
                    Thumbnails.of(new ByteArrayInputStream(outputStream.toByteArray()))
                            .scale(0.9f)
                            .outputQuality(0.7f)
                            .toOutputStream(outputStream);
                }
                outBytes = outputStream.toByteArray();
                log.info("图片压缩完成");
            } else {
                inputStream.read(outBytes);
            }
        } catch (Exception e) {
            log.error("图片【按照比例进行缩放】异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "图片上传失败!");
        }

        return outBytes;
    }

    /**
     * 图片裁剪
     *
     * @param sourceImg 原图片
     * @return 处理后的图片
     */
    public byte[] pictureCut(byte[] sourceImg) {
        // 处理后的图片
        byte[] outBytes = new byte[imgLength];
        try (ByteArrayInputStream inputStream = new ByteArrayInputStream(sourceImg);
             ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ) {
            // 图片中心150*150的区域
            Thumbnails.of(inputStream)
                    .sourceRegion(Positions.CENTER, 10000, 10000)
                    .size(150, 150)
                    .keepAspectRatio(false)
                    .toOutputStream(outputStream);
            outBytes = outputStream.toByteArray();
            log.info("图片剪切完成");
        } catch (Exception e) {
            log.error("图片【剪切】异常！", e);
        }

        return outBytes;
    }

    /**
     * 按指定大小进行缩放（比例不变）
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    public void getSize(String sourceImg, String resultImg) throws IOException {
        /*
         * size(width,height) 若图片横比200小，高比300小，不变
         * 若图片横比200小，高比300大，高缩小到300，图片比例不变 若图片横比200大，高比300小，横缩小到200，图片比例不变
         * 若图片横比200大，高比300大，图片按比例缩小，横为200或高为300
         */
        Thumbnails.of(sourceImg).size(200, 300).toFile(resultImg);
    }

    /**
     * 不按照比例，指定大小进行缩放
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    public void getKeepAspectRatio(String sourceImg, String resultImg) throws IOException {
        Thumbnails.of(sourceImg).size(120, 120).keepAspectRatio(false).toFile(resultImg);
    }

    /**
     * 旋转
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    private void getRotate(String sourceImg, String resultImg) throws IOException {
        Thumbnails.of(sourceImg).size(1280, 1024).rotate(90).toFile(resultImg);
    }

    /**
     * 水印
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @param watermark 水印图路径
     * @throws IOException
     */
    public void getWatermark(String sourceImg, String resultImg, String watermark) throws IOException {
        Thumbnails.of(sourceImg).size(1280, 1024).watermark(Positions.BOTTOM_RIGHT, ImageIO.read(new File(watermark)), 0.5f)
                .outputQuality(0.8f).toFile(resultImg);
    }

    /**
     * 转化图像格式
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    public void getFormat(String sourceImg, String resultImg) throws IOException {
        Thumbnails.of(sourceImg).size(1280, 1024).outputFormat("gif").toFile(resultImg);
    }

    /**
     * 输出到OutputStream
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    public void getOutputStream(String sourceImg, String resultImg) throws IOException {
        OutputStream os = new FileOutputStream(resultImg);
        Thumbnails.of(sourceImg).size(1280, 1024).toOutputStream(os);
    }

    /**
     * 输出到BufferedImage
     *
     * @param sourceImg 原图片路径
     * @param resultImg 处理后的图片路径
     * @throws IOException
     */
    public void getBufferedImage(String sourceImg, String resultImg) throws IOException {
        BufferedImage thumbnail = Thumbnails.of(sourceImg).size(1280, 1024).asBufferedImage();
        ImageIO.write(thumbnail, "jpg", new File(resultImg));
    }
}