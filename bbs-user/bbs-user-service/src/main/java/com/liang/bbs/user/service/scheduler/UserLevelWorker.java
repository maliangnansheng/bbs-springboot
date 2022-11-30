package com.liang.bbs.user.service.scheduler;

import com.liang.bbs.user.facade.server.UserLevelService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author 马亮
 * @date 2022/5/24 10:57
 */
@Component
@Slf4j
public class UserLevelWorker {
    @Autowired
    private UserLevelService userLevelService;

    @Autowired
    private RedissonClient redissonClient;

    /**
     * 每天凌晨1点执行
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void threadTask() {
        execute();
    }

    private void execute() {
        RLock lock = redissonClient.getFairLock("user_level_worker");

        try {
            boolean b = lock.tryLock();
            if (b) {
                log.info("开始更新所有用户的等级信息--------------------------------->");
                // 更新所有用户的等级信息
                userLevelService.updateAll();
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

    /**
     * 每天5分钟执行
     */
    @Scheduled(cron = "0 0/5 * * * ?")
    public void threadTask2() {
        executeNull();
    }

    private void executeNull() {
        RLock lock = redissonClient.getFairLock("user_level_null_worker");

        try {
            boolean b = lock.tryLock();
            if (b) {
                log.info("开始同步所有用户的等级信息--------------------------------->");
                // 同步所有用户的等级信息
                userLevelService.syncAll();
            }
        } catch (Exception e) {
            log.error("UserLevelWorker > executeNull failed!", e);
        } finally {
            // 由当前线程持有 and 锁住状态
            if (lock.isHeldByCurrentThread() && lock.isLocked()) {
                lock.unlock();
            }
        }
    }

}
