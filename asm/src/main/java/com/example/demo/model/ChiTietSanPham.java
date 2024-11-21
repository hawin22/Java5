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
@Table(name = "ctsp")
public class ChiTietSanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_sp")
    private SanPham sanPham;
    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;
    @ManyToOne
    @JoinColumn(name = "id_size")
    private Size size;
    private double gia_ban;
    private Integer so_luong_ton;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date  ngay_tao;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;

}
