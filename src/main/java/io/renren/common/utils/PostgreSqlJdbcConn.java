package io.renren.common.utils;

import io.renren.modules.xmkj.config.PostgresqlProperties;
import io.renren.modules.xmkj.entity.WechatNumbersEntity;
import io.renren.modules.xmkj.service.WechatNumbersService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.sql.*;
import java.util.List;
import java.util.Map;

/**
 * postgresql 连接 在socket中查询数据库 springboot 连接到mysql了
 */
@Configuration
@Slf4j
public class PostgreSqlJdbcConn {

    @Autowired
    private PostgresqlProperties postgresqlProperties;

    public Connection getConnection(){
        Connection c = null;
        try {
            Class.forName(postgresqlProperties.getDriverClassName());
            c = DriverManager
                    .getConnection(postgresqlProperties.getUrl(),
                            postgresqlProperties.getUsername(), postgresqlProperties.getPassword());
        } catch (Exception e) {
            log.error("连接post数据库出错"+e.getMessage());
        }
        log.info("Opened database successfully");
        return c;
    }

    public ResultSet selectOne(String sql, PreparedStatement preparedStatement){
        Connection connection = getConnection();
        ResultSet rs = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            /*while ( rs.next() ) {
                int id = rs.getInt("id");
                String  name = rs.getString("name");
                int age  = rs.getInt("age");
                String  address = rs.getString("address");
                float salary = rs.getFloat("salary");
            }*/
        } catch (SQLException e) {
            log.error("连接post数据库出错"+e.getMessage());
        }
        return rs;
    }

    public void close(Connection connection,PreparedStatement preparedStatement,ResultSet rs){
        try {
            rs.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            log.error("关闭数据库出错"+e.getMessage());
        }
    }
}
