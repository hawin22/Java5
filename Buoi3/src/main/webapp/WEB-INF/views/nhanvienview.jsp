<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Nhan Vien</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Form thêm nhân viên -->
    <h2 class="mb-4">Thêm Nhân Viên</h2>
    <form method="post" action="/nhanvien/add">
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="maNhanVien" class="form-label">Mã nhân viên</label>
                <input type="text" class="form-control" id="maNhanVien" placeholder="Mã nhân viên" name="id">
            </div>
            <div class="col-md-6">
                <label for="tenNhanVien" class="form-label">Tên nhân viên</label>
                <input type="text" class="form-control" id="tenNhanVien" placeholder="Tên nhân viên" name="hoten">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="tuoi" class="form-label">Tuổi</label>
                <input type="number" class="form-control" id="tuoi" placeholder="Tuổi" name="tuoi">
            </div>
            <div class="col-md-6">
                <label for="diaChi" class="form-label">Địa Chỉ</label>
                <input type="text" class="form-control" id="diaChi" placeholder="Địa chỉ" name="diachi">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="phongBan" class="form-label">Phòng Ban</label>
                <select class="form-select" id="phongBan" name="phongban">
                    <option selected>Chọn phòng ban</option>
                    <option value="Phòng Kỹ Thuật">Phòng Kỹ Thuật</option>
                    <option value="Phòng Kinh Doanh">Phòng Kinh Doanh</option>
                    <option value="Phòng Nhân Sự">Phòng Nhân Sự</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label d-block">Giới tính</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gioitinh" id="gioiTinhNam" value="Nam">
                    <label class="form-check-label" for="gioiTinhNam">Nam</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gioitinh" id="gioiTinhNu" value="Nu">
                    <label class="form-check-label" for="gioiTinhNu">Nữ</label>
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <!-- Tìm kiếm nhân viên -->
    <h2 class="mt-5">Chức năng tìm kiếm</h2>
    <form class="mb-5">
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="timKiemTen" class="form-label">Tên Nhân Viên</label>
                <input type="text" class="form-control" id="timKiemTen" placeholder="Nhập tên nhân viên">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <!-- Danh sách nhân viên -->
    <h2 class="mb-4">Danh sách nhân viên</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã Nhân Viên</th>
            <th scope="col">Họ Tên</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Tuổi</th>
            <th scope="col">Giới Tính</th>
            <th scope="col">Phòng Ban</th>
            <th scope="col">Chức Năng</th>
        </tr>
        </thead>
        <tbody>
       <c:forEach items="${list}" var="l" varStatus="c">
           <tr>
               <th scope="row">${c.count}</th>
               <td>${l.id}</td>
               <td>${l.hoten}</td>
               <td>${l.tuoi}</td>
               <td>${l.diachi}</td>
               <td>${l.gioitinh}</td>
               <td>${l.phongban}</td>
               <td><button class="btn btn-warning btn-sm">Edit</button> <button class="btn btn-danger btn-sm">Delete</button></td>
           </tr>
       </c:forEach>
        <!-- Thêm các hàng khác nếu cần -->
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>