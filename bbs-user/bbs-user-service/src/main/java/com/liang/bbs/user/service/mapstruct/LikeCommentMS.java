package com.liang.bbs.user.service.mapstruct;

import com.liang.bbs.user.facade.dto.LikeCommentDTO;
import com.liang.bbs.user.persistence.entity.LikeCommentPo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
@Mapper(componentModel = "spring")
public interface LikeCommentMS extends CommonMS<LikeCommentPo, LikeCommentDTO> {
    LikeCommentMS INSTANCE = Mappers.getMapper(LikeCommentMS.class);
}
