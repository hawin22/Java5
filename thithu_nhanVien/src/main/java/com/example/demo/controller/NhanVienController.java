package com.example.demo.controller;

import com.example.demo.entity.ChucVu;
import com.example.demo.entity.NhanVien;
import com.example.demo.request.NhanVienRequest;
import com.example.demo.service.NhanVienService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nhanvien")
public class NhanVienController {
    @Autowired
    NhanVienService ser;

    @GetMapping("/hienthi")
    public String hienThi(Model model) {
        model.addAttribute("listNV", ser.listNV());
        model.addAttribute("listCV", ser.listCV());
        return "NhanVienView";
    }

    @PostMapping("/add")
    public String add(Model model, @Valid @ModelAttribute("nhanvien") NhanVienRequest nhanVien, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listNV", ser.listNV());
            model.addAttribute("listCV", ser.listCV());
            return "NhanVienView";

        } else {
            ChucVu chucVu = ser.detailCV(nhanVien.getChucVu());
            NhanVien nhanVien1 = NhanVien.builder()
                    .ten(nhanVien.getTen())
                    .dia_chi(nhanVien.getDia_chi())
                    .gioi_tinh(nhanVien.getGioi_tinh())
                    .trang_thai(nhanVien.getTrang_thai())
                    .chucVu(chucVu)
                    .build();
            ser.addOrUpdate(nhanVien1);
        }
        return "redirect:/nhanvien/hienthi";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable Integer id) {
        model.addAttribute("detail", ser.detail(id));
        model.addAttribute("listNV", ser.listNV());
        model.addAttribute("listCV", ser.listCV());
        return "detail";
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @Valid @ModelAttribute("nhanvien") NhanVienRequest nhanVien, BindingResult result, @PathVariable Integer id) {
//        nhanVien.setId(id);
        ChucVu chucVu = ser.detailCV(nhanVien.getChucVu());
        NhanVien nhanVien1 = NhanVien.builder()
                .id(id)
                .ten(nhanVien.getTen())
                .gioi_tinh(nhanVien.getGioi_tinh())
                .dia_chi(nhanVien.getDia_chi())
                .trang_thai(nhanVien.getTrang_thai())
                .chucVu(chucVu)
                .build();
        if (result.hasErrors()) {
            model.addAttribute("listNV", ser.listNV());
            model.addAttribute("listCV", ser.listCV());
            return "detail";
        } else {
            ser.addOrUpdate(nhanVien1);
        }
        return "redirect:/nhanvien/hienthi";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        ser.delete(id);
        return "redirect:/nhanvien/hienthi";
    }

    @GetMapping("/sort")
    public String sort(Model model) {
        model.addAttribute("listNV", ser.listNVSort());
        return "NhanVienView";
    }
}
