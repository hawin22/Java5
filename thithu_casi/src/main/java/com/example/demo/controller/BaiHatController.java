package com.example.demo.controller;

import com.example.demo.entity.BaiHat;
import com.example.demo.entity.BaiHatDTO;
import com.example.demo.entity.CaSi;
import com.example.demo.service.BaiHatService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/baihat")
public class BaiHatController {
    @Autowired
    BaiHatService ser;
    boolean check = true;
    Integer checkTrang = 0;
    Integer trangCuoi = 0;
    @GetMapping("/hienthi")
    public String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page, @RequestParam(value = "size", defaultValue = "5") Integer size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<BaiHat> listPhanTrang = ser.list(pageable);
        checkTrang = page;
        trangCuoi = listPhanTrang.getTotalPages()-1;
        model.addAttribute("offset", listPhanTrang.getNumber()*listPhanTrang.getSize());
        model.addAttribute("soTrang", listPhanTrang.getTotalPages());
        model.addAttribute("trangHienTai", page);
        model.addAttribute("listBH", listPhanTrang.getContent());
        model.addAttribute("listCS", ser.listCS());
        return "BaiHatView";
    }

    public Date parseDate(String date) {
        SimpleDateFormat ngay = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return ngay.parse(date);
        } catch (ParseException e) {
            return null;
        }
    }

    @PostMapping("/add")
    public String add(Model model, @RequestParam("ngay_san_xuat") String ngay_san_xuat,
                      @RequestParam("tenCaSy") Integer id,
                      @Valid @ModelAttribute("baiHat") BaiHatDTO baiHatDTO, BindingResult result) {
        model.addAttribute("listCS", ser.listCS());
        if (result.hasErrors()) {
            model.addAttribute("listBH", ser.list(PageRequest.of(0, 5)).getContent());
            return "BaiHatView";
        } else {
            check = false;
            model.addAttribute("check",check);
            BaiHat baiHat = new BaiHat();
            baiHat.setTen_bai_hat(baiHatDTO.getTen_bai_hat());
            baiHat.setTen_tac_gia(baiHatDTO.getTen_tac_gia());
            baiHat.setThoi_luong(Integer.parseInt(baiHatDTO.getThoi_luong()));
            baiHat.setNgay_san_xuat(parseDate(ngay_san_xuat));
            baiHat.setCaSi(ser.findByID(id));
            ser.add(baiHat);
        }
        return "redirect:/baihat/hienthi?page="+trangCuoi;
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable Integer id) {
        check = true;
        model.addAttribute("check",check);
        model.addAttribute("detail", ser.detail(id));
        model.addAttribute("listBH", ser.list(PageRequest.of(checkTrang, 5)).getContent());
        model.addAttribute("listCS", ser.listCS());
        return "BaiHatView";
    }

    @PostMapping("/update/{id}")
    public String update(Model model, @RequestParam("ngay_san_xuat") String ngay_san_xuat,
                         @RequestParam("tenCaSy") Integer tenCaSy,
                         @Valid @ModelAttribute("baiHat") BaiHat baiHat, BindingResult result, @PathVariable Integer id) {
        model.addAttribute("listCS", ser.listCS());
        baiHat.setId(id);
        if (result.hasErrors()) {
            model.addAttribute("listBH", ser.list(PageRequest.of(checkTrang, 5)).getContent());
            return "BaiHatView";
        } else {
            baiHat.setNgay_san_xuat(parseDate(ngay_san_xuat));
            baiHat.setCaSi(ser.findByID(tenCaSy));
            ser.update(baiHat);
        }
        return "redirect:/baihat/hienthi?page="+checkTrang;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        ser.delete(id);
        return "redirect:/baihat/hienthi?page=" + checkTrang;
    }
}
