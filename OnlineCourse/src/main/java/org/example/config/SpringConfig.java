package org.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({DataSourseConfig.class,MyBatisConfig.class})
public class SpringConfig {
}

