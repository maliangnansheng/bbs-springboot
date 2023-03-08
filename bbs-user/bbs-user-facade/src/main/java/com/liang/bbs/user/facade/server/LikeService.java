package com.liang.bbs.user.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.user.facade.dto.LikeDTO;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface LikeService {

    /**
     * 获取所有点赞的通过审核的文章信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<LikeDTO> getPaasAll(LocalDateTime startTime, LocalDateTime endTime);

    /**
     * 通过用户id获取点赞的文章信息
     *
     * @param likeSearchDTO
     * @return
     */
    PageInfo<LikeDTO> getArticleByUserId(LikeSearchDTO likeSearchDTO);

    /**
     * 通过文章id获取点赞的用户信息
     *
     * @param likeSearchDTO
     * @return
     */
    PageInfo<LikeDTO> getUserByArticleId(LikeSearchDTO likeSearchDTO);

    /**
     * 通过id获取点赞信息
     *
     * @param id
     * @return
     */
    LikeDTO getById(Integer id);

    /**
     * 通过文章id和用户id获取点赞信息
     *
     * @param articleId
     * @param userId
     * @return
     */
    LikeDTO getByArticleIdUserId(Integer articleId, Long userId);

    /**
     * 获取文章的点赞数量
     *
     * @param articleIds
     * @return
     */
    Long getLikeCountArticle(List<Integer> articleIds);

    /**
     * 是否点赞
     *
     * @param articleId
     * @param userId
     * @return
     */
    Boolean isLike(Integer articleId, Long userId);

    /**
     * 更新点赞状态
     *
     * @param articleId
     * @param currentUser
     * @return
     */
    Boolean updateLikeState(Integer articleId, UserSsoDTO currentUser);

    /**
     * 用户获取的点赞数量
     *
     * @param userId
     * @return
     */
    Long getUserLikeCount(Long userId);

}
