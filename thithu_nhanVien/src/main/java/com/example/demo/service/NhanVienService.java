package com.example.demo.service;

import com.example.demo.entity.ChucVu;
import com.example.demo.entity.NhanVien;
import com.example.demo.repository.ChucVuRepo;
import com.example.demo.repository.NhanVienRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanVienService {
    @Autowired
    ChucVuRepo chucVuRepo;
    @Autowired
    NhanVienRepo nhanVienRepo;

    public List<NhanVien> listNV() {
        return nhanVienRepo.findAll();
    }

    public List<ChucVu> listCV() {
        return chucVuRepo.findAll();
    }

    public void addOrUpdate(NhanVien nv) {
        nhanVienRepo.save(nv);
    }

    public NhanVien detail(Integer id) {
        return nhanVienRepo.findById(id).get();
    }

    public ChucVu detailCV(Integer id) {
        return chucVuRepo.findById(id).get();
    }

    public void delete(Integer id) {
        nhanVienRepo.delete(detail(id));
    }

    public List<NhanVien> listNVSort() {
        return nhanVienRepo.findAll(Sort.by(Sort.Direction.DESC, "ten"));
    }
}
