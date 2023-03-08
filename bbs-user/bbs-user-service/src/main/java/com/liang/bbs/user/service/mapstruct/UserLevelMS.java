package com.liang.bbs.user.service.mapstruct;

import com.liang.bbs.user.facade.dto.UserLevelDTO;
import com.liang.bbs.user.persistence.entity.UserLevelPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface UserLevelMS extends CommonMS<UserLevelPo, UserLevelDTO> {
    UserLevelMS INSTANCE = Mappers.getMapper(UserLevelMS.class);
}
