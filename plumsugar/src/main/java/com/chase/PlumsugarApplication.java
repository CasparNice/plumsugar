package com.chase;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.chase.mapper")
public class PlumsugarApplication {

    public static void main(String[] args) {
        SpringApplication.run(PlumsugarApplication.class, args);
    }

}
