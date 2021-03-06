package com.liang.bbs.article.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.*;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.util.List;

/**
 * @author 马亮
 * @date 2022/4/6 14:33
 */
public interface ArticleService {
    /**
     * 获取文章
     *
     * @param articleSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<ArticleDTO> getList(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser);

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
    List<ArticleDTO> getBaseByIds(List<Integer> ids);

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

}
