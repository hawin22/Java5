package com.example.demo.service;

import com.example.demo.entity.BaiHat;
import com.example.demo.entity.CaSi;
import com.example.demo.repository.BaiHatRepo;
import com.example.demo.repository.CaSiRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaiHatService {
    @Autowired
    BaiHatRepo baiHatRepo;
    @Autowired
    CaSiRepo caSiRepo;
    public List<BaiHat> listBH(){
        return baiHatRepo.findAll();
    }

    public List<CaSi> listCS() {
        return caSiRepo.findAll();
    }
    public CaSi findById(Integer id){
        return caSiRepo.findById(id).get();
    }
    public BaiHat detail(Integer id){
        return baiHatRepo.findById(id).get();
    }
    public void addOrUpdate(BaiHat baiHat){
        baiHatRepo.save(baiHat);
    }
    public Page page(Pageable pageable){
        return baiHatRepo.findAll(pageable);
    }
}
