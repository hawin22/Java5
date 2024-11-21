<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <form:form method="post" action="/baihat/update/${detail.id}" modelAttribute="baihat">
        <div class="mb-3">
            <label class="form-label">Tên bài hát</label>
            <input name="ten_bai_hat" class="form-control" value="${detail.ten_bai_hat}" type="text">
            <form:errors path="ten_bai_hat" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Tên tác giả</label>
            <input name="ten_tac_gia" class="form-control" value="${detail.ten_tac_gia}" type="text">
        </div>
        <div class="mb-3">
            <label class="form-label">Thời lượng</label>
            <input name="thoi_luong" class="form-control" type="text" value="${detail.thoi_luong}">
            <form:errors path="thoi_luong" cssClass="text-danger" ></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Ngày sản xuất</label>
            <input name="ngay_san_xuat" class="form-control" type="date" value="${detail.ngay_san_xuat}">
        </div>
        <div class="mb-3">
            <label class="form-label">Tên ca sĩ</label>
            <select name="caSi" class="form-select">
                <c:forEach items="${listCS}" var="cs">
                    <option value="${cs.id}" ${cs.id==detail.caSi.id?"selected":""}>${cs.ten_ca_si}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">ADD</button>
    </form:form>
    <hr>
    <div class="mb-3">
        <a href="/baihat/hienthi?page=${trangHienTai>0?trangHienTai-1:0}"><button type="submit" class="btn btn-light">Previous</button></a>
        <c:forEach begin="1" end="3" varStatus="c">
        <a href="/baihat/hienthi?page=${c.count-1}"><button type="submit" class="btn btn-light">${c.count}</button></a>
        </c:forEach>
        <a href="/baihat/hienthi?page=${trangHienTai<soTrang-1?trangHienTai+1:trangHienTai}"><button class="btn btn-light" type="submit">Next</button></a>
    </div>
    <h3>Danh sách bài hát</h3>
    <table class="table">
        <tr>
            <th>Tên bài hát</th>
            <th>Tên tác giả</th>
            <th>Thời lượng</th>
            <th>Ngày sản xuất</th>
            <th>Tên ca sĩ</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${listBH}" var="bh">
            <tr>
                <td>${bh.ten_bai_hat}</td>
                <td>${bh.ten_tac_gia}</td>
                <td>${bh.thoi_luong}</td>
                <td>${bh.ngay_san_xuat}</td>
                <td>${bh.caSi.ten_ca_si}</td>
                <td>
                    <a href="/baihat/detail/${bh.id}"><button type="submit" class="btn btn-success">Detail</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>