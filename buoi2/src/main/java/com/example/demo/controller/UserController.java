package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.UserUP;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class UserController {
    ArrayList<User> list = new ArrayList<>();

    public UserController() {
        list.add(new User(1, "thu"));
        list.add(new User(2, "hawin"));
    }

    @GetMapping("/user")
    public String user(Model model) {
        model.addAttribute("list", list);
        return "user";
    }

    @GetMapping("/user/detail/{id}")
    public String detail(Model model, @PathVariable("id") int id) {
        User userDetail = new User();
        for (User u : list) {
            if (u.getId() == id) {
                userDetail = u;
            }
        }
        model.addAttribute("user", userDetail);
        return "detail";
    }

    @PostMapping("/user/add")
    public String add(User user) {
        list.add(user);
        return "redirect:/user";
    }

    @PostMapping("/user/update/{id}")
    public String update1(@PathVariable int id,@ModelAttribute("u") UserUP userUP) {
        for (User u : list) {
            if (u.getId() == id) {
                u.setName(userUP.getName());
            }
        }
        return "redirect:/user";
    }
//
//    @PostMapping("/user/update/{id}")
//    public String update(Model model, User user, @PathVariable("id") int id) {
//        for (User u : list) {
//            if (u.getId() == id) {
//                list.set(list.indexOf(u), user);
//            }
//        }
//        model.addAttribute("u", user);
//        return "redirect:/user";
//    }
    @GetMapping("/user/delete/{id}")
    public String delete(@PathVariable int id){
        User user = new User();
        for (User u:list) {
            if (u.getId() == id){
                user = u;
            }
        }
        list.remove(user);
        return "redirect:/user";
    }
}
