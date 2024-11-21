package com.example.demo.controller;

import com.example.demo.Repository.*;
import com.example.demo.model.*;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class adminController {
    @Autowired
    private SanPhamRepo sanPhamRepo;
    @Autowired
    private DanhMucRepo danhMucRepo;
    @Autowired
    private MauSacRepo mauSacRepo;
    @Autowired
    private SizeRepo sizeRepo;
    @Autowired
    private ChiTietSanPhamRepo chiTietSanPhamRepo;
    @Autowired
    private HoaDonRepo hoaDonRepo;
    @Autowired
    private HoaDonChiTietRepo hoaDonChiTietRepo;
    @Autowired
    private KhachHangRepo khachHangRepo;
    LocalDate dateNow = LocalDate.now();
    java.sql.Date dates = java.sql.Date.valueOf(dateNow);
    Integer idHDTong = 0;
    String thanhCong = "";
    Integer soLuongTonTong = 0;

    @GetMapping("/admin")
    public String hienThi(Model model) {
        model.addAttribute("listSanPham", sanPhamRepo.findAll());
        model.addAttribute("listDanhMuc", danhMucRepo.findAll());
        model.addAttribute("listMauSac", mauSacRepo.findAll());
        model.addAttribute("listSize", sizeRepo.findAll());
        model.addAttribute("listCTSP", chiTietSanPhamRepo.findAll());
        model.addAttribute("listKhachHang", khachHangRepo.findAll());

        return "admin";
    }

    public Date parseDate(String d) {
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        try {
            return s.parse(d);
        } catch (ParseException e) {
            return null;
        }
    }

    @GetMapping("/admin/ctsp/{id}")
    public String detailCtsptheoSP(Model model, @PathVariable Integer id) {
        model.addAttribute("listCTSP", chiTietSanPhamRepo.listCTSPtheoSP(id));

        return "CTSPKhoaNgoai";
    }

    @GetMapping("/admin/detail/{id}")
    public String detailSP(Model model, @PathVariable Integer id) {
        System.out.println("ID sản phẩm: " + id);
        model.addAttribute("detailSP", sanPhamRepo.findById(id).get());
        model.addAttribute("listDanhMuc", danhMucRepo.findAll());
        System.out.println(sanPhamRepo.findById(id).get().getDanhMuc().toString() + "thu");
        System.out.println(danhMucRepo.findAll().get(2).toString() + "hawin");
        return "updateSanPham";
    }

    @PostMapping("/admin/update/{id}")
    public String updateProduct(@PathVariable("id") Integer idSP,
                                @RequestParam("ma_san_pham") String maSanPham,
                                @RequestParam("ten_san_pham") String tenSanPham,
                                @RequestParam("ngay_tao") String ngayTaoStr,
                                @RequestParam("ngay_sua") String ngaySuaStr,
                                @RequestParam("trang_thai") String trangThai, @RequestParam("danhMuc") Integer id) {

        Date ngayTaoDate = parseDate(ngayTaoStr);
        Date ngaySuaDate = parseDate(ngaySuaStr);
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        SanPham product = sanPhamRepo.findById(idSP).get();
        product.setMa_san_pham(maSanPham);
        product.setTen_san_pham(tenSanPham);
        product.setNgay_tao(ngayTaoDate);
        product.setNgay_sua(ngaySuaDate);
        product.setTrang_thai(trangThai);
        product.setDanhMuc(danhMuc);

        // Sau đó lưu sản phẩm vào cơ sở dữ liệu
        sanPhamRepo.save(product);
        return "redirect:/admin";
    }

    @GetMapping("/admin/detailCTSP/{id}")
    public String detailCTSP(Model model, @PathVariable Integer id) {
        model.addAttribute("detailCTSP", chiTietSanPhamRepo.findById(id).get());
        model.addAttribute("listSanPham", sanPhamRepo.findById(id).get());
        model.addAttribute("listMauSac", mauSacRepo.findAll());
        model.addAttribute("listSize", sizeRepo.findAll());
        return "updateCTSP";
    }

    @PostMapping("/admin/updateCTSP/{id}")
    public String updateCTSP(@PathVariable Integer id,
                             @RequestParam("mauSac") Integer id_mau_sac,
                             @RequestParam("size") Integer id_size,
                             @RequestParam("gia_ban") double giaBan,
                             @RequestParam("so_luong_ton") Integer soLuongTon,
                             @RequestParam("ngay_tao") String ngayTao,
                             @RequestParam("ngay_sua") String ngaySua,
                             @RequestParam("trang_thai") String trangThai) {
        Date ngayTaoDate = parseDate(ngayTao);
        Date ngaySuaDate = parseDate(ngaySua);
        MauSac mauSac = mauSacRepo.findById(id_mau_sac).get();
        Size size = sizeRepo.findById(id_size).get();
        ChiTietSanPham ctsp = chiTietSanPhamRepo.findById(id).get();
        ctsp.setSanPham(sanPhamRepo.findById(id).get());
        ctsp.setMauSac(mauSac);
        ctsp.setSize(size);
        ctsp.setGia_ban(giaBan);
        ctsp.setSo_luong_ton(soLuongTon);
        ctsp.setNgay_tao(ngayTaoDate);
        ctsp.setNgay_sua(ngaySuaDate);
        ctsp.setTrang_thai(trangThai);
        chiTietSanPhamRepo.save(ctsp);
        return "redirect:/admin";

    }

    @PostMapping("/admin/add")
    public String addProduct(@RequestParam("ma_san_pham") String maSanPham,
                             @RequestParam("ten_san_pham") String tenSanPham,
                             @RequestParam("ngay_tao") String ngayTaoStr,
                             @RequestParam("ngay_sua") String ngaySuaStr,
                             @RequestParam("trang_thai") String trangThai, @RequestParam("danhMuc") Integer id) {

        Date ngayTaoDate = parseDate(ngayTaoStr);
        Date ngaySuaDate = parseDate(ngaySuaStr);
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        SanPham product = new SanPham();
        product.setMa_san_pham(maSanPham);
        product.setTen_san_pham(tenSanPham);
        product.setNgay_tao(ngayTaoDate);
        product.setNgay_sua(ngaySuaDate);
        product.setTrang_thai(trangThai);
        product.setDanhMuc(danhMuc);

        // Sau đó lưu sản phẩm vào cơ sở dữ liệu
        sanPhamRepo.save(product);
        return "redirect:/admin";
    }


    //    @PostMapping("/admin/addCTSP/")
//    public String addCTSP(@RequestParam Integer ctspID,
//                          @RequestParam("mauSac") Integer id_mau_sac,
//                          @RequestParam("size") Integer id_size,
//                          @RequestParam("gia_ban") double giaBan,
//                          @RequestParam("so_luong_ton") Integer soLuongTon,
//                          @RequestParam("ngay_tao") String ngayTao,
//                          @RequestParam("ngay_sua") String ngaySua,
//                          @RequestParam("trang_thai") String trangThai) {
//        Date ngayTaoDate = parseDate(ngayTao);
//        Date ngaySuaDate = parseDate(ngaySua);
//        MauSac mauSac = mauSacRepo.findById(id_mau_sac).get();
//        Size size = sizeRepo.findById(id_size).get();
//        ChiTietSanPham ctsp = new ChiTietSanPham();
//        ctsp.setSanPham(sanPhamRepo.findById(ctspID).get());
//        ctsp.setMauSac(mauSac);
//        ctsp.setSize(size);
//        ctsp.setGia_ban(giaBan);
//        ctsp.setSo_luong_ton(soLuongTon);
//        ctsp.setNgay_tao(ngayTaoDate);
//        ctsp.setNgay_sua(ngaySuaDate);
//        ctsp.setTrang_thai(trangThai);
//        chiTietSanPhamRepo.save(ctsp);
//        return "redirect:/admin";
//
//    }
    @PostMapping("/admin/addCTSP/")
    public String addCTSP(@RequestParam("ctspID") Integer ctspID,
                          @RequestParam("mauSac") Integer id_mau_sac,
                          @RequestParam("size") Integer id_size,
                          @RequestParam("gia_ban") double giaBan,
                          @RequestParam("so_luong_ton") Integer soLuongTon,
                          @RequestParam("ngay_tao") String ngayTao,
                          @RequestParam("ngay_sua") String ngaySua,
                          @RequestParam("trang_thai") String trangThai) {
        Date ngayTaoDate = parseDate(ngayTao);
        Date ngaySuaDate = parseDate(ngaySua);
        MauSac mauSac = mauSacRepo.findById(id_mau_sac).get();
        Size size = sizeRepo.findById(id_size).get();
        ChiTietSanPham ctsp = new ChiTietSanPham();
        ctsp.setSanPham(sanPhamRepo.findById(ctspID).get());
        ctsp.setMauSac(mauSac);
        ctsp.setSize(size);
        ctsp.setGia_ban(giaBan);
        ctsp.setSo_luong_ton(soLuongTon);
        ctsp.setNgay_tao(ngayTaoDate);
        ctsp.setNgay_sua(ngaySuaDate);
        ctsp.setTrang_thai(trangThai);
        chiTietSanPhamRepo.save(ctsp);
        return "redirect:/admin";

    }


    @GetMapping("/admin/xoa/{id}")
    public String xoaSanPham(@PathVariable("id") Integer id) {
        sanPhamRepo.deleteById(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/xoaCT/{id}")
    public String xoaCT(@PathVariable("id") Integer id) {
        chiTietSanPhamRepo.deleteById(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/addDanhMuc")
    public String chuyenHuongADDDanhMuc() {
        return "addDanhMuc";
    }

    @PostMapping("/admin/addDanhMuc")
    public String addDanhMuc(@RequestParam("ma_danh_muc") String maDanhMuc,
                             @RequestParam("ten_danh_muc") String tenDanhMuc,
                             @RequestParam("ngay_tao") String ngayTao,
                             @RequestParam("ngay_sua") String ngaySua,
                             @RequestParam("trang_thai") String trangThai) {
        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setMa_danh_muc(maDanhMuc);
        danhMuc.setTen_danh_muc(tenDanhMuc);
        danhMuc.setNgay_tao(parseDate(ngayTao));
        danhMuc.setNgay_sua(parseDate(ngaySua));
        danhMuc.setTrang_thai(trangThai);
        danhMucRepo.save(danhMuc);
        return "redirect:/admin";
    }

    @GetMapping("/admin/detailDanhMuc/{id}")
    public String detailDanhMuc(Model model, @PathVariable Integer id) {
        model.addAttribute("detailDanhMuc", danhMucRepo.findById(id).get());
        return "updateDanhMuc";
    }

    @PostMapping("/admin/updateDanhMuc/{id}")
    public String updateDanhMuc(@PathVariable Integer id,
                                @RequestParam("ma_danh_muc") String maDanhMuc,
                                @RequestParam("ten_danh_muc") String tenDanhMuc,
                                @RequestParam("ngay_tao") String ngayTao,
                                @RequestParam("ngay_sua") String ngaySua,
                                @RequestParam("trang_thai") String trangThai) {
        DanhMuc danhMuc = danhMucRepo.findById(id).get();
        danhMuc.setMa_danh_muc(maDanhMuc);
        danhMuc.setTen_danh_muc(tenDanhMuc);
        danhMuc.setNgay_tao(parseDate(ngayTao));
        danhMuc.setNgay_sua(parseDate(ngaySua));
        danhMuc.setTrang_thai(trangThai);
        danhMucRepo.save(danhMuc);
        return "redirect:/admin";
    }

    @GetMapping("/admin/deleteDanhMuc/{id}")
    public String deleteDanhMuc(@PathVariable Integer id) {
        danhMucRepo.deleteById(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/addKH")
    public String chuyenHuongADDKH() {
        return "addKhachHang";
    }

    @PostMapping("/admin/addKH")
    public String addKH(@RequestParam("ho_ten") String hoTen,
                        @RequestParam("dia_chi") String diaChi,
                        @RequestParam("sdt") String sdt,
                        @RequestParam("ngay_tao") String ngayTao,
                        @RequestParam("ngay_sua") String ngaySua,
                        @RequestParam("trang_thai") String trangThai) {
        KhachHang khachHang = new KhachHang();
        khachHang.setHo_ten(hoTen);
        khachHang.setDia_chi(diaChi);
        khachHang.setSdt(sdt);
        khachHang.setNgay_tao(parseDate(ngayTao));
        khachHang.setNgay_sua(parseDate(ngaySua));
        khachHang.setTrang_thai(trangThai);
        khachHangRepo.save(khachHang);
        return "redirect:/admin";
    }

    @GetMapping("/admin/detailKH/{id}")
    public String detailKH(Model model, @PathVariable Integer id) {
        model.addAttribute("detailKH", khachHangRepo.findById(id).get());
        return "updateKH";
    }

    @PostMapping("/admin/updateKH/{id}")
    public String updateKH(@PathVariable Integer id,
                           @RequestParam("ho_ten") String hoTen,
                           @RequestParam("dia_chi") String diaChi,
                           @RequestParam("sdt") String sdt,
                           @RequestParam("ngay_tao") String ngayTao,
                           @RequestParam("ngay_sua") String ngaySua,
                           @RequestParam("trang_thai") String trangThai) {
        KhachHang khachHang = khachHangRepo.findById(id).get();
        khachHang.setHo_ten(hoTen);
        khachHang.setDia_chi(diaChi);
        khachHang.setSdt(sdt);
        khachHang.setNgay_tao(parseDate(ngayTao));
        khachHang.setNgay_sua(parseDate(ngaySua));
        khachHang.setTrang_thai(trangThai);
        khachHangRepo.save(khachHang);
        return "redirect:/admin";
    }

    @GetMapping("/admin/deleteKH/{id}")
    public String deleteKH(@PathVariable Integer id) {
        khachHangRepo.deleteById(id);
        return "redirect:/admin";
    }

    // Bán hàng
    // Xem HD
    @GetMapping("/admin/ban_hang")
    public String banHang(Model model) {
        model.addAttribute("listSPBanHang", chiTietSanPhamRepo.getList());
        model.addAttribute("listHoaDon", hoaDonRepo.getList());
        model.addAttribute("msg", thanhCong);
        model.addAttribute("listKH", khachHangRepo.findAll());
        thanhCong = "";
        return "viewBanHang";
    }

    @GetMapping("/admin/detailHD/{id}")
    public String detailHD(Model model, @PathVariable Integer id) {
        Integer idHoaDon = id;
        idHDTong = idHoaDon;
        model.addAttribute("idHoaDon", idHoaDon);
        model.addAttribute("listHDCTTheoHD", hoaDonChiTietRepo.listHoaDonChiTietTheoHoaDon(id));
        model.addAttribute("listSPBanHang", chiTietSanPhamRepo.getList());
        model.addAttribute("listHoaDon", hoaDonRepo.getList());
        model.addAttribute("listKH", khachHangRepo.findAll());
//        System.out.println("idid: " + idHDTong);
        model.addAttribute("listHoaDonKH", hoaDonRepo.findById(id).get().getKhach_hang().getHo_ten());
        model.addAttribute("tinhTongTien", tinhTien(hoaDonChiTietRepo.listHoaDonChiTietTheoHoaDon(id)));

        return "viewBanHang";
    }

    @PostMapping("/admin/ban_hang/addsp")
    public String addspVaoHD(Model model, @RequestParam("idSanPham") Integer idsp, @RequestParam("idHoaDon") Integer idhd, @RequestParam("chonSL") Integer chonSL) {
        Integer idhds = idhd;
        ChiTietSanPham ctsp = chiTietSanPhamRepo.findById(idsp).get();
        HoaDon hd = hoaDonRepo.findById(idhd).get();
        HoaDonChiTiet hdct = new HoaDonChiTiet();
        ArrayList<HoaDonChiTietViewSS> listSoSanh = hoaDonChiTietRepo.listSS(idhd);
        Integer idcthdtam = 0;
        for (HoaDonChiTietViewSS h : listSoSanh) {
            if (h.getId_ctsp() == idsp) {
                idcthdtam = h.getId();
            }
        }
        if (idcthdtam == 0) {
            hdct.setCtsp(ctsp);
            hdct.setGia_ban(ctsp.getGia_ban());
            hdct.setHoa_don(hd);
            hdct.setSo_luong_mua(chonSL);
            hdct.setTong_tien((int) (chonSL * ctsp.getGia_ban()));
            ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() - chonSL);
            chiTietSanPhamRepo.save(ctsp);
            hoaDonChiTietRepo.save(hdct);
        } else {
            HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietRepo.findById(idcthdtam).get();
            hdct.setId(idcthdtam);
            hdct.setCtsp(ctsp);
            hdct.setGia_ban(ctsp.getGia_ban());
            hdct.setHoa_don(hd);
            hdct.setSo_luong_mua(chonSL + hoaDonChiTiet.getSo_luong_mua());
            hdct.setTong_tien((int) ((chonSL + hoaDonChiTiet.getSo_luong_mua()) * ctsp.getGia_ban()));
            ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() - chonSL);
            chiTietSanPhamRepo.save(ctsp);
            hoaDonChiTietRepo.save(hdct);
        }
        return "redirect:/admin/detailHD/" + idhds;
    }

    @PostMapping("/admin/hoa-don/add")
    public String addHoaDonNew(Model model, @ModelAttribute HoaDon hoaDon, @RequestParam("idKhach") Integer id_KH) {
        hoaDon.setNgay_tao(dates);
        hoaDon.setKhach_hang(khachHangRepo.findById(id_KH).get());
        hoaDon.setTrang_thai("Chua thanh toan");
        hoaDonRepo.save(hoaDon);
        return "redirect:/admin/ban_hang";
    }

    private Integer tinhTien(ArrayList<HoaDonChiTietView> list) {
        Integer tongTien = 0;
        for (HoaDonChiTietView hd : list) {
            tongTien += hd.getTong_tien();
        }
        return tongTien;
    }


    //    @PostMapping("/admin/thanh-toan")
//    public String tinhTienThua(@RequestParam("tienKhachDua") Integer tienKhachDua,
//                               @RequestParam("tongTien") Integer tongTien,
//                               Model model) {
//        Integer tienThua = tienKhachDua- tongTien;
//        if (tienThua < 0 || tongTien<=0) {
//            model.addAttribute("tienThua",  (tienThua));
//            thanhCong = "Thanh toán thất bại";
//        } else {
//            model.addAttribute("tienThua", (tienThua));
//            HoaDon hd = hoaDonRepo.findById(idHDTong).get();
//            hd.setTrang_thai("Đã thanh toán");
//            hoaDonRepo.save(hd);
//            thanhCong = "Thanh toán thành công!!";
//        }
//        model.addAttribute("listSPBanHang", chiTietSanPhamRepo.getList());
//        model.addAttribute("listHoaDon", hoaDonRepo.getList());
//        model.addAttribute("msg", thanhCong);
//        return "viewBanHang";
//    }
    @PostMapping("/admin/thanh-toan")
    public String thanhToan(Model model) {
        HoaDon hd = hoaDonRepo.findById(idHDTong).get();
        hd.setTrang_thai("Da thanh toan");
        hoaDonRepo.save(hd);
        System.out.println("idid: " + idHDTong);
        return "redirect:/admin/ban_hang";
    }

    @PostMapping("/admin/updateSL")
    public String updateSL(Model model, @RequestParam("idHDCT") Integer idHDCT, @RequestParam("newQuantity") Integer soLuongNew) {
        HoaDonChiTiet hdct = hoaDonChiTietRepo.findById(idHDCT).get();
        Integer soLuongCu = hdct.getSo_luong_mua();
        Integer soLuongUpdate = soLuongNew - soLuongCu;
        ChiTietSanPham ctsp = chiTietSanPhamRepo.findById(hdct.getCtsp().getId()).get();
        model.addAttribute("soLuongSP", ctsp.getSo_luong_ton()+hdct.getSo_luong_mua());
//        soLuongTonTong = ctsp.getSo_luong_ton();
        System.out.println("so Luong tom" + (ctsp.getSo_luong_ton()+hdct.getSo_luong_mua()));
        if ((hdct.getCtsp().getSo_luong_ton() + ctsp.getSo_luong_ton()) >= soLuongNew) {

            if (soLuongNew == 0) {
                ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() + hdct.getSo_luong_mua());
                hdct.setSo_luong_mua(soLuongNew);
                hdct.setTong_tien((int) (soLuongNew * hdct.getGia_ban()));
                hoaDonChiTietRepo.delete(hdct);
                return "redirect:/admin/ban_hang";
            }
            if (soLuongUpdate > 0) {
                ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() - soLuongUpdate);
                hdct.setSo_luong_mua(soLuongNew);
                hdct.setTong_tien((int) (soLuongNew * hdct.getGia_ban()));
                hoaDonChiTietRepo.save(hdct);
                chiTietSanPhamRepo.save(ctsp);
            } else {
                soLuongUpdate = -soLuongUpdate;
                ctsp.setSo_luong_ton(ctsp.getSo_luong_ton() + soLuongUpdate);
                hdct.setSo_luong_mua(soLuongNew);
                hdct.setTong_tien((int) (soLuongNew * hdct.getGia_ban()));
                hoaDonChiTietRepo.save(hdct);
                chiTietSanPhamRepo.save(ctsp);
            }
        } else {
            model.addAttribute("valueSL", "Số lượng phải nhỏ hơn hoặc bằng số lượng tồn");
        }
        return "redirect:/admin/detailHD/" + idHDTong;
    }

    @GetMapping("/admin/qlhd")
    public String qlhd(Model model) {

        model.addAttribute("listQLHD", hoaDonRepo.getListQLHD());
//        model.addAttribute("listTongTien", hoaDonRepo.getTongTien());
//
        return "QLHD";
    }

}
