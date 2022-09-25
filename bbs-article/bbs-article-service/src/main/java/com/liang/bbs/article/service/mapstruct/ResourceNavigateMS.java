package com.liang.bbs.article.service.mapstruct;

import com.liang.bbs.article.facade.dto.ResourceNavigateDTO;
import com.liang.bbs.article.persistence.entity.ResourceNavigatePo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author 马亮南生
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface ResourceNavigateMS extends CommonMS<ResourceNavigatePo, ResourceNavigateDTO> {
    ResourceNavigateMS INSTANCE = Mappers.getMapper(ResourceNavigateMS.class);
}
