package com.liang.bbs.article.facade.dto;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author maliangnansheng
 * @date 2022/5/20 15:22
 */
@Data
public class UserLevelDTO implements Serializable {
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
