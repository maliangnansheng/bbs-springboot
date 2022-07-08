package com.liang.bbs.article.service.mapstruct;

import com.liang.bbs.article.facade.dto.LabelDTO;
import com.liang.bbs.article.persistence.entity.LabelPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author 马亮南生
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface LabelMS extends CommonMS<LabelPo, LabelDTO> {
    LabelMS INSTANCE = Mappers.getMapper(LabelMS.class);
}
