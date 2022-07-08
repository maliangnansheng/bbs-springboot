package com.liang.bbs.user.service.mapstruct;

import com.liang.bbs.user.facade.dto.LikeDTO;
import com.liang.bbs.user.persistence.entity.LikePo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author 马亮南生
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface LikeMS extends CommonMS<LikePo, LikeDTO> {
    LikeMS INSTANCE = Mappers.getMapper(LikeMS.class);
}
