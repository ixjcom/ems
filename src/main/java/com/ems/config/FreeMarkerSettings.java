package com.ems.config;

import freemarker.template.TemplateException;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.Map;

@ComponentScan
public class FreeMarkerSettings extends FreeMarkerConfigurer implements ApplicationContextAware{

    private ApplicationContext context;
    private ServletContext servletContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        super.setServletContext(servletContext);
        this.servletContext = servletContext;
    }

    @Override
    public void afterPropertiesSet() throws IOException, TemplateException {
        super.afterPropertiesSet();
        initAutoImports();
    }

    protected void initAutoImports() {
        getConfiguration().addAutoInclude("/macros/spring.ftl");
        getConfiguration().addAutoInclude("/macros/security.ftl");
        getConfiguration().addAutoImport("s", "/macros/mvc.ftl");
        getConfiguration().addAutoImport("sec", "/macros/sec.ftl");
    }
}
