package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "mau_sac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ma_mau;
    private String ten_mau;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;
    @Temporal(TemporalType.DATE)
    private Date ngay_tao;
}
