package com.liang.bbs.article.facade.server;

import com.liang.bbs.article.facade.dto.ArticleLabelDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface ArticleLabelService {
    /**
     * 新增文件标签关系信息
     *
     * @param labelIds
     * @param articleId
     * @param currentUser
     * @return
     */
    Boolean create(List<Integer> labelIds, Integer articleId, UserSsoDTO currentUser);

    /**
     * 更新文件标签关系信息
     *
     * @param labelIds
     * @param articleId
     * @param currentUser
     * @return
     */
    Boolean update(List<Integer> labelIds, Integer articleId, UserSsoDTO currentUser);

    /**
     * 根据标签id集合获取文章标签信息
     *
     * @param labelIds
     * @return
     */
    List<ArticleLabelDTO> getByLabelIds(List<Integer> labelIds);

    /**
     * 根据文章id集合获取文章标签信息
     *
     * @param articleIds
     * @return
     */
    List<ArticleLabelDTO> getByArticleIds(List<Integer> articleIds);

    /**
     * 获取标签使用数量
     *
     * @param labelId
     * @return
     */
    Long getCountByLabelId(Integer labelId);

}
