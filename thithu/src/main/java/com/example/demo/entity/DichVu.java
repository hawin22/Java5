package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "dich_vu")
@Entity
public class DichVu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank(message = "Tên ko đc để trống")
    @Column(name = "ten_dich_vu")
    private String tendichvu;
    private String don_vi_tien;
    @NotNull(message = "Giá ko đc trống")
    private Double don_gia;
    @ManyToOne
    @JoinColumn(name = "id_loai_dich_vu")
    private LoaiDichVu loaiDichVu;

}
