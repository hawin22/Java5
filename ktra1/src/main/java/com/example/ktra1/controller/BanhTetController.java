package com.example.ktra1.controller;

import com.example.ktra1.model.BanhTet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class BanhTetController {
    ArrayList<BanhTet> list = new ArrayList<>();
    String msg = "";
    public BanhTetController(){
        list.add(new BanhTet(1,"BanhMut", 12222, true));
        list.add(new BanhTet(2,"Banh", 21322, false));
        list.add(new BanhTet(3,"Mut", 143222, true));
        list.add(new BanhTet(4,"BanhNuong", 143222, true));
        list.add(new BanhTet(5,"BanhDeo", 143222, false));
    }
    @GetMapping("/mooncake")
    public String hienThi(Model model){
        model.addAttribute("msg",msg);
        msg = "";
        model.addAttribute("list",list);
        return "mooncake";
    }
    @GetMapping("/mooncake/detail/{id}")
    public String detail(Model model, @PathVariable int id){
        BanhTet banhTet1 = new BanhTet();
        for (BanhTet b:list) {
            if (b.getId() == id){
                banhTet1 = b;
            }
        }
        model.addAttribute("banh",banhTet1);
        return "detail";
    }
    @PostMapping("/mooncake/update/{id}")
    public String update(@PathVariable int id, BanhTet banhTet){
        BanhTet banhTet1 = new BanhTet();
        for (BanhTet b:list) {
            if (b.getId() == id){
                banhTet1 = b;
            }
        }
        list.set(list.indexOf(banhTet1),banhTet);
        return "redirect:/mooncake";
    }
    @GetMapping("/mooncake/delete/{id}")
    public String delete(Model model, @PathVariable int id){
        BanhTet banhTet = new BanhTet();
        for (BanhTet b:list) {
            if (b.getId() == id){
                banhTet = b;
            }
        }
        list.remove(banhTet);
        msg = "Xoa thanh cong";
        return "redirect:/mooncake";
    }
}
