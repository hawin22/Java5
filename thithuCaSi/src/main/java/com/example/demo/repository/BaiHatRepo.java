package com.example.demo.repository;

import com.example.demo.entity.BaiHat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BaiHatRepo extends JpaRepository<BaiHat, Integer> {
}