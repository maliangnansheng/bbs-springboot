package com.liang.bbs.rest.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ResourceNavigateDTO;
import com.liang.bbs.article.facade.dto.ResourceNavigateSearchDTO;
import com.liang.bbs.article.facade.server.ResourceNavigateService;
import com.liang.bbs.rest.config.login.NoNeedLogin;
import com.liang.bbs.rest.config.swagger.ApiVersion;
import com.liang.bbs.rest.config.swagger.ApiVersionConstant;
import com.liang.bbs.rest.utils.FileLengthUtils;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.utils.CommonUtils;
import com.liang.nansheng.common.web.basic.ResponseResult;
import com.liang.nansheng.common.web.exception.BusinessException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/resource/")
@Api(tags = "资源导航接口")
public class ResourceController {
    @Reference
    private ResourceNavigateService resourceNavigateService;

    @Autowired
    private FileLengthUtils fileLengthUtils;

    @PostMapping("create")
    @ApiOperation(value = "新增资源导航")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> create(@RequestBody ResourceNavigateDTO resourceNavigateDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(resourceNavigateService.create(resourceNavigateDTO, currentUser));
    }

    @PostMapping("/uploadResourceLogo")
    @ApiOperation(value = "上传资源导航logo")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<String> uploadResourceLogo(@RequestParam(value = "logo", required = false) MultipartFile logo) throws IOException {
        if (fileLengthUtils.isFileNotTooBig(logo.getBytes())) {
            return ResponseResult.success(resourceNavigateService.uploadResourceNavigateLogo(logo.getBytes(), logo.getOriginalFilename()));
        } else {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " +
                    CommonUtils.byteConversion(fileLengthUtils.getFileMaxLength()) + " 的图片!");
        }
    }

    @PostMapping("update")
    @ApiOperation(value = "更新资源导航")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> update(@RequestBody ResourceNavigateDTO resourceNavigateDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(resourceNavigateService.update(resourceNavigateDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getList")
    @ApiOperation(value = "获取资源导航")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ResourceNavigateDTO>> getList(ResourceNavigateSearchDTO resourceNavigateSearchDTO) {
        return ResponseResult.success(resourceNavigateService.getList(resourceNavigateSearchDTO));
    }

    @NoNeedLogin
    @GetMapping("getCategorys")
    @ApiOperation(value = "获取资源导航所有类别")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<List<String>> getCategorys() {
        return ResponseResult.success(resourceNavigateService.getCategorys());
    }

    @PostMapping("delete/{id}")
    @ApiOperation(value = "删除资源导航")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> delete(@PathVariable Integer id) {
        return ResponseResult.success(resourceNavigateService.delete(id));
    }

}
