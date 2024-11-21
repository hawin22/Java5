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
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ma_danh_muc;
    private String ten_danh_muc;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date ngay_tao;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;

    @Override
    public String toString() {
        return "DanhMuc{" +
                "id=" + id +
                ", ma_danh_muc='" + ma_danh_muc + '\'' +
                ", ten_danh_muc='" + ten_danh_muc + '\'' +
                ", trang_thai='" + trang_thai + '\'' +
                ", ngay_tao=" + ngay_tao +
                ", ngay_sua=" + ngay_sua +
                '}';
    }
}
