package com.ems.aop;

import com.alibaba.fastjson.JSON;
import com.ems.exception.CommonException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@Aspect
public class LogAop {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Around("execution(* com.ems.controller..*Controller.*(..))")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        return getObject(proceedingJoinPoint);
    }

    private Object getObject(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object result = null;
        int normal = 0;
        String exception = null;
        try {
            result = proceedingJoinPoint.proceed();
        } catch (CommonException c) {
            normal = 1;
            exception = CommonException.getStackTrace(c);
        } catch (Exception e) {
            normal = 2;
            exception = CommonException.getStackTrace(e);
        }
        logger.info(JSON.toJSONString(result));
        return result;
    }

}
