package com.example.demo.controller;

import com.example.demo.model.SinhVien;
import com.example.demo.repository.LopHocRepository;
import com.example.demo.repository.SinhVienRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.beans.IntrospectionException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SinhVienController {
    @Autowired
    private SinhVienRepository sinhVienRepository;
    @Autowired
    private LopHocRepository lopHocRepository;

    @GetMapping("/sinhvien")
    public String hienThi(Model model) {
        ArrayList<SinhVien> list = (ArrayList<SinhVien>) sinhVienRepository.findAll();
        model.addAttribute("list", list);
        model.addAttribute("lstLopHoc", lopHocRepository.findAll());
        return "sinhvien";
    }

    @PostMapping("/sinhvien/add")
    public String addSV(@ModelAttribute SinhVien sv) {
        sinhVienRepository.save(sv);
        return "redirect:/sinhvien";
    }

    @GetMapping("/sinhvien/delete/{id}")
    public String delete(Model model, @PathVariable Integer id) {
        sinhVienRepository.deleteById(id);
        return "redirect:/sinhvien";
    }

    @GetMapping("/sinhvien/detail/{id}")
    public String detail(Model model, @PathVariable Integer id) {
        model.addAttribute("sv", sinhVienRepository.findById(id).get());
        model.addAttribute("list", sinhVienRepository.findAll());
        model.addAttribute("lstLopHoc", lopHocRepository.findAll());
        return "sinhvien";
    }
    @GetMapping("/page")
    public String phanTrang(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page, @RequestParam(value = "size", defaultValue = "2") Integer size){

        Pageable pageable = PageRequest.of(page,size);
        Page<SinhVien> list = sinhVienRepository.findAll(pageable);
        System.out.println(list.getTotalPages());
        model.addAttribute("pagemin", 0);
        model.addAttribute("pagemax",list.getTotalPages()-1);
        if (page<0){
            page=0;
            model.addAttribute("pageRevious",page);
        }
        if (page>=list.getTotalPages()){
            page = list.getTotalPages()-1;
            model.addAttribute("pageNext",page);
        }
        model.addAttribute("list",list.getContent());
        return "sinhvien";
    }

//    @GetMapping("/page")
//    public String phanTrang1(Model model, @RequestParam(value = "page") Integer page, @RequestParam(value = "size", defaultValue = "1") Integer size) {
////        int soPhanTu = sinhVienRepository.findAll().size();
//        Pageable pageable = PageRequest.of(page, size);
//        Page<SinhVien> list = sinhVienRepository.findAll(pageable);
//        System.out.println(list.getTotalPages()+"ege");
//        model.addAttribute("list", list.getContent());
//        return "sinhvien";
//    }
}
