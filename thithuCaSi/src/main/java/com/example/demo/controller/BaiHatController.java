package com.example.demo.controller;

import com.example.demo.entity.BaiHat;
import com.example.demo.entity.BaiHatView;
import com.example.demo.entity.CaSi;
import com.example.demo.service.BaiHatService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    Integer trangCuoi = 0;
    Integer trangHT = 0;
    @GetMapping("/hienthi")
    public String hienthi(Model model, @RequestParam(value = "page", defaultValue = "0") Integer page, @RequestParam(value = "size",defaultValue = "5")Integer size){
        Pageable pageable = PageRequest.of(page,size);
        Page<BaiHat> listPhanTrang = ser.page(pageable);
        trangCuoi = listPhanTrang.getTotalPages()-1;
        trangHT = page;
        model.addAttribute("soTrang", listPhanTrang.getTotalPages());
        model.addAttribute("trangHienTai",page);
        model.addAttribute("listBH",listPhanTrang.getContent());
        model.addAttribute("listCS",ser.listCS());
        return "casiView";
    }
    public Date parseDate(String date){
        SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return d.parse(date);
        }
        catch (ParseException e){
            return null;
        }
    }
    @PostMapping("/add")
    public String add(Model model, @RequestParam("ngay_san_xuat") String ngay_san_xuat, @Valid @ModelAttribute("baihat")BaiHatView bh, BindingResult result,
                      @RequestParam("caSi") Integer id){

        if (result.hasErrors()){
        model.addAttribute("listBH", ser.page(PageRequest.of(0,5)).getContent());
        model.addAttribute("listCS", ser.listCS());
        return "casiView";
        }
        else {
        CaSi caSi = ser.findById(id);
            BaiHat baiHat = new BaiHat();
            baiHat.setTen_bai_hat(bh.getTen_bai_hat());
            baiHat.setTen_tac_gia(bh.getTen_tac_gia());
            baiHat.setThoi_luong(Integer.parseInt(bh.getThoi_luong()));
            baiHat.setNgay_san_xuat(parseDate(ngay_san_xuat));
            baiHat.setCaSi(caSi);
            ser.addOrUpdate(baiHat);
        }
        return "redirect:/baihat/hienthi?page="+trangCuoi;
    }
    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable Integer id){
        model.addAttribute("detail", ser.detail(id));
        model.addAttribute("listBH", ser.page(PageRequest.of(trangHT,5)).getContent());
        model.addAttribute("listCS", ser.listCS());

        return "casiView";
    }
    @PostMapping("/update/{id}")
    public String update(Model model, @PathVariable Integer id, @RequestParam("ngay_san_xuat") String ngay_san_xuat,
                         @Valid @ModelAttribute("baihat") BaiHatView bh, BindingResult result, @RequestParam("caSi") Integer idCaSi){
        BaiHat baiHat = new BaiHat();
        baiHat.setId(id);
        if (result.hasErrors()){
            model.addAttribute("listBH", ser.page(PageRequest.of(0,5)).getContent());
            return "casiView";
        }
        else {
            baiHat.setNgay_san_xuat(parseDate(ngay_san_xuat));
            baiHat.setTen_bai_hat(bh.getTen_bai_hat());
            baiHat.setTen_tac_gia(bh.getTen_tac_gia());
            baiHat.setThoi_luong(Integer.parseInt(bh.getThoi_luong()));
            baiHat.setCaSi(ser.findById(idCaSi));
            ser.addOrUpdate(baiHat);
        }
        return "redirect:/baihat/hienthi?page="+trangHT;
    }
}
