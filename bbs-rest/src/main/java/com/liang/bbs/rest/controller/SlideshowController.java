package com.liang.bbs.rest.controller;

import com.liang.bbs.article.facade.dto.SlideshowDTO;
import com.liang.bbs.article.facade.server.SlideshowService;
import com.liang.bbs.rest.config.login.NoNeedLogin;
import com.liang.bbs.rest.config.swagger.ApiVersion;
import com.liang.bbs.rest.config.swagger.ApiVersionConstant;
import com.liang.nansheng.common.web.basic.ResponseResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
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
@Tag(name = "轮播图接口")
public class SlideshowController {
    @DubboReference
    private SlideshowService slideshowService;

    @NoNeedLogin
    @GetMapping("getList")
    @Operation(summary = "获取轮播图")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<List<SlideshowDTO>> getList() {
        return ResponseResult.success(slideshowService.getList());
    }

}
