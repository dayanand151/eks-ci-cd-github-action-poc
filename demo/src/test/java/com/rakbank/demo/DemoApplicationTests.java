package com.rakbank.demo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.rakbank.demo.controller.Rakbankcontroller;

@SpringBootTest
class DemoApplicationTests {

    @Test
    void contextLoads() {
        // This method is intentionally left empty because it is used to check if the application context loads successfully.
        System.out.println("execution started");
        Rakbankcontroller test = new Rakbankcontroller();
        test.getrakbank();
    }
}
