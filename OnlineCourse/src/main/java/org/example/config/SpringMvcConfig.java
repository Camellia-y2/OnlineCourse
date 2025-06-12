package org.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(value = "org.example.controller")
@EnableWebMvc
public class SpringMvcConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 映射静态资源路径
        registry.addResourceHandler("/images/**").addResourceLocations("/images/");
        // 映射JS文件路径
        registry.addResourceHandler("/js/**").addResourceLocations("/js/");

        // 映射CSS文件路径
        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
    }
    // 配置视图解析器
    @Bean
    public InternalResourceViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/pages/"); // JSP 文件前缀
        resolver.setSuffix(".jsp"); // JSP 文件后缀
        return resolver;
    }
}
