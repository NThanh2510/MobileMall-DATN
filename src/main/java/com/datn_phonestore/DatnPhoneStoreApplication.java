package com.datn_phonestore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@EnableFeignClients
//@SpringBootApplication
@SpringBootApplication(scanBasePackages = "com")  // Đảm bảo package này chứa controller
public class DatnPhoneStoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(DatnPhoneStoreApplication.class, args);
    }

}
