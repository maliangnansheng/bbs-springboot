package com.liang.bbs.article.persistence.mapper;

public interface ArticleLabelPoExMapper {
    /**
     * 获取标签使用数量
     *
     * @param labelId
     * @return
     */
    long countByLabelId(Integer labelId);

}