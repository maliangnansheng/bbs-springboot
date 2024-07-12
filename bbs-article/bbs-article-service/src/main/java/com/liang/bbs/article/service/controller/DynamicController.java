package com.liang.bbs.article.service.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.DynamicDTO;
import com.liang.bbs.article.facade.server.DynamicService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/dynamic/")
@Api(tags = "动态接口")
public class DynamicController {
    @Autowired
    private DynamicService dynamicService;

    @NoNeedLogin
    @GetMapping("getList")
    @ApiOperation(value = "获取动态")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<DynamicDTO>> getList(@RequestParam Long userId, @RequestParam Integer currentPage, @RequestParam Integer pageSize) {
        return ResponseResult.success(dynamicService.getByUserId(userId, currentPage, pageSize));
    }

}
