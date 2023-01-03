package com.liang.bbs.rest.controller;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ArticleCountDTO;
import com.liang.bbs.article.facade.dto.ArticleDTO;
import com.liang.bbs.article.facade.dto.ArticleSearchDTO;
import com.liang.bbs.article.facade.dto.TotalDTO;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.common.enums.ArticleStateEnum;
import com.liang.bbs.rest.config.login.NoNeedLogin;
import com.liang.bbs.rest.config.swagger.ApiVersion;
import com.liang.bbs.rest.config.swagger.ApiVersionConstant;
import com.liang.bbs.rest.utils.FileLengthUtils;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.nansheng.common.auth.UserContextUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.utils.CommonUtils;
import com.liang.nansheng.common.web.basic.ResponseResult;
import com.liang.nansheng.common.web.exception.BusinessException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

/**
 * @author 马亮
 * @date 2022/4/6 14:28
 */
@Slf4j
@RestController
@RequestMapping("/bbs/article/")
@Api(tags = "文章接口")
public class ArticleController {
    @Reference
    private ArticleService articleService;

    @Autowired
    private FileLengthUtils fileLengthUtils;

    @NoNeedLogin
    @GetMapping("getList")
    @ApiOperation(value = "获取文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ArticleDTO>> getList(ArticleSearchDTO articleSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.getList(articleSearchDTO, currentUser, ArticleStateEnum.enable));
    }

    @NoNeedLogin
    @GetMapping("getPersonalArticles")
    @ApiOperation(value = "获取个人发布的文章（null=所有）")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ArticleDTO>> getPersonalArticles(ArticleSearchDTO articleSearchDTO, @RequestParam(required = false) ArticleStateEnum articleStateEnum) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        if (currentUser != null && currentUser.getUserId().equals(articleSearchDTO.getCreateUser())) {
            articleStateEnum= null;
        }
        return ResponseResult.success(articleService.getList(articleSearchDTO, currentUser, articleStateEnum));
    }

    @GetMapping("getPendingReviewArticles")
    @ApiOperation(value = "获取待审核的文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ArticleDTO>> getPendingReviewArticles(ArticleSearchDTO articleSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.getPendingReviewArticles(articleSearchDTO, currentUser));
    }

    @GetMapping("getDisabledArticles")
    @ApiOperation(value = "获取禁用的文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ArticleDTO>> getDisabledArticles(ArticleSearchDTO articleSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.getDisabledArticles(articleSearchDTO, currentUser));
    }

    @PostMapping("/updateState")
    @ApiOperation(value = "修改文章审批状态")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> updateState(@RequestBody ArticleDTO articleDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.updateState(articleDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getLikesArticle")
    @ApiOperation(value = "获取点赞过的文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<PageInfo<ArticleDTO>> getLikesArticle(LikeSearchDTO likeSearchDTO) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.getLikesArticle(likeSearchDTO, currentUser));
    }

    @NoNeedLogin
    @GetMapping("getArticleCommentVisitTotal")
    @ApiOperation(value = "获取文章评论访问总数")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<TotalDTO> getArticleCommentVisitTotal() {
        return ResponseResult.success(articleService.getArticleCommentVisitTotal());
    }

    @NoNeedLogin
    @GetMapping("getById")
    @ApiOperation(value = "获取文章详情")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<ArticleDTO> getById(@RequestParam Integer id, @RequestParam(required = false) Boolean isPv) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        List<ArticleDTO> articleDTOS = articleService.getByIds(Collections.singletonList(id), isPv, currentUser);
        if (CollectionUtils.isEmpty(articleDTOS)) {
            return ResponseResult.build(ResponseCode.NOT_EXISTS, null);
        }
        return ResponseResult.success(articleDTOS.get(0));
    }

    @PostMapping("/create")
    @ApiOperation(value = "写文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> create(@RequestParam(value = "file", required = false) MultipartFile picture,
                                          ArticleDTO articleDTO, @RequestParam List<Integer> labelIds) throws IOException {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        // 无配图
        if (picture == null) {
            return ResponseResult.success(articleService.create(articleDTO, labelIds, currentUser));
        }

        if (fileLengthUtils.isFileNotTooBig(picture.getBytes())) {
            return ResponseResult.success(articleService.create(picture.getBytes(), picture.getOriginalFilename(), articleDTO, labelIds, currentUser));
        } else {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " +
                    CommonUtils.byteConversion(fileLengthUtils.getFileMaxLength()) + " 的图片!");
        }
    }

    @PostMapping("/update")
    @ApiOperation(value = "更新文章")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> update(@RequestParam(value = "file", required = false) MultipartFile picture,
                                          ArticleDTO articleDTO, @RequestParam List<Integer> labelIds) throws IOException {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        // 无配图
        if (picture == null) {
            return ResponseResult.success(articleService.update(articleDTO, labelIds, currentUser));
        }

        if (fileLengthUtils.isFileNotTooBig(picture.getBytes())) {
            return ResponseResult.success(articleService.update(picture.getBytes(), picture.getOriginalFilename(), articleDTO, labelIds, currentUser));
        } else {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " +
                    CommonUtils.byteConversion(fileLengthUtils.getFileMaxLength()) + " 的图片!");
        }
    }

    /**
     * 上传图片（一张）- mavonEditor
     *
     * @param picture
     * @return
     */
    @PostMapping("/uploadPicture")
    @ApiOperation(value = "上传图片（一张）")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<String> uploadPicture(@RequestParam(value = "picture") MultipartFile picture) throws IOException {
        if (fileLengthUtils.isFileNotTooBig(picture.getBytes())) {
            return ResponseResult.success(articleService.uploadPicture(picture.getBytes(), picture.getOriginalFilename()));
        } else {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " +
                    CommonUtils.byteConversion(fileLengthUtils.getFileMaxLength()) + " 的图片!");
        }
    }

    @NoNeedLogin
    @GetMapping("getCountById")
    @ApiOperation(value = "获取文章一些统计数据")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<ArticleCountDTO> getCountById(@RequestParam Integer id) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.getCountById(id, currentUser));
    }

    @GetMapping("articleTop")
    @ApiOperation(value = "文章置顶/取消置顶")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> articleTop(@RequestParam Integer id, @RequestParam Boolean top) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.articleTop(id, top, currentUser));
    }

    @PostMapping("delete/{id}")
    @ApiOperation(value = "文章删除")
    @ApiVersion(group = ApiVersionConstant.V_300)
    public ResponseResult<Boolean> delete(@PathVariable Integer id) {
        UserSsoDTO currentUser = UserContextUtils.currentUser();
        return ResponseResult.success(articleService.delete(id, currentUser));
    }

}
