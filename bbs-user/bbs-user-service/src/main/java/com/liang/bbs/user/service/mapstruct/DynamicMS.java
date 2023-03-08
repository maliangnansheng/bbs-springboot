package com.liang.bbs.user.service.mapstruct;

import com.liang.bbs.user.facade.dto.DynamicDTO;
import com.liang.bbs.user.persistence.entity.DynamicPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface DynamicMS extends CommonMS<DynamicPo, DynamicDTO> {
    DynamicMS INSTANCE = Mappers.getMapper(DynamicMS.class);
}
