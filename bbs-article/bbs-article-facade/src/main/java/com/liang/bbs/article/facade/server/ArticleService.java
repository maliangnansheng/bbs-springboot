package com.liang.bbs.article.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.*;
import com.liang.bbs.common.enums.ArticleStateEnum;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface ArticleService {

    /**
     * 获取所有审核通过的文章
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<ArticleDTO> getPassAll(LocalDateTime startTime, LocalDateTime endTime);

    /**
     * 获取文章
     *
     * @param articleSearchDTO
     * @param currentUser
     * @param articleStateEnum
     * @return
     */
    PageInfo<ArticleDTO> getList(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser, ArticleStateEnum articleStateEnum);

    /**
     * 获取待审核的文章
     *
     * @param articleSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<ArticleDTO> getPendingReviewArticles(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser);

    /**
     * 获取禁用的文章
     *
     * @param articleSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<ArticleDTO> getDisabledArticles(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser);

    /**
     * 修改文章审批状态
     *
     * @param articleDTO
     * @param currentUser
     * @return
     */
    Boolean updateState(ArticleDTO articleDTO, UserSsoDTO currentUser);

    /**
     * 获取点赞过的文章
     *
     * @param likeSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<ArticleDTO> getLikesArticle(LikeSearchDTO likeSearchDTO, UserSsoDTO currentUser);

    /**
     * 通过文章id集合获取文章信息
     *
     * @param ids
     * @param isPv 是否增加文章浏览数量
     * @param currentUser
     * @return
     */
    List<ArticleDTO> getByIds(List<Integer> ids, Boolean isPv, UserSsoDTO currentUser);

    /**
     * 通过文章id集合获取文章信息(最基础的信息)
     *
     * @param ids
     * @return
     */
    List<ArticleDTO> getBaseByIds(List<Integer> ids, ArticleStateEnum articleStateEnum);

    /**
     * 撰写文章（无配图）
     *
     * @param articleDTO
     * @param currentUser
     */
    Boolean create(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser);

    /**
     * 更新文章（无配图）
     *
     * @param articleDTO
     * @param currentUser
     */
    Boolean update(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser);

    /**
     * 撰写文章
     *
     * @param bytes
     * @param sourceFileName
     * @param articleDTO
     * @param currentUser
     */
    Boolean create(byte[] bytes, String sourceFileName, ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser);

    /**
     * 更新文章
     *
     * @param bytes
     * @param sourceFileName
     * @param articleDTO
     * @param currentUser
     */
    Boolean update(byte[] bytes, String sourceFileName, ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser);

    /**
     * 上传图片（一张）- mavonEditor
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    String uploadPicture(byte[] bytes, String sourceFileName);

    /**
     * 获取文章评论访问总数
     *
     * @return
     */
    TotalDTO getArticleCommentVisitTotal();

    /**
     * 获取文章数量
     *
     * @return
     */
    Long getTotal();

    /**
     * 获取用户阅读数量
     *
     * @param userIds
     * @return
     */
    List<ArticleReadDTO> getUserReadCount(List<Long> userIds);

    /**
     * 获取文章一些统计数据
     *
     * @param id
     * @param currentUser
     * @return
     */
    ArticleCountDTO getCountById(Integer id, UserSsoDTO currentUser);

    /**
     * 增加文章浏览数量
     *
     * @param articleDTO
     */
    Boolean updatePv(ArticleDTO articleDTO);

    /**
     * 通过用户获取文章信息
     *
     * @param userId
     * @return
     */
    List<ArticleDTO> getByUserId(Long userId);

    /**
     * 文章置顶/取消置顶
     *
     * @param id
     * @param top 是否置顶（true：置顶，false：取消置顶）
     * @param currentUser
     * @return
     */
    Boolean articleTop(Integer id, Boolean top, UserSsoDTO currentUser);

    /**
     * 获取文章置顶的最大数值
     *
     * @return
     */
    Integer getMaxTop();

    /**
     * delete
     *
     * @param id
     * @param currentUser
     * @return
     */
    Boolean delete(Integer id, UserSsoDTO currentUser);
}
