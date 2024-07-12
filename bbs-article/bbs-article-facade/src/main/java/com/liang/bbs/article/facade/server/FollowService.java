package com.liang.bbs.article.facade.server;

import com.github.pagehelper.PageInfo;
import com.liang.bbs.article.facade.dto.FollowCountDTO;
import com.liang.bbs.article.facade.dto.FollowDTO;
import com.liang.bbs.article.facade.dto.FollowSearchDTO;
import com.liang.nansheng.common.auth.UserSsoDTO;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:33
 */
public interface FollowService {

    /**
     * 获取所有的关注
     *
     * @param startTime
     * @param endTime
     * @return
     */
    List<FollowDTO> getPaasAll(LocalDateTime startTime, LocalDateTime endTime);

    /**
     * 获取关注的用户信息
     *
     * @param followSearchDTO
     * @param currentUser
     * @return
     */
    PageInfo<FollowDTO> getFollowUsers(FollowSearchDTO followSearchDTO, UserSsoDTO currentUser);

    /**
     * 通过id获取关注信息
     *
     * @param id
     * @return
     */
    FollowDTO getById(Integer id);

    /**
     * 通过fromUser和toUser获取关注信息
     *
     * @param fromUser
     * @param toUser
     * @param isAll    true:不区分关注与否，false:只查询关注了的
     * @return
     */
    FollowDTO getByFromToUser(Long fromUser, Long toUser, Boolean isAll);

    /**
     * 更新关注状态
     *
     * @param fromUser
     * @param toUser
     * @return
     */
    Boolean updateFollowState(Long fromUser, Long toUser);

    /**
     * 获取关注/粉丝数量
     *
     * @param userId
     * @return
     */
    FollowCountDTO getFollowCount(Long userId);

}
