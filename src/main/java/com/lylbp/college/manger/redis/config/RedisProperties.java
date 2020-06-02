package com.lylbp.college.manger.redis.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;


@Data
@ConfigurationProperties(prefix="redis")
public class RedisProperties {
	private String host;
	private int port;
	private int timeout;//秒
	private String password;
	private int poolMaxTotal;
	private int poolMaxIdle;
	private int poolMaxWait;//秒
}
