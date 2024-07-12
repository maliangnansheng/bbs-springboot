package com.liang.bbs.article.service.impl;

import com.liang.bbs.article.facade.dto.LikeCommentDTO;
import com.liang.bbs.article.facade.server.LikeCommentService;
import com.liang.bbs.article.persistence.entity.LikeCommentPo;
import com.liang.bbs.article.persistence.entity.LikeCommentPoExample;
import com.liang.bbs.article.persistence.mapper.LikeCommentPoExMapper;
import com.liang.bbs.article.persistence.mapper.LikeCommentPoMapper;
import com.liang.bbs.article.service.mapstruct.LikeCommentMS;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class LikeCommentServiceImpl implements LikeCommentService {
    @Autowired
    private LikeCommentPoMapper likeCommentPoMapper;

    @Autowired
    private LikeCommentPoExMapper likeCommentPoExMapper;

    @Override
    public List<LikeCommentDTO> getPaasAll(LocalDateTime startTime, LocalDateTime endTime) {
        return LikeCommentMS.INSTANCE.toDTO(likeCommentPoExMapper.selectAllCommentLike(startTime, endTime));
    }

    /**
     * 获取评论的点赞数量
     *
     * @param commentId
     * @return
     */
    @Override
    public Long getLikeCountCommentId(Integer commentId) {
        LikeCommentPoExample example = new LikeCommentPoExample();
        example.createCriteria().andStateEqualTo(true)
                .andCommentIdEqualTo(commentId);
        return likeCommentPoMapper.countByExample(example);
    }

    /**
     * 是否点赞
     *
     * @param commentId
     * @param userId
     * @return
     */
    @Override
    public Boolean isLike(Integer commentId, Long userId) {
        LikeCommentPoExample example = new LikeCommentPoExample();
        example.createCriteria().andStateEqualTo(true)
                .andCommentIdEqualTo(commentId)
                .andLikeUserEqualTo(userId);
        return likeCommentPoMapper.countByExample(example) > 0;
    }

    /**
     * 更新点赞状态
     *
     * @param commentId
     * @param currentUser
     * @return
     */
    @Override
    public Boolean updateLikeCommentState(Integer commentId, UserSsoDTO currentUser) {
        LikeCommentDTO commentDTO = getByCommentIdUserId(commentId, currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        // 没有，新增
        if (commentDTO == null) {
            LikeCommentPo likeCommentPo = new LikeCommentPo();
            likeCommentPo.setCommentId(commentId);
            likeCommentPo.setState(true);
            likeCommentPo.setLikeUser(currentUser.getUserId());
            likeCommentPo.setCreateTime(now);
            likeCommentPo.setUpdateTime(now);
            if (likeCommentPoMapper.insertSelective(likeCommentPo) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "添加评论点赞失败");
            }
        } else {
            // 状态取反
            commentDTO.setState(!commentDTO.getState());
            commentDTO.setUpdateTime(now);
            if (likeCommentPoMapper.updateByPrimaryKeySelective(LikeCommentMS.INSTANCE.toPo(commentDTO)) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新评论点赞状态失败");
            }
        }

        return true;
    }

    /**
     * 通过评论id和用户id获取点赞信息
     *
     * @param commentId
     * @param userId
     * @return
     */
    @Override
    public LikeCommentDTO getByCommentIdUserId(Integer commentId, Long userId) {
        LikeCommentPoExample example = new LikeCommentPoExample();
        example.createCriteria().andCommentIdEqualTo(commentId).andLikeUserEqualTo(userId);
        List<LikeCommentDTO> likeCommentDTOS = LikeCommentMS.INSTANCE.toDTO(likeCommentPoMapper.selectByExample(example));
        if (CollectionUtils.isEmpty(likeCommentDTOS)) {
            return null;
        }
        return likeCommentDTOS.get(0);
    }

}
