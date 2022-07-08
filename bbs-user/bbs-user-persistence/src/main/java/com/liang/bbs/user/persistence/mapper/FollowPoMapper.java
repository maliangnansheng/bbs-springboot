package com.liang.bbs.user.persistence.mapper;

import com.liang.bbs.user.persistence.entity.FollowPo;
import com.liang.bbs.user.persistence.entity.FollowPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FollowPoMapper {
    /**
     * countByExample
     *
     * @param example
     * @return
     */
    long countByExample(FollowPoExample example);

    /**
     * deleteByExample
     *
     * @param example
     * @return
     */
    int deleteByExample(FollowPoExample example);

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
    int insert(FollowPo record);

    /**
     * insertSelective
     *
     * @param record
     * @return
     */
    int insertSelective(FollowPo record);

    /**
     * selectByExample
     *
     * @param example
     * @return
     */
    List<FollowPo> selectByExample(FollowPoExample example);

    /**
     * selectByPrimaryKey
     *
     * @param id
     * @return
     */
    FollowPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExampleSelective(@Param("record") FollowPo record, @Param("example") FollowPoExample example);

    /**
     * updateByExample
     *
     * @param record
     * @param example
     * @return
     */
    int updateByExample(@Param("record") FollowPo record, @Param("example") FollowPoExample example);

    /**
     * updateByPrimaryKeySelective
     *
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(FollowPo record);

    /**
     * updateByPrimaryKey
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(FollowPo record);
}