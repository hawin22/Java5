package com.example.demo.repository;

import com.example.demo.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NhanVienView extends JpaRepository<NhanVien, Integer> {
    @Query(nativeQuery = true, value = "select nv.ID, nv.HoTen, nv.Tuoi, nv.DiaChi, nv.PhongBan, nv.GioiTinh from NhanVien nv")
    List<NhanVien> getList();

}
