package com.liang.bbs.user.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_follow
 *
 * @author W9009820
 * @date 2022/04/18 18:14
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FollowPo implements Serializable {
    /**
     * 关注编号
     */
    private Integer id;

    /**
     * 发起关注的人
     */
    private Long fromUser;

    /**
     * 状态(0取消,1关注)
     */
    private Boolean state;

    /**
     * 被关注的人
     */
    private Long toUser;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    private LocalDateTime updateTime;

    private static final long serialVersionUID = 1L;
}