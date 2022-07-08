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
 * @author 马亮
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
     * 获取文章
     *
     * @param articleSearchDTO
     * @param currentUser
     * @return
     */
    @Override
    public PageInfo<ArticleDTO> getList(ArticleSearchDTO articleSearchDTO, UserSsoDTO currentUser) {
        List<Integer> articleIds = new ArrayList<>();
        if (CollectionUtils.isNotEmpty(articleSearchDTO.getLabelIds())) {
            // 根据标签id集合获取文章标签信息
            List<ArticleLabelDTO> articleLabelDTOS = articleLabelService.getByLabelIds(articleSearchDTO.getLabelIds());
            if (CollectionUtils.isNotEmpty(articleLabelDTOS)) {
                articleIds = articleLabelDTOS.stream().map(ArticleLabelDTO::getArticleId).collect(Collectors.toList());
            } else {
                // 该标签下没有文章
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

        // 构建文章信息
        buildArticleInfo(pageInfo.getList(), currentUser);

        return pageInfo;
    }

    /**
     * 获取点赞过的文章
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

            // 构建文章信息
            buildArticleInfo(articleDTOS, currentUser);
            pageInfo.setList(articleDTOS);
        }

        return pageInfo;
    }

    /**
     * 通过文章id集合获取文章信息
     *
     * @param ids
     * @param isPv 是否增加文章浏览数量
     * @param currentUser
     * @return
     */
    @Override
    public List<ArticleDTO> getByIds(List<Integer> ids, Boolean isPv, UserSsoDTO currentUser) {
        List<ArticleDTO> articleDTOS = getBaseByIds(ids);
        if (CollectionUtils.isEmpty(articleDTOS)) {
            return articleDTOS;
        }

        // 构建文章信息
        buildArticleInfo(articleDTOS, currentUser);

        // 获取文章内容
        List<ArticleMarkdownInfo> articleMarkdownInfos = getMarkdownByArticleIds(ids);
        Map<Integer, List<ArticleMarkdownInfo>> articleId2List = articleMarkdownInfos.stream().collect(Collectors.groupingBy(ArticleMarkdownInfo::getArticleId));
        articleDTOS.forEach(articleDTO -> {
            if (articleId2List.containsKey(articleDTO.getId())) {
                ArticleMarkdownInfo articleMarkdownInfo = articleId2List.get(articleDTO.getId()).get(0);
                articleDTO.setMarkdown(articleMarkdownInfo.getArticleMarkdown());
                articleDTO.setHtml(articleMarkdownInfo.getArticleHtml());
            }
        });

        // 增加文章浏览数量
        if (isPv != null && isPv) {
            this.updatePv(articleDTOS.get(0));
        }

        return articleDTOS;
    }

    /**
     * 通过文章id集合获取文章信息(最基础的信息)
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
     * 撰写文章（无配图）
     *
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(articleDTO.getTitle()) || StringUtils.isBlank(articleDTO.getHtml())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        articleDTO.setIsDeleted(false);
        String content = CommonUtils.html2Text(articleDTO.getHtml());
        articleDTO.setContent(content.length() < contentMax ? content : content.substring(0, contentMax));
        articleDTO.setCreateUser(currentUser.getUserId());
        articleDTO.setUpdateUser(currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        articleDTO.setCreateTime(now);
        articleDTO.setUpdateTime(now);
        // 通过审核的文章才会启用（即：默认禁用）
        articleDTO.setState(true);
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        if (articlePoMapper.insertSelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "撰写文章失败");
        }
        // 新增文件标签关系信息
        articleLabelService.create(labelIds, articlePo.getId(), currentUser);

        // 插入文章内容（mongo）
        insertArticleContent(articlePo.getId(), articleDTO.getMarkdown(), articleDTO.getHtml(), currentUser.getUserId(), now);

        return true;
    }

    /**
     * 更新文章（无配图）
     *
     * @param articleDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(ArticleDTO articleDTO, List<Integer> labelIds, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(articleDTO.getTitle()) || StringUtils.isBlank(articleDTO.getHtml())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        String content = CommonUtils.html2Text(articleDTO.getHtml());
        articleDTO.setContent(content.length() < contentMax ? content : content.substring(0, contentMax));
        LocalDateTime now = LocalDateTime.now();
        articleDTO.setUpdateTime(now);
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        if (articlePoMapper.updateByPrimaryKeySelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新文章失败");
        }
        // 更新文件标签关系信息
        articleLabelService.update(labelIds, articlePo.getId(), currentUser);

        // 更新文章内容（mongo）
        updateArticleContent(articlePo.getId(), articleDTO.getMarkdown(), articleDTO.getHtml(), currentUser.getUserId(), now);

        return true;
    }

    /**
     * 撰写文章
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
            // 文件没有超过限制
            if (isFileNotTooBig(bytes)) {
                articleDTO.setTitleMap(fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articleTitleMap.name()));
                create(articleDTO, labelIds, currentUser);
            } else {
                throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " 的题图!");
            }
        } catch (Exception e) {
            log.error("撰写文章异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "撰写文章异常!");
        }

        return null;
    }

    /**
     * 更新文章
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
            // 文件没有超过限制
            if (isFileNotTooBig(bytes)) {
                articleDTO.setTitleMap(fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articleTitleMap.name()));
                update(articleDTO, labelIds, currentUser);
            } else {
                throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " 的题图!");
            }
        } catch (Exception e) {
            log.error("撰写文章异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新文章异常!");
        }

        return null;
    }

    /**
     * 上传图片（一张）- mavonEditor
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    @Override
    public String uploadPicture(byte[] bytes, String sourceFileName) {
        // 文件超过限制
        if (!isFileNotTooBig(bytes)) {
            throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " 的题图!");
        }

        return fileUploadUtils.fileUpload(imageUtils.pictureScale(bytes), sourceFileName, ImageTypeEnum.articlePicture.name());
    }

    /**
     * 获取文章评论访问总数
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
     * 获取文章数量
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
     * 获取用户阅读数量
     *
     * @param userIds
     * @return
     */
    @Override
    public List<ArticleReadDTO> getUserReadCount(List<Long> userIds) {
        return articlePoExMapper.selectUserReadCount(userIds);
    }

    /**
     * 获取文章一些统计数据
     *
     * @param id
     * @param currentUser
     * @return
     */
    @Override
    public ArticleCountDTO getCountById(Integer id, UserSsoDTO currentUser) {
        // 获取文章信息
        ArticlePo articlePo = articlePoMapper.selectByPrimaryKey(id);
        ArticleCountDTO articleCountDTO = new ArticleCountDTO();
        // 获取文章点赞数量
        articleCountDTO.setLikeCount(likeService.getLikeCountArticle(Collections.singletonList(id)));
        // 是否已经点赞、通过fromUser和toUser获取关注信息
        if (currentUser != null) {
            articleCountDTO.setIsLike(likeService.isLike(id, currentUser.getUserId()));
            FollowDTO followDTO = followService.getByFromToUser(currentUser.getUserId(), articlePo.getCreateUser(), false);
            if (followDTO != null) {
                articleCountDTO.setIsFollow(true);
            }
        }
        // 获取文章评论数量
        articleCountDTO.setCommentCount(commentService.getCommentCountByArticle(id));
        // 获取用户等级
        List<UserLevelDTO> userLevelDTOS = userLevelService.getByUserId(articlePo.getCreateUser());
        if (CollectionUtils.isNotEmpty(userLevelDTOS)) {
            articleCountDTO.setLevel(userLevelDTOS.get(0).getLevel());
        }

        return articleCountDTO;
    }

    /**
     * 增加文章浏览数量
     *
     * @param articleDTO
     * @return
     */
    @Override
    public Boolean updatePv(ArticleDTO articleDTO) {
        ArticlePo articlePo = ArticleMS.INSTANCE.toPo(articleDTO);
        articlePo.setPv(articlePo.getPv() + 1);
        if (articlePoMapper.updateByPrimaryKeySelective(articlePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "增加文章浏览量失败");
        }
        return true;
    }

    /**
     * 通过用户获取文章信息
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
     * 获取文章id到标签信息的映射
     *
     * @param articleIds
     * @return
     */
    private Map<Integer, List<LabelDTO>> getArticleIdToLabels(List<Integer> articleIds) {
        // 文章id到标签信息的映射（key:文章id, value:标签信息）
        Map<Integer, List<LabelDTO>> articleToLabelMap = new HashMap<>();

        List<ArticleLabelDTO> articleLabelDTOS = articleLabelService.getByArticleIds(articleIds);
        if (CollectionUtils.isNotEmpty(articleLabelDTOS)) {
            // 获取所有的标签id集合
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
     * 构建文章信息
     *
     * @param articleDTOS
     * @param currentUser
     */
    private void buildArticleInfo(List<ArticleDTO> articleDTOS, UserSsoDTO currentUser) {
        // 获取文章id到标签信息的映射
        List<Integer> articleIds = articleDTOS.stream().map(ArticleDTO::getId).collect(Collectors.toList());
        Map<Integer, List<LabelDTO>> articleToLabelMap = getArticleIdToLabels(articleIds);

        // 通过用户id集合获取用户信息
        List<Long> userIds = articleDTOS.stream().map(ArticleDTO::getCreateUser).collect(Collectors.toList());
        // 用户基础信息
        Map<Long, List<UserDTO>> idUsers = userService.getByIds(userIds).stream().collect(Collectors.groupingBy(UserDTO::getId));
        // 用户等级信息
        Map<Long, List<UserLevelDTO>> userIdToUserLevel = userLevelService.getByUserIds(userIds).stream().collect(Collectors.groupingBy(UserLevelDTO::getUserId));
        // 通过id获取name
        articleDTOS.forEach(articleDTO -> {
            if (idUsers.containsKey(articleDTO.getCreateUser())) {
                articleDTO.setCreateUserName(idUsers.get(articleDTO.getCreateUser()).get(0).getName());
                articleDTO.setPicture(idUsers.get(articleDTO.getCreateUser()).get(0).getPicture());
            }
            if (userIdToUserLevel.containsKey(articleDTO.getCreateUser())) {
                articleDTO.setLevel(userIdToUserLevel.get(articleDTO.getCreateUser()).get(0).getLevel());
            }
            // 数据库里面去拿
            if (!articleToLabelMap.isEmpty()) {
                articleDTO.setLabelDTOS(articleToLabelMap.get(articleDTO.getId()));
            }
            articleDTO.setArticleCountDTO(this.getCountById(articleDTO.getId(), currentUser));
        });
    }


    /**
     * 文件是否过大
     *
     * @param bytes
     * @return
     */
    private Boolean isFileNotTooBig(byte[] bytes) {
        // 当前文件大小
        long currentFileSize = bytes.length;
        // 上传源文件允许的最大值
        long fileLength = imageUtils.getFileLength();
        if (currentFileSize <= fileLength) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 插入文章内容（mongo）
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
     * 更新文章内容（mongo）
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
     * 通过文章id集合获取文章内容
     *
     * @param articleIds
     * @return
     */
    private List<ArticleMarkdownInfo> getMarkdownByArticleIds(List<Integer> articleIds) {
        Query query = new Query(Criteria.where("articleId").in(articleIds));
        return mongoTemplate.find(query, ArticleMarkdownInfo.class);
    }

}
