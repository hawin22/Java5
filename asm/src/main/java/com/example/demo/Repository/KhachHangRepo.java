package com.example.demo.Repository;

import com.example.demo.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KhachHangRepo extends JpaRepository<KhachHang, Integer> {
}
