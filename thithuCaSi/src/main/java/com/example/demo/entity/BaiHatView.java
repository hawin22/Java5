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
public class BaiHatView {
    @Id
    private Integer id;
    @NotBlank(message = "Ko đc trống tên bài hát")
    private String ten_bai_hat;
    private String ten_tac_gia;
    @NotBlank(message = "Ko đc trống thời lượng")
    @Pattern(regexp = "\\d+", message = "Thời lượng phải là số")
    private String thoi_luong;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngay_san_xuat;
}
