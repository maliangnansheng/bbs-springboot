package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.facade.dto.ArticleReadDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticlePoExMapper {
    /**
     * 获取用户点赞数量
     *
     * @param userIds
     * @return
     */
    List<ArticleReadDTO> selectUserReadCount(@Param("userIds") List<Long> userIds);

}