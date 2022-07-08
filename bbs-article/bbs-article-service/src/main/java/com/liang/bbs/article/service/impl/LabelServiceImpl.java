package com.liang.bbs.article.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.LabelDTO;
import com.liang.bbs.article.facade.dto.LabelSearchDTO;
import com.liang.bbs.article.facade.server.ArticleLabelService;
import com.liang.bbs.article.facade.server.LabelService;
import com.liang.bbs.article.persistence.entity.LabelPo;
import com.liang.bbs.article.persistence.entity.LabelPoExample;
import com.liang.bbs.article.persistence.mapper.LabelPoMapper;
import com.liang.bbs.article.service.mapstruct.LabelMS;
import com.liang.bbs.article.service.utils.FileUploadUtils;
import com.liang.bbs.article.service.utils.ImageUtils;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ImageTypeEnum;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.utils.CommonUtils;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author 马亮
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class LabelServiceImpl implements LabelService {
    @Autowired
    private LabelPoMapper labelPoMapper;

    @Autowired
    private ArticleLabelService articleLabelService;

    @Autowired
    private ImageUtils imageUtils;

    @Autowired
    private FileUploadUtils fileUploadUtils;

    /**
     * 获取标签
     *
     * @param labelSearchDTO
     * @return
     */
    @Override
    public PageInfo<LabelDTO> getList(LabelSearchDTO labelSearchDTO) {
        LabelPoExample example = new LabelPoExample();
        LabelPoExample.Criteria criteria = example.createCriteria().andIsDeletedEqualTo(false);
        if (labelSearchDTO.getId() != null) {
            criteria.andIdEqualTo(labelSearchDTO.getId());
        }
        if (StringUtils.isNotBlank(labelSearchDTO.getLabelName())) {
            criteria.andLabelNameLike("%" + labelSearchDTO.getLabelName() + "%");
        }
        example.setOrderByClause("`id` desc");

        PageHelper.startPage(labelSearchDTO.getCurrentPage(), labelSearchDTO.getPageSize());
        PageInfo<LabelDTO> pageInfo = LabelMS.INSTANCE.toPage(new PageInfo<>(labelPoMapper.selectByExample(example)));
        pageInfo.getList().forEach(labelDTO -> {
            labelDTO.setArticleUseCount(articleLabelService.getCountByLabelId(labelDTO.getId()));
        });

        return pageInfo;
    }

    /**
     * 通过标签id集合获取标签信息
     *
     * @param ids
     * @return
     */
    @Override
    public List<LabelDTO> getByIds(List<Integer> ids) {
        LabelPoExample example = new LabelPoExample();
        example.createCriteria().andIsDeletedEqualTo(false).andIdIn(ids);
        return LabelMS.INSTANCE.toDTO(labelPoMapper.selectByExample(example));
    }

    /**
     * 新增标签
     *
     * @param labelDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(LabelDTO labelDTO, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(labelDTO.getLabelName())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        if (isNameExist(null, labelDTO.getLabelName())) {
            throw BusinessException.build(ResponseCode.NAME_EXIST, "标签名重复");
        }

        labelDTO.setIsDeleted(false);
        labelDTO.setCreateUser(currentUser.getUserId());
        labelDTO.setUpdateUser(currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        labelDTO.setCreateTime(now);
        labelDTO.setUpdateTime(now);
        LabelPo labelPo = LabelMS.INSTANCE.toPo(labelDTO);
        if (labelPoMapper.insertSelective(labelPo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "新增标签失败");
        }

        return true;
    }

    /**
     * 上传标签logo
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    @Override
    public String uploadLabelLogo(byte[] bytes, String sourceFileName) {
        try {
            // 文件没有超过限制
            if (isFileNotTooBig(bytes)) {
                return fileUploadUtils.fileUpload(imageUtils.pictureCut(bytes), sourceFileName, ImageTypeEnum.labelPicture.name());
            } else {
                throw BusinessException.build(ResponseCode.EXCEED_THE_MAX, "请上传不超过 " + CommonUtils.byteConversion(imageUtils.getFileLength()) + " 的标签Logo!");
            }
        } catch (Exception e) {
            log.error("标签Logo上传异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "标签Logo上传异常!");
        }
    }

    /**
     * 更新标签
     *
     * @param labelDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(LabelDTO labelDTO, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(labelDTO.getLabelName())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        if (isNameExist(labelDTO.getId(), labelDTO.getLabelName())) {
            throw BusinessException.build(ResponseCode.NAME_EXIST, "系统名重复");
        }
        labelDTO.setIsDeleted(null);
        labelDTO.setCreateUser(null);
        labelDTO.setUpdateUser(currentUser.getUserId());
        labelDTO.setCreateTime(null);
        labelDTO.setUpdateTime(LocalDateTime.now());
        LabelPo labelPo = LabelMS.INSTANCE.toPo(labelDTO);
        if (labelPoMapper.updateByPrimaryKeySelective(labelPo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新标签失败");
        }

        return true;
    }

    /**
     * 删除标签
     *
     * @param id
     * @return
     */
    @Override
    public Boolean delete(Integer id) {
        LabelPo labelPo = new LabelPo();
        labelPo.setId(id);
        labelPo.setIsDeleted(true);
        if (labelPoMapper.updateByPrimaryKeySelective(labelPo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "删除失败");
        }

        return true;
    }

    /**
     * 判断标签名称是否已经存在
     *
     * @param labelId   标签id
     * @param labelName 标签名称
     * @return
     */
    private boolean isNameExist(Integer labelId, String labelName) {
        LabelPoExample example = new LabelPoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andLabelNameEqualTo(labelName);
        List<LabelPo> labelPos = labelPoMapper.selectByExample(example);
        if (labelPos.size() > 1) {
            return true;
        } else if (labelPos.size() == 1) {
            // 更新时labelId是有值的
            return !labelPos.get(0).getId().equals(labelId);
        }
        return false;
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

}
