package com.liang.bbs.article.persistence.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 对应数据表为：fs_comment
 *
 * @author maliang
 * @date 2022/05/01 11:57
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentPo implements Serializable {
    /**
     * 评论编号
     */
    private Integer id;

    /**
     * 父评论id
     */
    private Integer preId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 被评论帖子id
     */
    private Integer articleId;

    /**
     * 状态(0禁用,1启用)
     */
    private Boolean state;

    /**
     * 逻辑删除(0正常,1删除)
     */
    private Boolean isDeleted;

    /**
     * 评论用户id
     */
    private Long commentUser;

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