package com.liang.bbs.user.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.user.facade.dto.UserForumDTO;
import com.liang.bbs.user.facade.dto.UserLevelDTO;
import com.liang.bbs.user.facade.dto.UserSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface UserLevelService {
    /**
     * 创建用户等级信息
     *
     * @param userId
     * @return
     */
    Boolean create(Long userId);

    /**
     * 更新用户等级信息
     *
     * @param userId 用户id
     * @param points 积分
     * @return
     */
    Boolean update(Long userId,  Integer points);

    /**
     * 更新所有用户等级信息
     *
     * @return
     */
    Boolean updatePointsAll();

    /**
     * 同步所有用户等级信息
     *
     * @return
     */
    Boolean syncAll();

    /**
     * 获取热门作者列表
     *
     * @param userSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<UserForumDTO> getHotAuthorsList(UserSearchDTO userSearchDTO, UserSsoDTO currentUser);

    /**
     * 通过用户id获取用户等级信息
     *
     * @param userId
     * @return
     */
    List<UserLevelDTO> getByUserId(Long userId);

    /**
     * 通过用户id集合获取用户等级信息
     *
     * @param userIds
     * @return
     */
    List<UserLevelDTO> getByUserIds(List<Long> userIds);

    /**
     * 获取用户信息
     *
     * @param userId
     * @param currentUser
     * @return
     */
    UserForumDTO getUserInfo(Long userId, UserSsoDTO currentUser);
}
