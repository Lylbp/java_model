package com.lylbp.college.manger.redis.config;

import lombok.Data;

@Data
public class RedisConfig {
	private String host;
	private int port;
	private String password;
	private int timeout;
	private int poolMaxTotal;
	private int poolMaxIdle;
	private int poolMaxWait;
}
