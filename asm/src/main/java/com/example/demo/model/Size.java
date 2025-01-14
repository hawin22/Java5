package com.example.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "size")
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ma_size;
    private String ten_size;
    private String trang_thai;
    @Temporal(TemporalType.DATE)
    private Date ngay_sua;
    @Temporal(TemporalType.DATE)
    private Date ngay_tao;
}
