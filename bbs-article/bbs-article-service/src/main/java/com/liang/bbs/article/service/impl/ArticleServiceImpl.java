package com.liang.bbs.article.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.*;
import com.liang.bbs.article.facade.server.ArticleLabelService;
import com.liang.bbs.article.facade.server.ArticleService;
import com.liang.bbs.article.facade.server.CommentService;
import com.liang.bbs.article.facade.server.LabelService;
import com.liang.bbs.article.persistence.entity.ArticlePo;
import com.liang.bbs.article.persistence.entity.ArticlePoExample;
import com.liang.bbs.article.persistence.mapper.ArticlePoExMapper;
import com.liang.bbs.article.persistence.mapper.ArticlePoMapper;
import com.liang.bbs.article.service.mapstruct.ArticleMS;
import com.liang.bbs.article.service.utils.FileUploadUtils;
import com.liang.bbs.article.service.utils.ImageUtils;
import com.liang.bbs.user.facade.dto.FollowDTO;
import com.liang.bbs.user.facade.dto.LikeDTO;
import com.liang.bbs.user.facade.dto.LikeSearchDTO;
import com.liang.bbs.user.facade.dto.UserLevelDTO;
import com.liang.bbs.user.facade.server.FollowService;
import com.liang.bbs.user.facade.server.LikeService;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.manage.auth.facade.dto.user.UserDTO;
import com.liang.manage.auth.facade.server.UserService;
import com.liang.manage.concern.facade.server.VisitService;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ImageTypeEnum;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.utils.CommonUtils;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author ??????
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticlePoMapper articlePoMapper;

    @Autowired
    private ArticlePoExMapper articlePoExMapper;

    @Autowired
    private ArticleLabelService articleLabelService;

    @Autowired
    private LabelService labelService;

    @Autowired
    private CommentService commentService;

    @Reference
    private UserService userService;

    @Reference
    private LikeService likeService;

    @Reference
    private VisitService visitService;

    @Reference
    private FollowService followService;

    @Reference
    private UserLevelService userLevelService;

    @Autowired
    private ImageUtils imageUtils;

    @Autowired
    private FileUploadUtils fileUploadUtils;

    @Autowired
    private MongoTemplate mongoTemplate;

    private static final Integer contentMax = 200;

    /**
     * ????????????
     *
     * @param articleSearchDTO
     * @param currentUser
     * @return
     */
    @Override
    public PageInfo<ArticleDTO> getList(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser) {
        List<Integer> articleIds = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(articleSearchDTO.getLabelIds())) {
            // ????????????id??????????????????????????????
            List<ArticleLabelDTO> articleLabelDTOS = articleLabelService.getByLabelIds(articleSearchDTO.getLabelIds());
            if (CollectionUtils.isNotEmpty(articleLabelDTOS)) {
                articleIds = articleLabelDTOS.stream().map(ArticleLabelDTO::getArticleId).collect(Collectors.toList());
            } else {
                // ????????????????????????
                return new PageInfo<>(new ArrayList<>());
            }
        }

        ArticlePoExample example = new ArticlePoExample();
        ArticlePoExample.Criteria criteria = example.createCriteria()
                .andIsDeletedEqualTo(false)
                .andStateEqualTo(true);
        if (articleSearchDTO.getId() != null) {
            criteria.andIdEqualTo(articleSearchDTO.getId());
        }
        if (StringUtils.isNotBlank(articleSearchDTO.getTitle())) {
            criteria.andTitleLike("%" + articleSearchDTO.getTitle() + "%");
        }
        if (articleSearchDTO.getState() != null) {
            criteria.andStateEqualTo(articleSearchDTO.getState());
        }
        if (CollectionUtils.isNotEmpty(articleIds)) {
            criteria.andIdIn(articleIds);
        }
        if (articleSearchDTO.getCreateUser() != null) {
            criteria.andCreateUserEqualTo(articleSearchDTO.getCreateUser());
        }
        example.setOrderByClause("top desc, create_time desc, `id` desc");

        PageHelper.startPage(articleSearchDTO.getCurrentPage(), articleSearchDTO.getPageSize());
        List<ArticlePo> articlePos = articlePoMapper.selectByExample(example);
        PageInfo<ArticleDTO> pageInfo = ArticleMS.INSTANCE.toPage(new PageInfo<>(articlePos));
        if (CollectionUtils.isEmpty(pageInfo.getList())) {
            return pageInfo;
        }

        // ??????????????????
        buildArticleInfo(pageInfo.getList(), currentUser);

        return pageInfo;
    }

    /**
     * ????????????????????????
     *
     * @param likeSearchDTO
     * @param currentUser
     * @return
     */
    @Override
    public PageInfo<ArticleDTO> getLikesArticle(LikeSearchDTO likeSearchDTO, UserSsoDTO currentUser) {
        PageInfo<ArticleDTO> pageInfo = new PageInfo<>();
        PageInfo<LikeDTO> likeDTOPageInfo = likeService.getArticleByUserId(likeSearchDTO);
        BeanUtils.copyProperties(likeDTOPageInfo, pageInfo);
        if (CollectionUtils.isNotEmpty(likeDTOPageInfo.getList())) {
            List<Integer> articleIds = likeDTOPageInfo.getList().stream().distinct().map(LikeDTO::getArticleId).collect(Collectors.toList());
            List<ArticleDTO> articleDTOS = getBaseByIds(articleIds);

            // ??????????????????
            buildArticleInfo(articleDTOS, currentUser);
            pageInfo.setList(articleDTOS);
        }

        return pageInfo;
    }

    /**
     * ????????????id????????????????????????
     *
     * @param ids
     * @param isPv ??????????????????????????????
     * @param currentUser
     * @return
     */
    @Override
    public List<ArticleDTO> getByIds(List<Integer> ids, Boolean isPv, UserSsoDTO currentUser) {
        List<ArticleDTO> articleDTOS = getBaseByIds(ids);
        if (CollectionUtils.isEmpty(articleDTOS)) {
            return articleDTOS;
        }

        // ??????????????????
        buildArticleInfo(articleDTOS, currentUser);

        // ??????????????????
        List<ArticleMarkdownInfo> articleMarkdownInfos = getMarkdownByArticleIds(ids);
        Map<Integer, List<ArticleMarkdownInfo>> articleId2List = articleMarkdownInfos.stream().collect(Collectors.groupingBy(ArticleMarkdownInfo::getArticleId));
        articleDTOS.forEach(articleDTO -> {
            if (articleId2List.containsKey(articleDTO.getId())) {
                ArticleMarkdownInfo articleMarkdownInfo = articleId2List.get(articleDTO.getId()).get(0);
                articleDTO.setMarkdown(articleMarkdownInfo.getArticleMarkdown());
                articleDTO.setHtml(articleMarkdownInfo.getArticleHtml());
            }
        });

        // ????????????????????????
        if (isPv != null && isPv) {
            this.updatePv(articleDTOS.get(0));
        }

        return articleDTOS;
    }

    /**
     * ????????????id????????????????????????(??????????????????)
     *
     * @param ids
     * @return
     */
    @Override
    public List<ArticleDTO> getBaseByIds(List<Integer> ids) {
        ArticlePoExample example = new ArticlePoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true)
                .andIdIn(ids);

        return ArticleMS.INSTANCE.toDTO(articlePoMapper.selectByExample(example));
    }

    /**
     * ???????????????????????????
     *
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(articleDTO.getTitle()) || StringUtils.isBlank(articleDTO.getHtml())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "???????????????");
        }
        articleDTO.setIsDeleted(false);
        String content = CommonUtils.html2Text(articleDTO.getHtml());
        articleDTO.setContent(content.length() < contentMax ? content : content.substring(0, contentMax));
        articleDTO.setCreateUser(currentUser.getUserId());
        articleDTO.setUpdateUser(currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        articleDTO.setCreateTime(now);
        articleDTO.setUpdateTime(now);
        // ?????????????????????????????????????????????????????????
        articleDTO.setState(true);
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        if (articlePoMapper.insertSelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "??????????????????");
        }
        // ??????????????????????????????
        articleLabelService.create(labelIds, articlePo.getId(), currentUser);

        // ?????????????????????mongo???
        insertArticleContent(articlePo.getId(), articleDTO.getMarkdown(), articleDTO.getHtml(), currentUser.getUserId(), now);

        return true;
    }

    /**
     * ???????????????????????????
     *
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(articleDTO.getTitle()) || StringUtils.isBlank(articleDTO.getHtml())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "???????????????");
        }
        String content = CommonUtils.html2Text(articleDTO.getHtml());
        articleDTO.setContent(content.length() < contentMax ? content : content.substring(0, contentMax));
        LocalDateTime now = LocalDateTime.now();
        articleDTO.setUpdateTime(now);
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        if (articlePoMapper.updateByPrimaryKeySelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "??????????????????");
        }
        // ??????????????????????????????
        articleLabelService.update(labelIds, articlePo.getId(), currentUser);

        // ?????????????????????mongo???
        updateArticleContent(articlePo.getId(), articleDTO.getMarkdown(), articleDTO.getHtml(), currentUser.getUserId(), now);

        return true;
    }

    /**
     * ????????????
     *
     * @param bytes
     * @param sourceFileName
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(byte[] bytes, String sourceFileName, ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        try {
            // ????????????????????????
            if (isFileNotTooBig(bytes)) {
                articleDTO.setTitleMap(fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articleTitleMap.name()));
                create(articleDTO, labelIds, currentUser);
            } else {
                throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "?????????????????? " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " ?????????!");
            }
        } catch (Exception e) {
            log.error("?????????????????????", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "??????????????????!");
        }

        return null;
    }

    /**
     * ????????????
     *
     * @param bytes
     * @param sourceFileName
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(byte[] bytes, String sourceFileName, ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        try {
            // ????????????????????????
            if (isFileNotTooBig(bytes)) {
                articleDTO.setTitleMap(fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articleTitleMap.name()));
                update(articleDTO, labelIds, currentUser);
            } else {
                throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "?????????????????? " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " ?????????!");
            }
        } catch (Exception e) {
            log.error("?????????????????????", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "??????????????????!");
        }

        return null;
    }

    /**
     * ????????????????????????- mavonEditor
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    @Override
    public String uploadPicture(byte[] bytes, String sourceFileName) {
        // ??????????????????
        if (!isFileNotTooBig(bytes)) {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "?????????????????? " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " ?????????!");
        }

        return fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articlePicture.name());
    }

    /**
     * ??????????????????????????????
     *
     * @return
     */
    @Override
    public TotalDTO getArticleCommentVisitTotal() {
        TotalDTO totalDTO = new TotalDTO();
        totalDTO.setArticleCount(getTotal());
        totalDTO.setCommentCount(commentService.getTotal());
        totalDTO.setVisitCount(visitService.getTotal());
        return totalDTO;
    }

    /**
     * ??????????????????
     *
     * @return
     */
    @Override
    public Long getTotal() {
        ArticlePoExample example = new ArticlePoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true);
        return articlePoMapper.countByExample(example);
    }

    /**
     * ????????????????????????
     *
     * @param userIds
     * @return
     */
    @Override
    public List<ArticleReadDTO> getUserReadCount(List<Long> userIds) {
        return articlePoExMapper.selectUserReadCount(userIds);
    }

    /**
     * ??????????????????????????????
     *
     * @param id
     * @param currentUser
     * @return
     */
    @Override
    public ArticleCountDTO getCountById(Integer id, UserSsoDTO currentUser) {
        // ??????????????????
        ArticlePo articlePo = articlePoMapper.selectByPrimaryKey(id);
        ArticleCountDTO articleCountDTO = new ArticleCountDTO();
        // ????????????????????????
        articleCountDTO.setLikeCount(likeService.getLikeCountArticle(Collections.singletonList(id)));
        // ???????????????????????????fromUser???toUser??????????????????
        if (currentUser != null) {
            articleCountDTO.setIsLike(likeService.isLike(id, currentUser.getUserId()));
            FollowDTO followDTO = followService.getByFromToUser(currentUser.getUserId(), articlePo.getCreateUser(), false);
            if (followDTO != null) {
                articleCountDTO.setIsFollow(true);
            }
        }
        // ????????????????????????
        articleCountDTO.setCommentCount(commentService.getCommentCountByArticle(id));
        // ??????????????????
        List<UserLevelDTO> userLevelDTOS = userLevelService.getByUserId(articlePo.getCreateUser());
        if (CollectionUtils.isNotEmpty(userLevelDTOS)) {
            articleCountDTO.setLevel(userLevelDTOS.get(0).getLevel());
        }

        return articleCountDTO;
    }

    /**
     * ????????????????????????
     *
     * @param articleDTO
     * @return
     */
    @Override
    public Boolean updatePv(ArticleDTO articleDTO) {
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        articlePo.setPv(articlePo.getPv() + 1);
        if (articlePoMapper.updateByPrimaryKeySelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "???????????????????????????");
        }
        return true;
    }

    /**
     * ??????????????????????????????
     *
     * @param userId
     * @return
     */
    @Override
    public List<ArticleDTO> getByUserId(Long userId) {
        ArticlePoExample example = new ArticlePoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andStateEqualTo(true)
                .andCreateUserEqualTo(userId);

        return ArticleMS.INSTANCE.toDTO(articlePoMapper.selectByExample(example));
    }

    /**
     * ????????????id????????????????????????
     *
     * @param articleIds
     * @return
     */
    private Map<Integer, List<LabelDTO>> getArticleIdToLabels(List<Integer> articleIds) {
        // ??????id???????????????????????????key:??????id, value:???????????????
        Map<Integer, List<LabelDTO>> articleToLabelMap = new HashMap<>();

        List<ArticleLabelDTO> articleLabelDTOS = articleLabelService.getByArticleIds(articleIds);
        if (CollectionUtils.isNotEmpty(articleLabelDTOS)) {
            // ?????????????????????id??????
            List<Integer> labelIds = articleLabelDTOS.stream().distinct().map(ArticleLabelDTO::getLabelId).collect(Collectors.toList());
            Map<Integer, List<ArticleLabelDTO>> articleIdKeyMap = articleLabelDTOS.stream().collect(Collectors.groupingBy(ArticleLabelDTO::getArticleId));
            List<LabelDTO> labelDTOS = labelService.getByIds(labelIds);
            if (CollectionUtils.isNotEmpty(labelDTOS)) {
                Map<Integer, List<LabelDTO>> labelMap = labelDTOS.stream().collect(Collectors.groupingBy(LabelDTO::getId));
                articleIdKeyMap.forEach((k, v) -> {
                    List<LabelDTO> result = new ArrayList<>();
                    v.forEach(articleLabelDTO -> {
                        List<LabelDTO> labelDTOList = labelMap.get(articleLabelDTO.getLabelId());
                        result.addAll(CollectionUtils.isNotEmpty(labelDTOList) ? labelDTOList : new ArrayList<>());
                    });
                    articleToLabelMap.put(k, result);
                });
            }
        }

        return articleToLabelMap;
    }

    /**
     * ??????????????????
     *
     * @param articleDTOS
     * @param currentUser
     */
    private void buildArticleInfo(List<ArticleDTO> articleDTOS, UserSsoDTO currentUser) {
        // ????????????id????????????????????????
        List<Integer> articleIds = articleDTOS.stream().map(ArticleDTO::getId).collect(Collectors.toList());
        Map<Integer, List<LabelDTO>> articleToLabelMap = getArticleIdToLabels(articleIds);

        // ????????????id????????????????????????
        List<Long> userIds = articleDTOS.stream().map(ArticleDTO::getCreateUser).collect(Collectors.toList());
        // ??????????????????
        Map<Long, List<UserDTO>> idUsers = userService.getByIds(userIds).stream().collect(Collectors.groupingBy(UserDTO::getId));
        // ??????????????????
        Map<Long, List<UserLevelDTO>> userIdToUserLevel = userLevelService.getByUserIds(userIds).stream().collect(Collectors.groupingBy(UserLevelDTO::getUserId));
        // ??????id??????name
        articleDTOS.forEach(articleDTO -> {
            if (idUsers.containsKey(articleDTO.getCreateUser())) {
                articleDTO.setCreateUserName(idUsers.get(articleDTO.getCreateUser()).get(0).getName());
                articleDTO.setPicture(idUsers.get(articleDTO.getCreateUser()).get(0).getPicture());
            }
            if (userIdToUserLevel.containsKey(articleDTO.getCreateUser())) {
                articleDTO.setLevel(userIdToUserLevel.get(articleDTO.getCreateUser()).get(0).getLevel());
            }
            // ?????????????????????
            if (!articleToLabelMap.isEmpty()) {
                articleDTO.setLabelDTOS(articleToLabelMap.get(articleDTO.getId()));
            }
            articleDTO.setArticleCountDTO(this.getCountById(articleDTO.getId(), currentUser));
        });
    }


    /**
     * ??????????????????
     *
     * @param bytes
     * @return
     */
    private Boolean isFileNotTooBig(byte[] bytes) {
        // ??????????????????
        long currentFileSize = bytes.length;
        // ?????????????????????????????????
        long fileLength = imageUtils.getFileLength();
        if (currentFileSize <= fileLength) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * ?????????????????????mongo???
     *
     * @param articleId
     * @param markdown
     * @param html
     * @param userId
     * @param now
     */
    private void insertArticleContent(Integer articleId, String markdown, String html, Long userId, LocalDateTime now) {
        ArticleMarkdownInfo articleMarkdownInfo = new ArticleMarkdownInfo();
        articleMarkdownInfo.setArticleId(articleId);
        articleMarkdownInfo.setArticleMarkdown(markdown);
        articleMarkdownInfo.setArticleHtml(html);
        articleMarkdownInfo.setUserId(userId);
        articleMarkdownInfo.setTime(now);
        mongoTemplate.insert(Collections.singletonList(articleMarkdownInfo), ArticleMarkdownInfo.class);
    }

    /**
     * ?????????????????????mongo???
     *
     * @param articleId
     * @param markdown
     * @param html
     * @param userId
     * @param now
     */
    private void updateArticleContent(Integer articleId, String markdown, String html, Long userId, LocalDateTime now) {
        Query query = new Query(Criteria.where("articleId").is(articleId));
        Update update = new Update();
        update.set("articleMarkdown", markdown);
        update.set("articleHtml", html);
        update.set("userId", userId);
        update.set("time", now);
        mongoTemplate.updateMulti(query, update, ArticleMarkdownInfo.class);
    }

    /**
     * ????????????id????????????????????????
     *
     * @param articleIds
     * @return
     */
    private List<ArticleMarkdownInfo> getMarkdownByArticleIds(List<Integer> articleIds) {
        Query query = new Query(Criteria.where("articleId").in(articleIds));
        return mongoTemplate.find(query, ArticleMarkdownInfo.class);
    }

}
