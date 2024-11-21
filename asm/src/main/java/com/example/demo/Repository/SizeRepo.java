package com.example.demo.Repository;

import com.example.demo.model.Size;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SizeRepo extends JpaRepository<Size, Integer> {
}
