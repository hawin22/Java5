package com.example.demo.Repository;

import com.example.demo.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SanPhamRepo extends JpaRepository<SanPham, Integer> {

}
