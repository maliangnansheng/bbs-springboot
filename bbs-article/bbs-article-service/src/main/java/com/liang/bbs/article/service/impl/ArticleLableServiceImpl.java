package com.liang.bbs.article.service.impl;

import com.liang.bbs.article.facade.dto.ArticleLabelDTO;
import com.liang.bbs.article.facade.server.ArticleLabelService;
import com.liang.bbs.article.persistence.entity.ArticleLabelPo;
import com.liang.bbs.article.persistence.entity.ArticleLabelPoExample;
import com.liang.bbs.article.persistence.mapper.ArticleLabelPoExMapper;
import com.liang.bbs.article.persistence.mapper.ArticleLabelPoMapper;
import com.liang.bbs.article.service.mapstruct.ArticleLabelMS;
import com.liang.nansheng.common.auth.UserSsoDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class ArticleLableServiceImpl implements ArticleLabelService {
    @Autowired
    private ArticleLabelPoMapper articleLabelPoMapper;

    @Autowired
    private ArticleLabelPoExMapper articleLabelPoExMapper;

    /**
     * 新增文件标签关系信息
     *
     * @param labelIds
     * @param articleId
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(List<Integer> labelIds, Integer articleId, UserSsoDTO currentUser) {
        LocalDateTime now = LocalDateTime.now();
        labelIds.forEach(labelId -> {
            ArticleLabelPo articleLabelPo = new ArticleLabelPo();
            articleLabelPo.setArticleId(articleId);
            articleLabelPo.setLabelId(labelId);
            articleLabelPo.setCreateUser(currentUser.getUserId());
            articleLabelPo.setUpdateUser(currentUser.getUserId());
            articleLabelPo.setCreateTime(now);
            articleLabelPo.setUpdateTime(now);
            articleLabelPo.setIsDeleted(false);
            articleLabelPoMapper.insertSelective(articleLabelPo);
        });
        return true;
    }

    /**
     * 更新文件标签关系信息
     *
     * @param labelIds
     * @param articleId
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(List<Integer> labelIds, Integer articleId, UserSsoDTO currentUser) {
        // 根据文章id集合获取文章标签信息
        List<ArticleLabelDTO> articleLabelDTOS = getByArticleIds(Collections.singletonList(articleId));
        List<Integer> labelIdsOld = articleLabelDTOS.stream().distinct().map(ArticleLabelDTO::getLabelId).collect(Collectors.toList());

        // 需要新增的
        List<Integer> labelIdsCreate = new ArrayList<>();
        labelIds.forEach(labelId -> {
            if (!labelIdsOld.contains(labelId)) {
                labelIdsCreate.add(labelId);
            }
        });
        create(labelIdsCreate, articleId, currentUser);

        // 需要删除的
        labelIdsOld.forEach(labelId -> {
            if (!labelIds.contains(labelId)) {
                ArticleLabelPoExample example = new ArticleLabelPoExample();
                example.createCriteria().andArticleIdEqualTo(articleId)
                        .andLabelIdEqualTo(labelId)
                        .andIsDeletedEqualTo(false);

                ArticleLabelPo articleLabelPo = new ArticleLabelPo();
                articleLabelPo.setUpdateUser(currentUser.getUserId());
                articleLabelPo.setUpdateTime(LocalDateTime.now());
                articleLabelPo.setIsDeleted(true);
                articleLabelPoMapper.updateByExampleSelective(articleLabelPo, example);
            }
        });

        return true;
    }

    /**
     * 根据标签id获取文章标签信息
     *
     * @param labelIds
     * @return
     */
    @Override
    public List<ArticleLabelDTO> getByLabelIds(List<Integer> labelIds) {
        ArticleLabelPoExample example = new ArticleLabelPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andLabelIdIn(labelIds);

        return ArticleLabelMS.INSTANCE.toDTO(articleLabelPoMapper.selectByExample(example));
    }

    /**
     * 根据文章id集合获取文章标签信息
     *
     * @param articleIds
     * @return
     */
    @Override
    public List<ArticleLabelDTO> getByArticleIds(List<Integer> articleIds) {
        ArticleLabelPoExample example = new ArticleLabelPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andArticleIdIn(articleIds);

        return ArticleLabelMS.INSTANCE.toDTO(articleLabelPoMapper.selectByExample(example));
    }

    /**
     * 获取标签使用数量
     *
     * @param labelId
     * @return
     */
    @Override
    public Long getCountByLabelId(Integer labelId) {
        return articleLabelPoExMapper.countByLabelId(labelId);
    }

}
