package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public interface DichVuInterface {
    Integer getIdLoaiDV();
     Integer getId();
     String getTendichvu();
     String getDon_vi_tien();
     Double getDon_gia();
     String getTenLoaiDV();
}
