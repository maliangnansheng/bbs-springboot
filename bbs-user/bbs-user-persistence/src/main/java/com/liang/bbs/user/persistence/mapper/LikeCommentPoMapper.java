package com.liang.bbs.user.persistence.mapper;

import com.liang.bbs.user.persistence.entity.LikeCommentPo;
import com.liang.bbs.user.persistence.entity.LikeCommentPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LikeCommentPoMapper {
    /**
     * countByExample
     * 
     * @param example
     * @return 
     */
    long countByExample(LikeCommentPoExample example);

    /**
     * deleteByExample
     * 
     * @param example
     * @return 
     */
    int deleteByExample(LikeCommentPoExample example);

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
    int insert(LikeCommentPo record);

    /**
     * insertSelective
     * 
     * @param record
     * @return 
     */
    int insertSelective(LikeCommentPo record);

    /**
     * selectByExample
     * 
     * @param example
     * @return 
     */
    List<LikeCommentPo> selectByExample(LikeCommentPoExample example);

    /**
     * selectByPrimaryKey
     * 
     * @param id
     * @return 
     */
    LikeCommentPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExampleSelective(@Param("record") LikeCommentPo record, @Param("example") LikeCommentPoExample example);

    /**
     * updateByExample
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExample(@Param("record") LikeCommentPo record, @Param("example") LikeCommentPoExample example);

    /**
     * updateByPrimaryKeySelective
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKeySelective(LikeCommentPo record);

    /**
     * updateByPrimaryKey
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKey(LikeCommentPo record);
}