package com.example.demo.service;

import com.example.demo.Repository.BaiHatRepo;
import com.example.demo.Repository.CaSiRepo;
import com.example.demo.entity.BaiHat;
import com.example.demo.entity.CaSi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaiHatService {
    @Autowired
    BaiHatRepo baiHatRepo;
    @Autowired
    CaSiRepo caSiRepo;

    public List<BaiHat> listBH() {
        return baiHatRepo.findAll();
    }

    public Page list(Pageable pageable) {
        return baiHatRepo.findAll(pageable);
    }

    public List<CaSi> listCS() {
        return caSiRepo.findAll();
    }

    public void add(BaiHat bh) {
        baiHatRepo.save(bh);
    }

    public BaiHat detail(Integer id) {
        return baiHatRepo.findById(id).get();
    }

    public void update(BaiHat baiHat) {
         baiHatRepo.save(baiHat);
    }

    public void delete(Integer id) {
        baiHatRepo.delete(detail(id));
    }

    public CaSi findByID(Integer id) {
        return caSiRepo.findById(id).get();
    }
//    public List<BaiHat> sapXep(){
//        return baiHatRepo.findAll(Sort.by(Sort.Direction.DESC,"ten_bai_hat"));
//    }
}
