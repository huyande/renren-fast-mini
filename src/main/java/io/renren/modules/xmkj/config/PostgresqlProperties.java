package io.renren.modules.xmkj.config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "dynamic.datasource.slave1")
@Component
@Data
public class PostgresqlProperties {
    private String driverClassName;
    private String url;
    private String username;
    private String password;
}
