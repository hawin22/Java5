package com.example.demo.model;


import java.util.Date;

public interface HoaDonChiTietView {
    Integer getId();
    HoaDonView getHoa_don();
    ChiTietSanPhamView getTen_san_pham();
    Integer getSo_luong_mua();
    double getGia_ban();
    Integer getTong_tien();
    String getTrang_thai();
    Date getNgay_tao();
    Date getNgay_sua();
    ChiTietSanPhamView getSo_luong_ton();
}
