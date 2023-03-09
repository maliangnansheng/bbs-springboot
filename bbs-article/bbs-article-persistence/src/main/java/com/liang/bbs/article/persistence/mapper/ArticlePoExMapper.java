package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.facade.dto.ArticleReadDTO;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ArticlePoExMapper {
    /**
     * 获取用户点赞数量
     *
     * @param userIds
     * @return
     */
    List<ArticleReadDTO> selectUserReadCount(@Param("userIds") List<Long> userIds);

    /**
     * 文章审核数据量
     *
     * @param title
     * @return
     */
    @MapKey("id")
    List<Map<String, Object>> selectArticleCheckCount(@Param("title") String title);

}