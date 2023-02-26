package com.liang.bbs.user.service.scheduler;

import com.liang.bbs.user.facade.server.DynamicService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author 马亮
 * @date 2022/5/24 10:57
 */
@Component
@Slf4j
public class UserDynamicWorker {
    @Autowired
    private DynamicService dynamicService;

    @Autowired
    private RedissonClient redissonClient;

    /**
     * 每10分钟执行
     */
    @Scheduled(cron = "0 0/10 * * * ?")
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
