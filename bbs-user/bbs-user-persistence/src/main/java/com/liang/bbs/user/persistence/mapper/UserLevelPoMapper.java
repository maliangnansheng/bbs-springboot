package com.liang.bbs.user.persistence.mapper;

import com.liang.bbs.user.persistence.entity.UserLevelPo;
import com.liang.bbs.user.persistence.entity.UserLevelPoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserLevelPoMapper {
    /**
     * countByExample
     * 
     * @param example
     * @return 
     */
    long countByExample(UserLevelPoExample example);

    /**
     * deleteByExample
     * 
     * @param example
     * @return 
     */
    int deleteByExample(UserLevelPoExample example);

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
    int insert(UserLevelPo record);

    /**
     * insertSelective
     * 
     * @param record
     * @return 
     */
    int insertSelective(UserLevelPo record);

    /**
     * selectByExample
     * 
     * @param example
     * @return 
     */
    List<UserLevelPo> selectByExample(UserLevelPoExample example);

    /**
     * selectByPrimaryKey
     * 
     * @param id
     * @return 
     */
    UserLevelPo selectByPrimaryKey(Integer id);

    /**
     * updateByExampleSelective
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExampleSelective(@Param("record") UserLevelPo record, @Param("example") UserLevelPoExample example);

    /**
     * updateByExample
     * 
     * @param record
     * @param example
     * @return 
     */
    int updateByExample(@Param("record") UserLevelPo record, @Param("example") UserLevelPoExample example);

    /**
     * updateByPrimaryKeySelective
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKeySelective(UserLevelPo record);

    /**
     * updateByPrimaryKey
     * 
     * @param record
     * @return 
     */
    int updateByPrimaryKey(UserLevelPo record);
}