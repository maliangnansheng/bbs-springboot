package com.liang.bbs.user.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_user_level
 * 
 * @author maliangnansheng
 * @date 2022/05/05 17:43
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLevelPo implements Serializable {
    /**
     * 用户等级编号
     */
    private Integer id;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 等级（Lv6）
     */
    private String level;

    /**
     * 积分
     */
    private Integer points;

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
