package com.lylbp.college.manger.redis.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import javax.annotation.Resource;

@Slf4j
@Service
public class RedisPoolFactory {

    @Resource
    RedisProperties redisProperties;

    @Bean
    public JedisPool JedisPoolFactory() {
        JedisPoolConfig poolConfig = new JedisPoolConfig();
        poolConfig.setMaxIdle(redisProperties.getPoolMaxIdle());
        poolConfig.setMaxTotal(redisProperties.getPoolMaxTotal());
        poolConfig.setMaxWaitMillis(redisProperties.getPoolMaxWait() * 1000);
        JedisPool jp = new JedisPool(poolConfig, redisProperties.getHost(), redisProperties.getPort(),
                redisProperties.getTimeout() * 1000, redisProperties.getPassword(), 0);
        return jp;
    }

}
