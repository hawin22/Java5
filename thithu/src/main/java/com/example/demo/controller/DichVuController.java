package com.example.demo.controller;

import com.example.demo.entity.DichVu;
import com.example.demo.service.DichVuService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/services-management")
public class DichVuController {
    String thongbao = "";
    @Autowired
    DichVuService dichVuService;
    boolean check = true;
Integer trang = 0;
    @GetMapping("/groups")
    public String hienThi(Model model) {

        model.addAttribute("listDV", dichVuService.hienThi());
//        model.addAttribute("listDV",dichVuService.hienThi());
        model.addAttribute("listLoaiDV", dichVuService.listLoaiDV());
        model.addAttribute("msg", thongbao);
        thongbao = "";
        System.out.println(trang);
        return "dichVuView";
    }
//    @GetMapping("/add")
//    public String showAddForm(Model model) {
//        model.addAttribute("dichvu", new DichVu());  // Thêm đối tượng mới vào mô hình
//        return "dichVuView";
//    }

    @PostMapping("/add")
    public String add(Model model,@Valid @ModelAttribute("dichvu")DichVu dv, BindingResult bindingResult) {
        check = false;
        model.addAttribute("check", check);
        System.out.println("add: " + check);
        if (bindingResult.hasErrors()){
        model.addAttribute("listDV",dichVuService.hienThi());
            return "dichVuView";
        }
        else {
        dichVuService.add(dv);
        return "redirect:/services-management/groups";
        }
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("listDV", dichVuService.hienThi());
        model.addAttribute("listLoaiDV", dichVuService.listLoaiDV());
        model.addAttribute("detail", dichVuService.detail(id));
        check = true;
        model.addAttribute("check", check);
        System.out.println("detail: "+check);
        return "dichVuView";
    }

    @PostMapping("/update/{id}")
    public String update(Model model,@ModelAttribute DichVu dv) {
        dichVuService.update(dv);
        return "redirect:/services-management/groups";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        dichVuService.detete(id);
        thongbao = "xoá thành công";
        return "redirect:/services-management/groups";
    }
    @GetMapping("/search")
    public String search(Model model, @RequestParam(name = "tendichvu", required = false) String tenDichVu,
                         @RequestParam(name = "giaMin",required = false) Double giaMin,
                         @RequestParam(name = "giaMax", required = false) Double giaMax){
        if (tenDichVu!=null && !tenDichVu.isEmpty()){
        model.addAttribute("listDV", dichVuService.searchTheoTen(tenDichVu));
        }
        else if (giaMax!=null && giaMin!= null){
            model.addAttribute("listDV", dichVuService.searchTheoGia(giaMin,giaMax));
        }
        else {
            model.addAttribute("listDV", dichVuService.hienThi());
        }
        return "dichVuView";
    }

    @GetMapping("/sapxep")
    public String sapXep(Model model, @RequestParam("sapxep") boolean check){
        if (check){
        model.addAttribute("listDV", dichVuService.sapXep());
        }
        return "dichVuView";
    }
}
