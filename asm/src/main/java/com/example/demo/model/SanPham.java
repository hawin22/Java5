package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "san_pham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ma_san_pham;
    private String ten_san_pham;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date ngay_tao;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;
    @ManyToOne
    @JoinColumn(name = "id_danh_muc")
    private DanhMuc danhMuc;

    @Override
    public String toString() {
        return "SanPham{" +
                "id=" + id +
                ", ma_san_pham='" + ma_san_pham + '\'' +
                ", ten_san_pham='" + ten_san_pham + '\'' +
                ", trang_thai='" + trang_thai + '\'' +
                ", ngay_tao=" + ngay_tao +
                ", ngay_sua=" + ngay_sua +
                ", danhMuc=" + danhMuc +
                '}';
    }
}
