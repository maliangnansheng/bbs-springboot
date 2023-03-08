package com.liang.bbs.user.service.channel;

import com.alibaba.fastjson.JSON;
import com.liang.bbs.user.facade.server.UserLevelService;
import com.liang.manage.auth.facade.dto.user.UserTokenDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

/**
 * @author maliangnansheng
 * @date 2022/6/9 18:48
 */
@Component
@Slf4j
@RocketMQMessageListener(topic = "${rocketmq.user.topic}", consumerGroup = "${rocketmq.consumer.group}")
public class UserInfoListener implements RocketMQListener<String>  {
    @Reference
    private UserLevelService userLevelService;

    @Override
    public void onMessage(String message) {
        log.info("收到消息 > UserTokenDTO: {}", message);
        // 创建用户等级信息
        userLevelService.create(JSON.parseObject(message, UserTokenDTO.class).getUserId());
    }
}
