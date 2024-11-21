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
    <form:form action="/nhanvien/update/${detail.id}" method="post" modelAttribute="nhanvien">
        <div class="mb-3">
            <label class="form-label">Tên</label>
            <input type="text" name="ten" class="form-control" value="${detail.ten}" placeholder="Nhập tên nhân viên">
            <form:errors path="ten" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Giới tính</label>
            <input type="text" name="gioi_tinh" class="form-control" value="${detail.gioi_tinh}" placeholder="Nhập giới tính">
            <form:errors path="gioi_tinh" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <input type="text" name="dia_chi" class="form-control" value="${detail.dia_chi}" placeholder="Nhập địa chỉ">
            <form:errors path="dia_chi" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Trạng thái</label>
            <input type="radio" name="trang_thai" class="form-check-input" checked value="1"${detail.trang_thai==1?"checked":""}> Active
            <input type="radio" name="trang_thai" class="form-check-input" value="0" ${detail.trang_thai==0?"checked":""}> Inactive
        </div>
        <div class="mb-3">
            <label>Chức vụ</label>
            <select name="chucVu" id="" class="form-select">
                <c:forEach items="${listCV}" var="lstCV">
                    <option value="${lstCV.id}" ${lstCV.id==detail.chucVu.id?"selected":""}>${lstCV.ten}</option>
                </c:forEach>
            </select>
        </div>
        <button class="btn btn-primary" type="submit">Update</button>
    </form:form>

</div>
</body>
</html>