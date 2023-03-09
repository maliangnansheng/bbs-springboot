package com.liang.bbs.user.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ArticleDTO;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.common.enums.ArticleStateEnum;
import com.liang.bbs.user.facade.dto.LikeDTO;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.persistence.entity.LikePo;
import com.liang.bbs.user.persistence.entity.LikePoExample;
import com.liang.bbs.user.persistence.mapper.LikePoExMapper;
import com.liang.bbs.user.persistence.mapper.LikePoMapper;
import com.liang.bbs.user.service.mapstruct.LikeMS;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class LikeServiceImpl implements LikeService {
    @Autowired
    private LikePoMapper likePoMapper;

    @Autowired
    private LikePoExMapper likePoExMapper;

    @Reference
    private ArticleService articleService;

    /**
     * 获取所有点赞的通过审核的文章信息
     *
     * @param startTime
     * @param endTime
     * @return
     */
    @Override
    public List<LikeDTO> getPaasAll(LocalDateTime startTime, LocalDateTime endTime) {
        return LikeMS.INSTANCE.toDTO(likePoExMapper.selectAllArticle(startTime, endTime));
    }

    /**
     * 通过用户id获取点赞的文章信息
     *
     * @param likeSearchDTO
     * @return
     */
    @Override
    public PageInfo<LikeDTO> getArticleByUserId(LikeSearchDTO likeSearchDTO) {
        if (likeSearchDTO.getLikeUser() == null) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }

        PageHelper.startPage(likeSearchDTO.getCurrentPage(), likeSearchDTO.getPageSize());
        List<LikePo> likePos = likePoExMapper.selectArticleByUserId(likeSearchDTO.getLikeUser());

        return LikeMS.INSTANCE.toPage(new PageInfo<>(likePos));
    }

    /**
     * 通过文章id获取点赞的用户信息
     *
     * @param likeSearchDTO
     * @return
     */
    @Override
    public PageInfo<LikeDTO> getUserByArticleId(LikeSearchDTO likeSearchDTO) {
        if (likeSearchDTO.getArticleId() == null) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        LikePoExample example = new LikePoExample();
        LikePoExample.Criteria criteria = example.createCriteria().andStateEqualTo(true);
        criteria.andArticleIdEqualTo(likeSearchDTO.getArticleId());
        example.setOrderByClause("`id` desc");

        PageHelper.startPage(likeSearchDTO.getCurrentPage(), likeSearchDTO.getPageSize());
        List<LikePo> likePos = likePoMapper.selectByExample(example);

        return LikeMS.INSTANCE.toPage(new PageInfo<>(likePos));
    }

    /**
     * 通过id获取点赞信息
     *
     * @param id
     * @return
     */
    @Override
    public LikeDTO getById(Integer id) {
        return LikeMS.INSTANCE.toDTO(likePoMapper.selectByPrimaryKey(id));
    }

    /**
     * 通过文章id和用户id获取点赞信息
     *
     * @param articleId
     * @param userId
     * @return
     */
    @Override
    public LikeDTO getByArticleIdUserId(Integer articleId, Long userId) {
        LikePoExample example = new LikePoExample();
        example.createCriteria().andArticleIdEqualTo(articleId).andLikeUserEqualTo(userId);
        List<LikeDTO> likeDTOS = LikeMS.INSTANCE.toDTO(likePoMapper.selectByExample(example));
        if (CollectionUtils.isEmpty(likeDTOS)) {
            return null;
        }
        return likeDTOS.get(0);
    }

    /**
     * 获取文章的点赞数量
     *
     * @param articleIds
     * @return
     */
    @Override
    public Long getLikeCountArticle(List<Integer> articleIds) {
        LikePoExample example = new LikePoExample();
        example.createCriteria().andStateEqualTo(true)
                .andArticleIdIn(articleIds);
        return likePoMapper.countByExample(example);
    }

    /**
     * 是否点赞
     *
     * @param articleId
     * @param userId
     * @return
     */
    @Override
    public Boolean isLike(Integer articleId, Long userId) {
        LikePoExample example = new LikePoExample();
        example.createCriteria().andStateEqualTo(true)
                .andArticleIdEqualTo(articleId)
                .andLikeUserEqualTo(userId);
        return likePoMapper.countByExample(example) > 0;
    }

    /**
     * 更新点赞状态
     *
     * @param articleId
     * @param currentUser
     * @return
     */
    @Override
    public Boolean updateLikeState(Integer articleId, UserSsoDTO currentUser) {
        LikeDTO likeDTO = getByArticleIdUserId(articleId, currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        // 没有，新增
        if (likeDTO == null) {
            LikePo likePo = new LikePo();
            likePo.setArticleId(articleId);
            likePo.setState(true);
            likePo.setLikeUser(currentUser.getUserId());
            likePo.setCreateTime(now);
            likePo.setUpdateTime(now);
            if (likePoMapper.insertSelective(likePo) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "添加点赞失败");
            }
        } else {
            // 状态取反
            likeDTO.setState(!likeDTO.getState());
            likeDTO.setUpdateTime(now);
            if (likePoMapper.updateByPrimaryKeySelective(LikeMS.INSTANCE.toPo(likeDTO)) <= 0) {
                throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新点赞状态失败");
            }
        }

        return true;
    }

    /**
     * 用户获取的点赞数量
     *
     * @param userId
     * @return
     */
    @Override
    public Long getUserLikeCount(Long userId) {
        List<ArticleDTO> articleDTOS = articleService.getByUserId(userId);
        if (CollectionUtils.isNotEmpty(articleDTOS)) {
            List<Integer> articleIds = articleDTOS.stream().map(ArticleDTO::getId).collect(Collectors.toList());
            return this.getLikeCountArticle(articleIds);
        }

        return 0L;
    }

    @Override
    public Long getUserTheLikeCount(Long userId) {
        LikePoExample example = new LikePoExample();
        example.createCriteria().andStateEqualTo(true)
                .andLikeUserEqualTo(userId);
        List<LikePo> likePos = likePoMapper.selectByExample(example);

        if (CollectionUtils.isNotEmpty(likePos)) {
            List<Integer> articleIds = likePos.stream().map(LikePo::getArticleId).collect(Collectors.toList());
            List<ArticleDTO> articleDTOS = articleService.getBaseByIds(articleIds, ArticleStateEnum.enable);
            return CollectionUtils.isNotEmpty(articleDTOS) ? articleDTOS.size() : 0L;
        }

        return 0L;
    }
}
