package com.liang.bbs.article.service.mapstruct;

import com.liang.bbs.article.facade.dto.LikeDTO;
import com.liang.bbs.article.persistence.entity.LikePo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface LikeMS extends CommonMS<LikePo, LikeDTO> {
    LikeMS INSTANCE = Mappers.getMapper(LikeMS.class);
}
