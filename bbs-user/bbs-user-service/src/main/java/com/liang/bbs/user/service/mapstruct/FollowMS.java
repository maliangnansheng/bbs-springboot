package com.liang.bbs.user.service.mapstruct;

import com.liang.bbs.user.facade.dto.FollowDTO;
import com.liang.bbs.user.persistence.entity.FollowPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author 马亮南生
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface FollowMS extends CommonMS<FollowPo, FollowDTO> {
    FollowMS INSTANCE = Mappers.getMapper(FollowMS.class);
}
