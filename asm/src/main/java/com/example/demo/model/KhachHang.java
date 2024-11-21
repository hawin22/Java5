package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Integer id;
    private String ho_ten;
    private String dia_chi;
    private String sdt;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;
    @Temporal(TemporalType.DATE)
    private Date ngay_tao;
}
