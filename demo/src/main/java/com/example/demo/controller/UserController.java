package com.example.demo.controller;

import com.example.demo.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;

@Controller
public class UserController {
    ArrayList<User> listUser = new ArrayList<>();

    public UserController() {
        listUser.add(new User("PH123", "Hehe"));
        listUser.add(new User("PH124", "Heha"));
        listUser.add(new User("PH125", "Hehi"));
    }

    @GetMapping("/user")
    public String hienThi(Model model) {
        User user = new User("PH123", "Nguyen Van A");
        model.addAttribute("user", user);
        return "user";
    }

    @GetMapping("/danh-sach")
    public String danhSach(Model model) {
        model.addAttribute("listUser", listUser);
        return "user";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") String id) {
        System.out.println("id: " + id);
        User userDetail = new User();
        for (User user : listUser) {
            if (user.getId().equals(id)) {
                userDetail = user;
            }
        }
        model.addAttribute("user", userDetail);
        return "detail";
    }
}
