package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/hien-thi")
    public String hienThi(Model model){
        model.addAttribute("msg1","Họ tên: Hawin");
        model.addAttribute("msg2","Tuổi: 18");
        return "index";
    }

}
