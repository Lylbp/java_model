package com.dar.road.core.aspect;

import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Aspect
@Component
public class LogAspect {

    private Logger logger = LoggerFactory.getLogger(LogAspect.class);

    private long start;

    private long end;

    //execution  后面填写拦截的controller的路径
    @Pointcut("execution(public * com.dar.road.controller.*.*(..))")
    public void log() {
    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint) {
        System.out.println("日志前置通知");
        start = System.currentTimeMillis();

        // 接收到请求，记录请求内容
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert attributes != null;
        HttpServletRequest request = attributes.getRequest();

        // 记录下请求内容
        logger.info("请求URL : " + request.getRequestURL());
        logger.info("请求IP : " + request.getRemoteAddr());
        logger.info("请求方法 : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());

        // 获取参数, 只取自定义的参数, 自带的HttpServletRequest, HttpServletResponse不管
        if (joinPoint.getArgs().length > 0) {
            for (Object o : joinPoint.getArgs()) {
                if (o instanceof HttpServletRequest || o instanceof HttpServletResponse) {
                    continue;
                }
                logger.info("请求参数 : " + JSON.toJSONString(o));
            }
        }
    }

    //获取接口返回的内容
    @AfterReturning(returning = "object",pointcut = "log()")
    public void doAfterReturining(Object object) {
        System.out.println("日志结束返回通知");
        end = System.currentTimeMillis();
        logger.info("time={}", (end - start) + "ms");

        logger.info("返回 : " + JSON.toJSONString(object));

    }
}
