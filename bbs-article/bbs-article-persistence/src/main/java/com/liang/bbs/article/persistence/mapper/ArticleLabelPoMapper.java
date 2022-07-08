package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.ArticleLabelPo;
import com.liang.bbs.article.persistence.entity.ArticleLabelPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleLabelPoMapper {
    /**
     * countByExample
     *
     * @param example
     * @return
     */
    long countByExample(ArticleLabelPoExample example);

    /**
     * deleteByExample
     *
     * @param example
     * @return
     */
    int deleteByExample(ArticleLabelPoExample example);

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
    int insert(ArticleLabelPo record);

    /**
     * insertSelective
     *
     * @param record
     * @return
     */
    int insertSelective(ArticleLabelPo record);

    /**
     * selectByExample
     *
     * @param example
     * @return
     */
    List<ArticleLabelPo> selectByExample(ArticleLabelPoExample example);

    /**
     * selectByPrimaryKey
     *
     * @param id
     * @return
     */
    ArticleLabelPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExampleSelective(@Param("record") ArticleLabelPo record, @Param("example") ArticleLabelPoExample example);

    /**
     * updateByExample
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExample(@Param("record") ArticleLabelPo record, @Param("example") ArticleLabelPoExample example);

    /**
     * updateByPrimaryKeySelective
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(ArticleLabelPo record);

    /**
     * updateByPrimaryKey
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(ArticleLabelPo record);
}