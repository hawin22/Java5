package com.example.demo.service;

import com.example.demo.entity.DichVu;
import com.example.demo.entity.LoaiDichVu;
import com.example.demo.repository.DichVuRepository;
import com.example.demo.repository.LoaiDichVuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DichVuService {
    @Autowired
    public DichVuRepository dichVuRepository;

    @Autowired
    public LoaiDichVuRepository loaiDichVuRepository;

    public ArrayList<DichVu> hienThi() {
        return (ArrayList<DichVu>) dichVuRepository.findAll();
    }

    public Page hienThi1(Pageable pageable) {
        return  dichVuRepository.findAll(pageable);
    }

    public ArrayList<LoaiDichVu> listLoaiDV() {
        return (ArrayList<LoaiDichVu>) loaiDichVuRepository.findAll();
    }

    public void add(DichVu dv) {
        dichVuRepository.save(dv);
    }

    public DichVu detail(Integer id) {
        return dichVuRepository.findById(id).get();
    }

    public void update(DichVu dv) {
        dichVuRepository.save(dv);
    }

    public void detete(Integer id) {
        dichVuRepository.delete(detail(id));
    }
    public List<DichVu> searchTheoGia(Double giaMin,Double giaMax){
        return dichVuRepository.searchTheoGia(giaMin,giaMax);
    };
    public List<DichVu> searchTheoTen(String tendichvu){
        return dichVuRepository.searchTheoTen("%"+tendichvu+"%");
    }
    public List<DichVu> sapXep(){
        return dichVuRepository.findAll(Sort.by(Sort.Direction.DESC, "tendichvu"));
    }
}
