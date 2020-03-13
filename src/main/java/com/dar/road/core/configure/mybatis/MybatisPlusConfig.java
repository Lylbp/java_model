package com.dar.road.core.configure.mybatis;

import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.dar.road.mapper")
public class MybatisPlusConfig {
}
