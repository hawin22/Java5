<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>Document</title>
</head>
<body>
<div class="container">
    <form:form action="/nhanvien/add" method="post" modelAttribute="nhanvien">
        <div class="mb-3">
            <label class="form-label">Tên</label>
            <input type="text" name="ten" class="form-control" placeholder="Nhập tên nhân viên">
            <form:errors path="ten" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới tính</label>
            <input type="text" name="gioi_tinh" class="form-control" placeholder="Nhập giới tính">
            <form:errors path="gioi_tinh" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <input type="text" name="dia_chi" class="form-control" placeholder="Nhập địa chỉ">
            <form:errors path="dia_chi" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Trạng thái</label>
            <input type="radio" name="trang_thai" class="form-check-input" checked value="1"> Active
            <input type="radio" name="trang_thai" class="form-check-input" value="0"> Inactive
        </div>
        <div class="mb-3">
            <label>Chức vụ</label>
            <select name="chucVu" id="" class="form-select">
               <c:forEach items="${listCV}" var="lstCV">
                   <option value="${lstCV.id}">${lstCV.ten}</option>
               </c:forEach>
            </select>
        </div>
        <button class="btn btn-primary" type="submit">Add</button>
    </form:form>
    <div class="mb-3">
        <a href="/nhanvien/sort">
            <button type="submit" class="btn btn-primary">Sắp xếp</button>
        </a>
        <a href="/nhanvien/hienthi"> <button type="submit" class="btn btn-warning">Home</button></a>
    </div>
    <table class="table table-hover">
        <tr>
            <th>Tên</th>
            <th>Giới tính</th>
            <th>Địa chỉ</th>
            <th>Trạng thái</th>
            <th>Chức vụ</th>
            <th>Hành động</th>
        </tr>
       <c:forEach items="${listNV}" var="lstNV">
           <tr onclick="location.href='/nhanvien/detail/${lstNV.id}'">
               <td>${lstNV.ten}</td>
               <td>${lstNV.gioi_tinh}</td>
               <td>${lstNV.dia_chi}</td>
               <td>${lstNV.trang_thai==1?"Active":"Inactive"}</td>
               <td>${lstNV.chucVu.ten}</td>
               <td>
                   <a href="/nhanvien/detail/${lstNV.id}"><button class="btn btn-success" type="button">Detail</button></a>
                   <a href="/nhanvien/delete/${lstNV.id}"><button class="btn btn-danger" onclick="return confirm('Bạn có muốn xoá không??')" type="button">Delete</button></a>
               </td>
           </tr>
       </c:forEach>
    </table>
</div>
</body>
</html>