package com.lylbp;

import com.lylbp.common.utils.SpringUtil;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication(exclude = {org.activiti.spring.boot.SecurityAutoConfiguration.class,
        SecurityAutoConfiguration.class})
public class JavaModelApplication {
    public static void main(String[] args) {
        ConfigurableApplicationContext configurableApplicationContext =
                SpringApplication.run(JavaModelApplication.class, args);
        SpringUtil.applicationContext = configurableApplicationContext;
    }
}
