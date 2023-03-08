package com.liang.bbs.article.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.ResourceNavigateDTO;
import com.liang.bbs.article.facade.dto.ResourceNavigateSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface ResourceNavigateService {
    /**
     * 获取资源导航
     *
     * @param resourceNavigateSearchDTO
     * @return
     */
    PageInfo<ResourceNavigateDTO> getList(ResourceNavigateSearchDTO resourceNavigateSearchDTO);

    /**
     * 新增资源导航
     *
     * @param resourceNavigateDTO
     * @param currentUser
     * @return
     */
    Boolean create(ResourceNavigateDTO resourceNavigateDTO, UserSsoDTO currentUser);

    /**
     * 上传资源导航logo
     *
     * @param bytes
     * @param sourceFileName
     * @return
     */
    String uploadResourceNavigateLogo(byte[] bytes, String sourceFileName);

    /**
     * 更新资源导航
     *
     * @param resourceNavigateDTO
     * @param currentUser
     * @return
     */
    Boolean update(ResourceNavigateDTO resourceNavigateDTO, UserSsoDTO currentUser);

    /**
     * 删除资源导航
     *
     * @param id
     * @return
     */
    Boolean delete(Integer id);

    /**
     * 获取资源导航所有类别
     *
     * @return
     */
    List<String> getCategorys();
}
