package com.liang.bbs.article.service.mapstruct;

import com.liang.bbs.article.facade.dto.SlideshowDTO;
import com.liang.bbs.article.persistence.entity.SlideshowPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface SlideshowMS extends CommonMS<SlideshowPo, SlideshowDTO> {
    SlideshowMS INSTANCE = Mappers.getMapper(SlideshowMS.class);
}
