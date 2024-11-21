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
    <form:form method="post" modelAttribute="baiHat">
        <div class="mb-3">
            <label class="form-label">
                Tên bài hát
            </label>
            <input type="text" value="${detail.ten_bai_hat}" name="ten_bai_hat" class="form-control"
                   placeholder="Nhập tên bài hát">
            <form:errors path="ten_bai_hat" cssClass="text-danger">
            </form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">
                Tên tác giả
            </label>
            <input type="text" value="${detail.ten_tac_gia}" name="ten_tac_gia" class="form-control"
                   placeholder="Nhập tên bài hát">
        </div>
        <div class="mb-3">
            <label class="form-label">
                Thời lượng
            </label>
            <input type="text" value="${detail.thoi_luong}" name="thoi_luong" class="form-control"
                   placeholder="Nhập tên bài hát">
            <form:errors path="thoi_luong"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">
                Ngày sản xuất
            </label>
            <input type="date" value="${detail.ngay_san_xuat}" name="ngay_san_xuat" class="form-control"
                   placeholder="Nhập tên bài hát">
        </div>
        <div class="mb-3">
            <label class="form-label">
                Tên ca sĩ
            </label>
            <select name="tenCaSy" id="" class="form-select">
                <c:forEach items="${listCS}" var="lCS">
                    <option value="${lCS.id}" ${lCS.id== detail.caSi.id?"selected":""}>${lCS.ten_ca_si}</option>
                </c:forEach>
            </select>
        </div>
        <c:if test="${check}">
            <button type="submit" formaction="/baihat/update/${detail.id}" class="btn btn-primary">Save</button>
        </c:if>
        <c:if test="${!check}">
            <button type="submit" formaction="/baihat/add" class="btn btn-primary">Save</button>
        </c:if>
    </form:form>
    <hr>
    <div class="mb-3">
            <a href="/baihat/hienthi?page=${trangHienTai>0?trangHienTai-1:0}">
                <button class="btn btn-danger">Previous</button>
            </a>
            <a href="/baihat/hienthi?page=${trangHienTai<soTrang-1?trangHienTai+1:trangHienTai}">
                <button class="btn btn-danger">Next</button>
            </a>
    </div>
    <h3>Danh sách bài hát</h3>
    <table class="table">
        <tr>
            <th>#</th>
            <th>Tên bài hát</th>
            <th>Tên tác giả</th>
            <th>Thời lượng</th>
            <th>Ngày sản xuất</th>
            <th>Tên ca sĩ</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${listBH}" var="lst" varStatus="c">
            <tr>
                <th>${c.count+offset}</th>
                <td>${lst.ten_bai_hat}</td>
                <td>${lst.ten_tac_gia}</td>
                <td>${lst.thoi_luong}</td>
                <td>${lst.ngay_san_xuat}</td>
                <td>${lst.caSi.ten_ca_si}</td>
                <td>
                    <a href="/baihat/detail/${lst.id}">
                        <button type="submit" class="btn btn-success">Detail</button>
                    </a> <a href="/baihat/delete/${lst.id}">
                    <button type="submit" onclick="return confirm('Bạn có muốn xoá không??')" class="btn btn-danger">
                        Delete
                    </button>
                </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>