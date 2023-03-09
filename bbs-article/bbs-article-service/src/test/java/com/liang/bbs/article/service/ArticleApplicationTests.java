package com.liang.bbs.article.service;

import com.liang.bbs.article.facade.server.ArticleService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ArticleApplicationTests {

    @Autowired
    private ArticleService articleService;

    @Test
    void contextLoads() {
    }

}
