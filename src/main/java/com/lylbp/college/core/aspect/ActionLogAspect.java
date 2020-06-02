package com.lylbp.college.core.aspect;

import com.lylbp.college.core.annotation.ActionLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @Author weiwenbin
 * @Date 2020-03-29 17:20
 */
@Aspect
@Component
public class ActionLogAspect {
    private static final Logger logger = LoggerFactory.getLogger(ActionLogAspect.class);
    ////////////////////////////////////////////////////////////
    /***
     * 定义controller切入点拦截规则，拦截ActionLog注解的方法
     */
    @Pointcut("@annotation(com.lylbp.college.core.annotation.ActionLog)")
    public void actionLogAspect() {

    }

    /***
     * 拦截控制层的操作日志
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Before(value = "actionLogAspect() && @annotation(actionLog)")
    public void recordLog(JoinPoint joinPoint, ActionLog actionLog) throws Throwable {
//        DateTime date = DateUtil.date();
//        com.lylbp.college.core.entity.ActionLog log = new com.lylbp.college.core.entity.ActionLog();
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        assert attributes != null;
//        HttpServletRequest request = attributes.getRequest();
//        String descrption = actionLog.descrption();
//
//        String userId = "操作人id";
//        String userName = "操作人名称";
//        String remoteIp = StringUtil.getRemoteIp(request);
//        String requestURI = request.getRequestURI();
//        String format = DateUtil.format(date, "yyyy-MM-dd HH:mm:ss");
//
//        log.setUserId(userId);
//        log.setUserName(userName);
//        log.setRemoteAddr(remoteIp);
//        log.setDescrption(descrption);
//        log.setRequestURI(requestURI);
//        log.setCreateDate(format);
//
//        logger.info(JSON.toJSONString(log));
    }

    /**
     * 返回通知
     * @param ret
     * @throws Throwable
     */
    @AfterReturning(returning = "ret", pointcut = "actionLogAspect()")
    public void doAfterReturning(Object ret) {

    }

    /**
     * 异常通知
     * @param e
     */
    @AfterThrowing(pointcut = "actionLogAspect()",throwing = "e")
    public void doAfterThrowable(Throwable e){

    }
}
