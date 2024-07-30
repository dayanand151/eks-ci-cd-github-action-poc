package com.rakbank.demo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Rakbankcontroller {
    @GetMapping("/helloWorld")
    public ResponseEntity<String> getrakbank()  {
        return ResponseEntity.ok("Hello World");
    }

}
