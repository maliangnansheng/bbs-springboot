package com.liang.bbs.article.service.impl;

import com.liang.bbs.article.facade.dto.SlideshowDTO;
import com.liang.bbs.article.facade.server.SlideshowService;
import com.liang.bbs.article.persistence.entity.SlideshowPoExample;
import com.liang.bbs.article.persistence.mapper.SlideshowPoMapper;
import com.liang.bbs.article.service.mapstruct.SlideshowMS;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2022/4/6 14:36
 */
@Slf4j
@Component
@Service
public class SlideshowServiceImpl implements SlideshowService {

    @Autowired
    private SlideshowPoMapper slideshowPoMapper;

    @Override
    public List<SlideshowDTO> getList() {
        SlideshowPoExample example = new SlideshowPoExample();
        example.createCriteria().andStateEqualTo(true)
                .andIsDeletedEqualTo(false);

        return SlideshowMS.INSTANCE.toDTO(slideshowPoMapper.selectByExample(example));
    }

}
