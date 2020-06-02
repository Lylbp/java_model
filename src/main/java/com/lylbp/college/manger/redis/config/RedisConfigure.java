package com.lylbp.college.manger.redis.config;

import com.lylbp.college.manger.redis.service.RedisService;
import com.lylbp.college.manger.redis.service.imp.RedisServiceImp;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConditionalOnClass(RedisService.class)
@EnableConfigurationProperties(RedisProperties.class)
@AllArgsConstructor
public class RedisConfigure {
    private RedisProperties properties;

    @Bean
    @ConditionalOnMissingBean
    public RedisService redisService() {
        RedisConfig redisConfig = new RedisConfig();
        redisConfig.setHost(StringUtils.trimToNull(this.properties.getHost()));
        redisConfig.setPassword(StringUtils.trimToNull(this.properties.getPassword()));
        redisConfig.setPoolMaxIdle(this.properties.getPoolMaxIdle());
        redisConfig.setPoolMaxTotal(this.properties.getPoolMaxTotal());
        redisConfig.setPort(this.properties.getPort());
        redisConfig.setTimeout(this.properties.getTimeout());

        RedisService redisService = new RedisServiceImp();
        redisService.setRedisConfig(redisConfig);
        return redisService;
    }
}
