package com.liang.bbs.article.service.controller;

import com.liang.bbs.article.facade.server.UserLevelService;
import com.liang.bbs.article.service.config.login.NoNeedLogin;
import com.liang.bbs.article.service.config.swagger.ApiVersion;
import com.liang.bbs.article.service.config.swagger.ApiVersionConstant;
import com.liang.bbs.article.service.utils.HttpRequestUtils;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.dto.user.UserLoginDTO;
import com.liang.manage.auth.facade.dto.user.UserTokenDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.constant.AuthSystemConstants;
import com.liang.nansheng.common.constant.TimeoutConstants;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.basic.ResponseResult;
import com.liang.nansheng.common.web.exception.BusinessException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseCookie;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * @author maliangnansheng
 * @date 2021/4/25 15:16
 */
@Slf4j
@RestController
@RequestMapping("/bbs/sso/")
@Api(tags = "用户统一登录接口")
@CrossOrigin(origins = "*")
public class LoginController {
    @Reference
    private UserService userService;

    @Autowired
    private UserLevelService userLevelService;

    @Value("${cookie.domain}")
    private String domain;

    @NoNeedLogin
    @PostMapping("register")
    @ApiOperation(value = "用户注册")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<UserTokenDTO> register(@Valid @RequestBody UserDTO userDTO, HttpServletResponse response) {
        UserTokenDTO userTokenDTO = userService.register(userDTO);
        // 增加cookie
        addCookie(userTokenDTO.getToken(), response);
        // 创建用户等级信息
        userLevelService.create(userTokenDTO.getUserId());
        return ResponseResult.success(userTokenDTO);
    }

    @NoNeedLogin
    @PostMapping("login")
    @ApiOperation(value = "用户登录")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<UserTokenDTO> login(@RequestBody UserLoginDTO userLoginDTO, HttpServletResponse response) {
        UserTokenDTO userTokenDTO = userService.login(userLoginDTO);
        // 增加cookie
        addCookie(userTokenDTO.getToken(), response);
        return ResponseResult.success(userTokenDTO);
    }

    @NoNeedLogin
    @GetMapping("logout")
    @ApiOperation(value = "用户登出")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 获取cookie中的信息
            Cookie ssoAccount = HttpRequestUtils.findCookie(request, AuthSystemConstants.NS_ACCOUNT_SSO_COOKIE);
            if (ssoAccount != null) {
                userService.logout(ssoAccount.getValue());
            }
            // 删除cookie
            clearCookie(response);
        } catch (Exception e) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "退出登录失败!");
        }

        return ResponseResult.success(true);
    }

    /**
     * 增加cookie
     *
     * @param token
     * @param response
     */
    private void addCookie(String token, HttpServletResponse response) {
        // 设置Cookie, 业务方可自行设置Cookie的name值
        ResponseCookie cookie = ResponseCookie.from(AuthSystemConstants.NS_ACCOUNT_SSO_COOKIE, token)
                .maxAge(TimeoutConstants.NS_SSO_TIMEOUT)
                .domain(domain)
                .path("/")
                .httpOnly(true)
//                .secure(true)
//                .sameSite("None")
                .build();
        response.addHeader("Set-Cookie", cookie.toString());
    }

    /**
     * 删除cookie
     *
     * @param response
     */
    private void clearCookie(HttpServletResponse response) {
        // 设置Cookie, 业务方可自行设置Cookie的name值
        ResponseCookie cookie = ResponseCookie.from(AuthSystemConstants.NS_ACCOUNT_SSO_COOKIE, "")
                .maxAge(0)
                .domain(domain)
                .path("/")
                .httpOnly(true)
//                .secure(true)
//                .sameSite("None")
                .build();
        response.addHeader("Set-Cookie", cookie.toString());
    }

}
