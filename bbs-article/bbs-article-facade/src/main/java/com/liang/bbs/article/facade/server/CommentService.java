package com.liang.bbs.article.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.CommentDTO;
import com.liang.bbs.article.facade.dto.CommentSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.util.List;

/**
 * @author 马亮
 * @date 2022/4/6 14:33
 */
public interface CommentService {
    /**
     * 获取文章的评论信息
     *
     * @param articleId
     * @return
     */
    List<CommentDTO> getCommentByArticleId(Integer articleId, UserSsoDTO currentUser);

    /**
     * 获取最新评论信息
     *
     * @param commentSearchDTO
     * @return
     */
    PageInfo<CommentDTO> getLatestComment(CommentSearchDTO commentSearchDTO);

    /**
     * 获取文章的评论数量
     *
     * @param articleId
     * @return
     */
    Long getCommentCountByArticle(Integer articleId);

    /**
     * 获取评论数量
     *
     * @return
     */
    Long getTotal();

    /**
     * 创建评论
     *
     * @param commentDTO
     * @param currentUser
     * @return
     */
    Boolean create(CommentDTO commentDTO, UserSsoDTO currentUser);

    /**
     * 删除评论
     *
     * @param commentId
     * @return
     */
    Boolean delete(Integer commentId);

}
