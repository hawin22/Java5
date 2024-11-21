package com.example.demo.request;

import com.example.demo.entity.ChucVu;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NhanVienRequest {
    private Integer id;
    @NotBlank(message = "Vui lòng nhập tên")
    private String ten;
    @NotBlank(message = "Vui lòng nhập giới tính")
    private String gioi_tinh;
    @NotBlank(message = "Vui lòng nhập địa chỉ")
    private String dia_chi;
    private Integer trang_thai;
    private Integer chucVu;
}
