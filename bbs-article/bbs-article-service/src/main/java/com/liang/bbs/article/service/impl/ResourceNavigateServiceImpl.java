package com.liang.bbs.article.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ResourceNavigateDTO;
import com.liang.bbs.article.facade.dto.ResourceNavigateSearchDTO;
import com.liang.bbs.article.facade.server.ResourceNavigateService;
import com.liang.bbs.article.persistence.entity.ResourceNavigatePo;
import com.liang.bbs.article.persistence.entity.ResourceNavigatePoExample;
import com.liang.bbs.article.persistence.mapper.ResourceNavigatePoMapper;
import com.liang.bbs.article.service.mapstruct.ResourceNavigateMS;
import com.liang.manage.auth.facade.server.FileService;
import com.liang.nansheng.common.auth.UserSsoDTO;
import com.liang.nansheng.common.enums.ImageTypeEnum;
import com.liang.nansheng.common.enums.ResponseCode;
import com.liang.nansheng.common.web.exception.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class ResourceNavigateServiceImpl implements ResourceNavigateService {
    @Autowired
    private ResourceNavigatePoMapper resourceNavigatePoMapper;

    @Reference
    private FileService fileService;

    /**
     * 获取资源导航
     *
     * @param resourceNavigateSearchDTO
     * @return
     */
    @Override
    public PageInfo<ResourceNavigateDTO> getList(ResourceNavigateSearchDTO resourceNavigateSearchDTO) {
        ResourceNavigatePoExample example = new ResourceNavigatePoExample();
        ResourceNavigatePoExample.Criteria criteria = example.createCriteria().andIsDeletedEqualTo(false);
        if (StringUtils.isNotBlank(resourceNavigateSearchDTO.getCategory())) {
            criteria.andCategoryEqualTo(resourceNavigateSearchDTO.getCategory());
        }
        example.setOrderByClause("`id` desc");
        PageHelper.startPage(resourceNavigateSearchDTO.getCurrentPage(), resourceNavigateSearchDTO.getPageSize());

        return ResourceNavigateMS.INSTANCE.toPage(new PageInfo<>(resourceNavigatePoMapper.selectByExample(example)));
    }

    /**
     * 新增资源导航
     *
     * @param resourceNavigateDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean create(ResourceNavigateDTO resourceNavigateDTO, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(resourceNavigateDTO.getResourceName()) ||
                StringUtils.isBlank(resourceNavigateDTO.getCategory()) ||
                StringUtils.isBlank(resourceNavigateDTO.getDesc()) ||
                StringUtils.isBlank(resourceNavigateDTO.getLink())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        if (isNameExist(null, resourceNavigateDTO.getResourceName())) {
            throw BusinessException.build(ResponseCode.NAME_EXIST, "资源导航名重复");
        }

        resourceNavigateDTO.setIsDeleted(false);
        resourceNavigateDTO.setCreateUser(currentUser.getUserId());
        resourceNavigateDTO.setUpdateUser(currentUser.getUserId());
        LocalDateTime now = LocalDateTime.now();
        resourceNavigateDTO.setCreateTime(now);
        resourceNavigateDTO.setUpdateTime(now);
        ResourceNavigatePo resourceNavigatePo = ResourceNavigateMS.INSTANCE.toPo(resourceNavigateDTO);
        if (resourceNavigatePoMapper.insertSelective(resourceNavigatePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "新增资源导航失败");
        }

        return true;
    }

    /**
     * 上传资源导航logo
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    @Override
    public String uploadResourceNavigateLogo(byte[] bytes, String sourceFileName) {
        try {
            // 文件上传（剪切）
            return fileService.fileCutUpload(bytes, sourceFileName, ImageTypeEnum.resourceNavigatePicture.name());
        } catch (Exception e) {
            log.error("资源导航Logo上传异常！", e);
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "资源导航Logo上传异常!");
        }
    }

    /**
     * 更新资源导航
     *
     * @param resourceNavigateDTO
     * @param currentUser
     * @return
     */
    @Override
    public Boolean update(ResourceNavigateDTO resourceNavigateDTO, UserSsoDTO currentUser) {
        if (StringUtils.isBlank(resourceNavigateDTO.getResourceName()) ||
                StringUtils.isBlank(resourceNavigateDTO.getCategory()) ||
                StringUtils.isBlank(resourceNavigateDTO.getDesc()) ||
                StringUtils.isBlank(resourceNavigateDTO.getLink())) {
            throw BusinessException.build(ResponseCode.NOT_EXISTS, "参数不合规");
        }
        if (isNameExist(resourceNavigateDTO.getId(), resourceNavigateDTO.getResourceName())) {
            throw BusinessException.build(ResponseCode.NAME_EXIST, "资源导航名重复");
        }
        resourceNavigateDTO.setIsDeleted(null);
        resourceNavigateDTO.setCreateUser(null);
        resourceNavigateDTO.setUpdateUser(currentUser.getUserId());
        resourceNavigateDTO.setCreateTime(null);
        resourceNavigateDTO.setUpdateTime(LocalDateTime.now());
        ResourceNavigatePo resourceNavigatePo = ResourceNavigateMS.INSTANCE.toPo(resourceNavigateDTO);
        if (resourceNavigatePoMapper.updateByPrimaryKeySelective(resourceNavigatePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "更新资源导航失败");
        }

        return true;
    }

    /**
     * 删除资源导航
     *
     * @param id
     * @return
     */
    @Override
    public Boolean delete(Integer id) {
        ResourceNavigatePo resourceNavigatePo = new ResourceNavigatePo();
        resourceNavigatePo.setId(id);
        resourceNavigatePo.setIsDeleted(true);
        if (resourceNavigatePoMapper.updateByPrimaryKeySelective(resourceNavigatePo) <= 0) {
            throw BusinessException.build(ResponseCode.OPERATE_FAIL, "删除失败");
        }

        return true;
    }

    /**
     * 获取资源导航所有类别
     *
     * @return
     */
    @Override
    public List<String> getCategorys() {
        List<String> categorys = new ArrayList<>();
        ResourceNavigatePoExample example = new ResourceNavigatePoExample();
        example.createCriteria().andIsDeletedEqualTo(false);
        List<ResourceNavigateDTO> resourceNavigateDTOS = ResourceNavigateMS.INSTANCE.toDTO(resourceNavigatePoMapper.selectByExample(example));
        if (CollectionUtils.isNotEmpty(resourceNavigateDTOS)) {
            categorys = resourceNavigateDTOS.stream().map(ResourceNavigateDTO::getCategory).distinct().collect(Collectors.toList());
        }
        return categorys;
    }

    /**
     * 判断资源导航名称是否已经存在
     *
     * @param resourceId   资源导航id
     * @param resourceName 资源导航名称
     * @return
     */
    private boolean isNameExist(Integer resourceId, String resourceName) {
        ResourceNavigatePoExample example = new ResourceNavigatePoExample();
        example.createCriteria().andIsDeletedEqualTo(false)
                .andResourceNameEqualTo(resourceName);
        List<ResourceNavigatePo> resourceNavigatePos = resourceNavigatePoMapper.selectByExample(example);
        if (resourceNavigatePos.size() > 1) {
            return true;
        } else if (resourceNavigatePos.size() == 1) {
            // 更新时labelId是有值的
            return !resourceNavigatePos.get(0).getId().equals(resourceId);
        }
        return false;
    }

}
