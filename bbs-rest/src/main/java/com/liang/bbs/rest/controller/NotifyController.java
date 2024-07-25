package com.liang.bbs.rest.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.rest.config.swagger.ApiVersion;
import com.liang.bbs.rest.config.swagger.ApiVersionConstant;
import com.liang.manage.concern.facade.dto.notify.NotifyOutDTO;
import com.liang.manage.concern.facade.dto.notify.NotifySearchDTO;
import com.liang.manage.concern.facade.server.NotifyService;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.web.basic.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2021-06-18 22:53
 */
@Slf4j
@RestController
@RequestMapping("/bbs/notify/")
@Api(tags = "通知消息接口")
public class NotifyController {
    @Reference
    private NotifyService notifyService;

    /**
     * 加上@RequestParam，type必须要传值
     *
     * @param type
     * @return
     */
    @PostMapping("haveRead")
    @ApiOperation(value = "全部已读")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> haveRead(Integer type) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(notifyService.haveRead(currentUser, type));
    }

    @PostMapping("markRead")
    @ApiOperation(value = "标记已读")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> markRead(@RequestBody List<Integer> notifyIds) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(notifyService.markRead(notifyIds, currentUser));
    }

    @GetMapping("getList")
    @ApiOperation(value = "分页获取通知信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<NotifyOutDTO>> getList(NotifySearchDTO notifySearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(notifyService.getList(notifySearchDTO, currentUser));
    }

}
