package com.ems.config;

import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class ConfigureBeans {

    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
        LifecycleBeanPostProcessor lifecycleBeanPostProcessor = new LifecycleBeanPostProcessor();
        return lifecycleBeanPostProcessor;
    }

    @Bean
    public MemoryConstrainedCacheManager memoryConstrainedCacheManager(){
        return new MemoryConstrainedCacheManager();
    }

    @Bean
    public ShiroConfigure shiroConfigure(MemoryConstrainedCacheManager memoryConstrainedCacheManager){
        ShiroConfigure shiroConfigure = new ShiroConfigure();
        shiroConfigure.setCacheManager(memoryConstrainedCacheManager);
        return shiroConfigure;
    }

    @Bean
    public DefaultWebSecurityManager defaultWebSecurityManager(ShiroConfigure shiroConfigure){
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setAuthorizer(shiroConfigure);
        return defaultWebSecurityManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(DefaultWebSecurityManager defaultSecurityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(defaultSecurityManager);
        shiroFilterFactoryBean.setLoginUrl("/index");
        shiroFilterFactoryBean.setUnauthorizedUrl("/index");
        shiroFilterFactoryBean.setSuccessUrl("/");
        return shiroFilterFactoryBean;
    }
}
