package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
//    @NotBlank(message = "Vui lòng nhập tên")
    private String ten;
//    @NotBlank(message = "Vui lòng nhập giới tính")
    private String gioi_tinh;
//    @NotBlank(message = "Vui lòng nhập địa chỉ")
    private String dia_chi;
    private Integer trang_thai;
    @ManyToOne
    @JoinColumn(name = "id_cv")
    private ChucVu chucVu;

}
