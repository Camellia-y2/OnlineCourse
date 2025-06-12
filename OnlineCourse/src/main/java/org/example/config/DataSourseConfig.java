package org.example.config;

import com.alibaba.druid.pool.DruidAbstractDataSource;
import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@ComponentScan(value="org.example.service")
@PropertySource("classpath:config/db.properties")
@EnableTransactionManagement
public class DataSourseConfig {
    @Value("${mysql.driver}") // 从属性文件中获取 MySQL 驱动类
    private String driver;

    @Value("${mysql.url}") // 从属性文件中获取数据库 URL
    private String url;

    @Value("${mysql.username}") // 从属性文件中获取数据库用户名
    private String username;

    @Value("${mysql.password}") // 从属性文件中获取数据库密码
    private String password;
    @Bean("dataSourse")
    public DataSource getDataSource() {
        DruidDataSource druidDataSource= new DruidDataSource();
        druidDataSource.setDriverClassName(driver); // 设置驱动类
        druidDataSource.setUrl(url); // 设置数据库 URL
        druidDataSource.setUsername(username); // 设置数据库用户名
        druidDataSource.setPassword(password); // 设置数据库密码
        return druidDataSource;
    }
    @Bean
    public DataSourceTransactionManager getDataSourceTransactionManager(@Autowired DataSource dataSource) {
        DataSourceTransactionManager dstManager = new DataSourceTransactionManager();
        dstManager.setDataSource(dataSource);
        return dstManager; // 返回配置好的数据源
    }
}
