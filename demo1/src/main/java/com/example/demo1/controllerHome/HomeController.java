package com.example.demo1.controllerHome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    @RequestMapping(value = "/hien-thi", method = RequestMethod.GET)
    public String hienThi(){
        System.out.println("Da chay vao day");
        return "index";
    }
}
