package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String hienThi(){
        return "login";
    }

    @PostMapping("/login")
    public String login(){
        System.out.println("Đã chạy vào đây");
        return "login";
    }
    // Kết luận
    // 1 đường dẫn có thể có 2 method khác nhau
}
