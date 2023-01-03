package com.liang.bbs.common.enums;

import lombok.Getter;

/**
 * @author 马亮
 * @date 2022/6/13 18:04
 */
@Getter
public enum DynamicTypeEnum {
    /**
     * 写文章
     */
    writeArticle("写文章"),
    likeArticle("点赞文章"),
    likeComment("点赞评论"),
    commentArticle("评论文章"),
    commentReply("评论回复"),
    followUser("关注用户");

    /**
     * 说明
     */
    private String desc;

    DynamicTypeEnum(String name) {
        this.desc = name;
    }

}
