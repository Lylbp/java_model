package com.lylbp.college.core.configure;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan("com.lylbp.college.mapper")
public class MybatisPlusConfig {
}
