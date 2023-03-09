package com.liang.bbs.rest.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.common.enums.ArticleStateEnum;
import com.liang.bbs.rest.config.login.NoNeedLogin;
import com.liang.bbs.rest.config.swagger.ApiVersion;
import com.liang.bbs.rest.config.swagger.ApiVersionConstant;
import com.liang.bbs.rest.utils.FileLengthUtils;
import com.liang.bbs.user.facade.dto.*;
import com.liang.bbs.user.facade.server.FollowService;
import com.liang.bbs.user.facade.server.LikeCommentService;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.dto.user.UserEmailDTO;
import com.liang.manage.auth.facade.dto.user.UserPasswordDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserRightsDTO;
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

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/user/")
@Api(tags = "用户接口")
public class UserController {
    @Reference
    private UserLevelService userLevelService;

    @Reference
    private FollowService followService;

    @Reference
    private LikeService likeService;

    @Reference
    private LikeCommentService likeCommentService;

    @Reference
    private UserService userService;

    @Reference
    private ArticleService articleService;

    @Autowired
    private FileLengthUtils fileLengthUtils;

    @GetMapping("getCurrentUserRights")
    @ApiOperation(value = "获取当前用户权限")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<UserRightsDTO> getCurrentUserRights() {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userSsoDTOtoUserRightsDTO(currentUser));
    }

    @NoNeedLogin
    @GetMapping("getFollowUsers")
    @ApiOperation(value = "获取关注的用户信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<FollowDTO>> getFollowUsers(FollowSearchDTO followSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(followService.getFollowUsers(followSearchDTO, currentUser));
    }

    @GetMapping("updateFollowState")
    @ApiOperation(value = "更新关注状态")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updateFollowState(@RequestParam Long toUser) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(followService.updateFollowState(currentUser.getUserId(), toUser));
    }

    @GetMapping("updateLikeState")
    @ApiOperation(value = "更新点赞状态")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updateLikeState(@RequestParam Integer articleId) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(likeService.updateLikeState(articleId, currentUser));
    }

    @GetMapping("updateLikeCommentState")
    @ApiOperation(value = "更新评论点赞状态")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updateLikeCommentState(@RequestParam Integer commentId) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(likeCommentService.updateLikeCommentState(commentId, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getHotAuthorsList")
    @ApiOperation(value = "获取热门作者列表")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<UserForumDTO>> getHotAuthorsList(UserSearchDTO userSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userLevelService.getHotAuthorsList(userSearchDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getUserInfo")
    @ApiOperation(value = "获取用户信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<UserForumDTO> getUserInfo(@RequestParam Long userId) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userLevelService.getUserInfo(userId, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getFollowCount")
    @ApiOperation(value = "获取关注/粉丝数量")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<FollowCountDTO> getFollowCount(@RequestParam Long userId) {
        return ResponseResult.success(followService.getFollowCount(userId));
    }

    @PostMapping("uploadUserPicture")
    @ApiOperation(value = "上传用户头像（更新）")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> uploadUserPicture(@RequestParam("picture") MultipartFile picture) throws IOException {
        if (fileLengthUtils.isFileNotTooBig(picture.getBytes())) {
            UserSsoDTO currentUser = UserContextUtils.currentUser();
            return ResponseResult.success(userService.uploadUserPicture(picture.getBytes(), picture.getOriginalFilename(), currentUser));
        } else {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " +
                    CommonUtils.byteConversion(fileLengthUtils.getFileMaxLength()) + " 的图片!");
        }
    }

    @PostMapping("updateUserBasicInfo")
    @ApiOperation(value = "更新用户基本信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updateUserBasicInfo(@RequestBody UserDTO userDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        // 临时方案
        if (currentUser != null) {
            if (currentUser.getUserId() == 1812 || currentUser.getUserId() == 2463) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL,
                        "我是作者大大提供的【测试账号】，不允许修改个人信息！想修改个人信息，去注册自己的账号吧。\uD83D\uDE01 \uD83D\uDE01 \uD83D\uDE01");
            }
        }
        return ResponseResult.success(userService.updateUserBasicInfo(userDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("sendEmailVerifyCode")
    @ApiOperation(value = "发送邮件验证码")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> sendEmailVerifyCode(@RequestParam String email) {
        UserSsoDTO currentUser = new UserSsoDTO();
        if (UserContextUtils.currentUser() == null) {
            // 兼容手机重置密码
            currentUser.setUserId(userService.getByEmail(email).getId());
        } else {
            currentUser = UserContextUtils.currentUser();
        }
        return ResponseResult.success(userService.sendEmailVerifyCode(email, currentUser));
    }

    @NoNeedLogin
    @GetMapping("sendSmsVerifyCode")
    @ApiOperation(value = "发送短信验证码")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> sendSmsVerifyCode(@RequestParam String phone) {
        UserSsoDTO currentUser = new UserSsoDTO();
        if (UserContextUtils.currentUser() == null) {
            // 兼容邮箱重置密码
            currentUser.setUserId(userService.getByPhone(phone).getId());
        } else {
            currentUser = UserContextUtils.currentUser();
        }
        return ResponseResult.success(userService.sendSmsVerifyCode(phone, currentUser));
    }

    @PostMapping("bindEmail")
    @ApiOperation(value = "绑定邮箱")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> bindEmail(@RequestBody UserEmailDTO userEmailDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userService.bindEmail(userEmailDTO, currentUser));
    }

    @PostMapping("bindPhone")
    @ApiOperation(value = "绑定手机")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> bindPhone(@RequestBody UserEmailDTO userEmailDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userService.bindPhone(userEmailDTO, currentUser));
    }

    @PostMapping("untieEmail")
    @ApiOperation(value = "解绑邮箱")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> untieEmail() {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userService.untieEmail(currentUser));
    }

    @PostMapping("untiePhone")
    @ApiOperation(value = "解绑手机")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> untiePhone() {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userService.untiePhone(currentUser));
    }

    @PostMapping("updatePassword")
    @ApiOperation(value = "更新密码")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updatePassword(@RequestBody UserPasswordDTO passwordDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        // 临时方案
        if (currentUser != null) {
            if (currentUser.getUserId() == 1812 || currentUser.getUserId() == 2463) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL,
                        "我是作者大大提供的【测试账号】，不允许修改密码！想修改密码，去注册自己的账号吧。\uD83D\uDE01 \uD83D\uDE01 \uD83D\uDE01");
            }
        }

        return ResponseResult.success(userService.updatePassword(passwordDTO, currentUser));
    }

    @GetMapping("isValidEmail")
    @ApiOperation(value = "邮箱判重")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> isValidEmail(@RequestParam String email) {
        return ResponseResult.success(userService.isValidEmail(email));
    }

    @GetMapping("isValidPhone")
    @ApiOperation(value = "手机判重")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> isValidPhone(@RequestParam String phone) {
        return ResponseResult.success(userService.isValidPhone(phone));
    }

    @NoNeedLogin
    @GetMapping("isValidUser")
    @ApiOperation(value = "用户判重")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> isValidUser(@RequestParam String username) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(userService.isValidUser(username, currentUser));
    }

    @NoNeedLogin
    @PostMapping("isPhoneExist/{phone}")
    @ApiOperation(value = "判断手机是否已经绑定")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> isPhoneExist(@PathVariable String phone) {
        return ResponseResult.success(userService.isPhoneExist(phone));
    }

    @NoNeedLogin
    @PostMapping("isEmailExist/{email}")
    @ApiOperation(value = "判断email是否已经绑定")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> isEmailExist(@PathVariable String email) {
        return ResponseResult.success(userService.isEmailExist(email));
    }

    @NoNeedLogin
    @PostMapping("phoneResetPassword")
    @ApiOperation(value = "手机重置密码")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> phoneResetPassword(@RequestBody UserEmailDTO userEmailDTO) {
        return ResponseResult.success(userService.phoneResetPassword(userEmailDTO));
    }

    @NoNeedLogin
    @PostMapping("emailResetPassword")
    @ApiOperation(value = "邮箱重置密码")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> emailResetPassword(@RequestBody UserEmailDTO userEmailDTO) {
        return ResponseResult.success(userService.emailResetPassword(userEmailDTO));
    }

    @NoNeedLogin
    @GetMapping("getUserOperateCount")
    @ApiOperation(value = "获取用户操作数量（文章、关注、点赞等）")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<UserOperateCountDTO> getUserOperateCount(@RequestParam Long userId,
                                                                   @RequestParam(required = false) ArticleStateEnum articleStateEnum) {
        UserOperateCountDTO userOperateCountDTO = new UserOperateCountDTO();

        // 获取用户文章数量
        userOperateCountDTO.setArticleCount(articleService.getUserArticleCount(userId, articleStateEnum));

        // 获取关注/粉丝数量
        FollowCountDTO followCount = followService.getFollowCount(userId);
        userOperateCountDTO.setFanCount(followCount.getFanCount());
        userOperateCountDTO.setFollowCount(followCount.getFollowCount());

        // 通过用户id获取点赞的文章数量
        userOperateCountDTO.setLikeCount(likeService.getUserTheLikeCount(userId));

        return ResponseResult.success(userOperateCountDTO);
    }

    /**
     * userSsoDTO转UserRightsDTO
     *
     * @param currentUser
     * @return
     */
    private UserRightsDTO userSsoDTOtoUserRightsDTO(UserSsoDTO currentUser) {
        UserRightsDTO userRightsDTO = new UserRightsDTO();
        userRightsDTO.setUserId(currentUser.getUserId());
        userRightsDTO.setUserName(currentUser.getUserName());
        userRightsDTO.setRoles(currentUser.getRoles());

        return userRightsDTO;
    }

}
