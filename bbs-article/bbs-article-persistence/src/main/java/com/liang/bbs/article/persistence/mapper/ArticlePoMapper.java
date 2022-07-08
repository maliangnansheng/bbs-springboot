package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.ArticlePo;
import com.liang.bbs.article.persistence.entity.ArticlePoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArticlePoMapper {
    /**
     * countByExample
     * 
     * @param example
     * @return 
     */
    long countByExample(ArticlePoExample example);

    /**
     * deleteByExample
     * 
     * @param example
     * @return 
     */
    int deleteByExample(ArticlePoExample example);

    /**
     * deleteByPrimaryKey
     * 
     * @param id
     * @return 
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * insert
     * 
     * @param record
     * @return 
     */
    int insert(ArticlePo record);

    /**
     * insertSelective
     * 
     * @param record
     * @return 
     */
    int insertSelective(ArticlePo record);

    /**
     * selectByExample
     * 
     * @param example
     * @return 
     */
    List<ArticlePo> selectByExample(ArticlePoExample example);

    /**
     * selectByPrimaryKey
     * 
     * @param id
     * @return 
     */
    ArticlePo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExampleSelective(@Param("record") ArticlePo record, @Param("example") ArticlePoExample example);

    /**
     * updateByExample
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExample(@Param("record") ArticlePo record, @Param("example") ArticlePoExample example);

    /**
     * updateByPrimaryKeySelective
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKeySelective(ArticlePo record);

    /**
     * updateByPrimaryKey
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKey(ArticlePo record);
}