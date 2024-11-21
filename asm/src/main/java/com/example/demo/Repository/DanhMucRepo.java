package com.example.demo.Repository;

import com.example.demo.model.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DanhMucRepo extends JpaRepository<DanhMuc,Integer> {
}
