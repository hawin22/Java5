package com.example.demo.repository;

import com.example.demo.entity.DichVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DichVuRepository extends JpaRepository<DichVu, Integer> {
    @Query(nativeQuery = true, value = "select dv.id_loai_dich_vu,ldv.id, dv.ten_dich_vu, dv.don_vi_tien, dv.don_gia,ldv.ten_loai_dich_vu from dich_vu dv\n" +
            "join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id\n" +
            "where dv.don_gia between :giaMin and :giaMax")
    public List<DichVu> searchTheoGia(@Param("giaMin") Double giaMin, @Param("giaMax") Double giaMax);

    @Query(nativeQuery = true, value = "select dv.id_loai_dich_vu,ldv.id, dv.ten_dich_vu, dv.don_vi_tien, dv.don_gia,ldv.ten_loai_dich_vu from dich_vu dv\n" +
            "join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id\n" +
            "where dv.ten_dich_vu like :tendichvu")
    public List<DichVu> searchTheoTen(@Param("tendichvu") String tendichvu);

}
