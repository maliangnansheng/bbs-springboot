package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.SlideshowPo;
import com.liang.bbs.article.persistence.entity.SlideshowPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SlideshowPoMapper {
    /**
     * countByExample
     * 
     * @param example
     * @return 
     */
    long countByExample(SlideshowPoExample example);

    /**
     * deleteByExample
     * 
     * @param example
     * @return 
     */
    int deleteByExample(SlideshowPoExample example);

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
    int insert(SlideshowPo record);

    /**
     * insertSelective
     * 
     * @param record
     * @return 
     */
    int insertSelective(SlideshowPo record);

    /**
     * selectByExample
     * 
     * @param example
     * @return 
     */
    List<SlideshowPo> selectByExample(SlideshowPoExample example);

    /**
     * selectByPrimaryKey
     * 
     * @param id
     * @return 
     */
    SlideshowPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExampleSelective(@Param("record") SlideshowPo record, @Param("example") SlideshowPoExample example);

    /**
     * updateByExample
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExample(@Param("record") SlideshowPo record, @Param("example") SlideshowPoExample example);

    /**
     * updateByPrimaryKeySelective
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKeySelective(SlideshowPo record);

    /**
     * updateByPrimaryKey
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKey(SlideshowPo record);
}