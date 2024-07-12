package com.liang.bbs.article.service.scheduler;

import com.liang.bbs.article.facade.server.DynamicService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author maliangnansheng
 * @date 2022/5/24 10:57
 */
@Component
@Slf4j
public class UserDynamicWorker {
    @Autowired
    private DynamicService dynamicService;

    @Autowired
    private RedissonClient redissonClient;

    @Async("asyncTaskExecutor")
    @Scheduled(cron = "0 0/1 * * * ?")
    public void threadTask() {
        execute();
    }

    private void execute() {
        RLock lock = redissonClient.getFairLock("user_dynamic_worker" + UUID.randomUUID());

        try {
            boolean b = lock.tryLock();
            if (b) {
                // 更新所有用户的动态信息
                dynamicService.updateAll();
            }
        } catch (Exception e) {
            log.error("UserLevelWorker failed!", e);
        } finally {
            // 由当前线程持有 and 锁住状态
            if (lock.isHeldByCurrentThread() && lock.isLocked()) {
                lock.unlock();
            }
        }
    }

}
