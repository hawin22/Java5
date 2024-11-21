package com.example.demo.controller;

import com.example.demo.model.NhanVien;
import com.example.demo.repository.NhanVienView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NhanVienController {
    @Autowired
    private NhanVienView nhanVienView;
    @GetMapping("/nhanvien")
    public String nhanVien(Model model){
        model.addAttribute("list", nhanVienView.getList());
        return "nhanvienview";
    }
    @PostMapping("/nhanvien/add")
    public String add(@ModelAttribute NhanVien nhanVien){
        nhanVienView.save(nhanVien);
        return "redirect:/nhanvien";
    }
}
