package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jdk.jfr.Name;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "nhanvien")
public class NhanVien {
    @Id

    private Integer id;

    private String hoten;

    private Integer tuoi;

    private String diachi;

    private String phongban;

    private String gioitinh;

    @Override
    public String toString() {
        return "NhanVien{" +
                "id=" + id +
                ", hoten='" + hoten + '\'' +
                ", tuoi=" + tuoi +
                ", diachi='" + diachi + '\'' +
                ", phongban='" + phongban + '\'' +
                ", gioitinh='" + gioitinh + '\'' +
                '}';
    }
}
