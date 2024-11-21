package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "bai_hat")
public class BaiHat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ten_bai_hat;
    private String ten_tac_gia;
    private Integer thoi_luong;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngay_san_xuat;
    @ManyToOne
    @JoinColumn(name = "ca_si_id")
    private CaSi caSi;

    @Override
    public String toString() {
        return "BaiHat{" +
                "id=" + id +
                ", ten_bai_hat='" + ten_bai_hat + '\'' +
                ", ten_tac_gia='" + ten_tac_gia + '\'' +
                ", thoi_luong=" + thoi_luong +
                ", ngay_san_xuat=" + ngay_san_xuat +
                ", caSi=" + caSi +
                '}';
    }
}
