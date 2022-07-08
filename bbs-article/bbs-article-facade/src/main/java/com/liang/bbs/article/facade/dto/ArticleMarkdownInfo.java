package com.liang.bbs.article.facade.dto;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

/**
 * @author 马亮南生
 * @date 2022-05-16 20:54
 */
@Data
@Document("bbs_article_markdown_info")
public class ArticleMarkdownInfo {
    @Id
    private String id;

    /**
     * 文章id
     */
    private Integer articleId;

    /**
     * 文章内容markdown
     */
    private String articleMarkdown;

    /**
     * 文章内容html
     */
    private String articleHtml;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 时间（创建/更新）
     */
    private LocalDateTime time;
}
