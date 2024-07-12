package com.liang.bbs.article.persistence.mapper;

import com.liang.bbs.article.persistence.entity.LabelPo;
import com.liang.bbs.article.persistence.entity.LabelPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LabelPoMapper {
    /**
     * countByExample
     *
     * @param example
     * @return
     */
    long countByExample(LabelPoExample example);

    /**
     * deleteByExample
     *
     * @param example
     * @return
     */
    int deleteByExample(LabelPoExample example);

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
    int insert(LabelPo record);

    /**
     * insertSelective
     *
     * @param record
     * @return
     */
    int insertSelective(LabelPo record);

    /**
     * selectByExample
     *
     * @param example
     * @return
     */
    List<LabelPo> selectByExample(LabelPoExample example);

    /**
     * selectByPrimaryKey
     *
     * @param id
     * @return
     */
    LabelPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExampleSelective(@Param("record") LabelPo record, @Param("example") LabelPoExample example);

    /**
     * updateByExample
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExample(@Param("record") LabelPo record, @Param("example") LabelPoExample example);

    /**
     * updateByPrimaryKeySelective
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(LabelPo record);

    /**
     * updateByPrimaryKey
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(LabelPo record);
}
