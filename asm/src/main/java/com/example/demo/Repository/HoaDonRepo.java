package com.example.demo.Repository;

import com.example.demo.model.HoaDon;
import com.example.demo.model.HoaDonView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;

public interface HoaDonRepo extends JpaRepository<HoaDon, Integer> {
    @Query(nativeQuery = true, value = "select hd.id, kh.ho_ten,hd.ngay_tao, hd.trang_thai from hoa_don hd left join khach_hang kh on hd.id_khach_hang = kh.id where hd.trang_thai='Chua thanh toan'")
    ArrayList<HoaDonView> getList();

    @Query(nativeQuery = true, value = "select hd.id, kh.ho_ten,hd.ngay_tao, hd.trang_thai,  sum(tong_tien) as tongTien from hoa_don hd left join khach_hang kh on hd.id_khach_hang = kh.id join hdct on hd.id = hdct.id_hoa_don group by hd.id, kh.ho_ten,hd.ngay_tao, hd.trang_thai")
    ArrayList<HoaDonView> getListQLHD();

    @Query(nativeQuery = true, value = "select * from hoa_don where hoa_don.id=:idQLHD")
    ArrayList<HoaDonView> searchQLHD(@Param("idQLHD") Integer idQLHD);
}
