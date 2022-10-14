package com.example.demo.config;

//Datasource
//        커넥션 풀의 커넥션을 관리하기 위한 객체
//        이 객체를 통해 커넥션을 획득 반납 등의 작업을 한다.
//       커넥션 풀
//        기존 JDBC는 클라이언트로부터 요청이 있을때마다 DB 서버에 연결하기 위해 Connection 객체를 얻음 (좋지 않는 성능이었음)
//        기존의 불편함을 해결하기 위한 것.
//        Connection 객체를 요청때마다 생성하는 것이 아니라 웹 어플리케이션이 서비스 되기 전에 서버에서 미리 생성하여 준비한 다음 필요할 때 가져다 쓰게 한다.

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

//어노테이션 기반 환경 구성 도움,
@Configuration
public class DataSourceConfig {
    @ConfigurationProperties(prefix = "spring.datasource")
    // datasource가 application.properties에 spring.datasource로 시작되는 값들을 참조
    @Bean
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }
}
