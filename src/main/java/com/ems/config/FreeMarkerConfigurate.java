package com.ems.config;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.util.Map;
import java.util.Properties;

@Configuration
public class FreeMarkerConfigurate {

    @Value("${ems.version:}")
    private String version;

    @Value("${ems.system.name:}")
    private String emsSystemName;

    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer(){
        FreeMarkerConfigurer freeMarkerConfigurer = new FreeMarkerConfigurer();
        freeMarkerConfigurer.setTemplateLoaderPath("classpath:/templates/");

        Properties properties = new Properties();
        properties.setProperty("template_update_delay","5");
        properties.setProperty("url_escaping_charset","UTF-8");
        properties.setProperty("default_encoding","UTF-8");
        properties.setProperty("output_encoding","UTF-8");
        properties.setProperty("locale","zh_CN");
        properties.setProperty("datetime_format","yyyy-MM-dd HH:mm:ss");
        properties.setProperty("date_format","yyyy-MM-dd");
        properties.setProperty("time_format","HH:mm:ss");
        properties.setProperty("number_format","");
        properties.setProperty("template_exception_handler","ignore");
        properties.setProperty("classic_compatible","true");
        properties.setProperty("whitespace_stripping","true");
        properties.setProperty("auto_import","macros/spring.ftl as spring");

        freeMarkerConfigurer.setFreemarkerSettings(properties);

        Map<String, Object> variables = new HashedMap();
        variables.put("version",version);
        variables.put("emsSystemName",emsSystemName);
        freeMarkerConfigurer.setFreemarkerVariables(variables);
        return freeMarkerConfigurer;

    }

}
