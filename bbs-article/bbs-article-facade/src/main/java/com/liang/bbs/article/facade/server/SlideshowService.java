package com.liang.bbs.article.facade.server;

import com.liang.bbs.article.facade.dto.SlideshowDTO;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface SlideshowService {

    /**
     * 获取轮播图信息
     *
     * @return
     */
    List<SlideshowDTO> getList();

}
