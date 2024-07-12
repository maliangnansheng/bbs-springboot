package com.liang.bbs.article.service.mapstruct;

import com.liang.bbs.article.facade.dto.FollowDTO;
import com.liang.bbs.article.persistence.entity.FollowPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface FollowMS extends CommonMS<FollowPo, FollowDTO> {
    FollowMS INSTANCE = Mappers.getMapper(FollowMS.class);
}
