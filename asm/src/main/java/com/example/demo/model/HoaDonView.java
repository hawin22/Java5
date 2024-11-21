package com.example.demo.model;

import java.util.Date;

public interface HoaDonView {
    Integer getId();
    KhachHangView getHo_ten();
    String getTrang_thai();
    Date getNgay_tao();
    Date getNgay_sua();
    String getDia_chi();
    String getSo_dien_thoai();
    Integer getTongTien();
}
