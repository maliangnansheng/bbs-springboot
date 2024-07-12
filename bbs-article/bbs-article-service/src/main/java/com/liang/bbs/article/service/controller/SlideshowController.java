package com.liang.bbs.article.service.controller;

import com.liang.bbs.article.facade.dto.SlideshowDTO;
import com.liang.bbs.article.facade.server.SlideshowService;
import com.liang.bbs.article.service.config.login.NoNeedLogin;
import com.liang.bbs.article.service.config.swagger.ApiVersion;
import com.liang.bbs.article.service.config.swagger.ApiVersionConstant;
import com.liang.nansheng.common.web.basic.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/carousel/")
@Api(tags = "轮播图接口")
public class SlideshowController {
    @Autowired
    private SlideshowService slideshowService;

    @NoNeedLogin
    @GetMapping("getList")
    @ApiOperation(value = "获取轮播图")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<List<SlideshowDTO>> getList() {
        return ResponseResult.success(slideshowService.getList());
    }

}
