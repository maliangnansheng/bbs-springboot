package com.liang.bbs.article.service.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.CommentDTO;
import com.liang.bbs.article.facade.dto.CommentSearchDTO;
import com.liang.bbs.article.facade.server.CommentService;
import com.liang.bbs.article.service.config.login.NoNeedLogin;
import com.liang.bbs.article.service.config.swagger.ApiVersion;
import com.liang.bbs.article.service.config.swagger.ApiVersionConstant;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.web.basic.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/comment/")
@Api(tags = "评论接口")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @NoNeedLogin
    @GetMapping("getCommentByArticleId")
    @ApiOperation(value = "获取文章的评论信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<List<CommentDTO>> getCommentByArticleId(CommentSearchDTO commentSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(commentService.getCommentByArticleId(commentSearchDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getLatestComment")
    @ApiOperation(value = "获取最新评论信息")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<CommentDTO>> getLatestComment(CommentSearchDTO commentSearchDTO) {
        return ResponseResult.success(commentService.getLatestComment(commentSearchDTO));
    }

    @PostMapping("create")
    @ApiOperation(value = "创建评论")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> create(@RequestBody CommentDTO commentDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(commentService.create(commentDTO, currentUser));
    }

    @PostMapping("delete/{commentId}")
    @ApiOperation(value = "删除评论")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> delete(@PathVariable Integer commentId) {
        return ResponseResult.success(commentService.delete(commentId));
    }

}
