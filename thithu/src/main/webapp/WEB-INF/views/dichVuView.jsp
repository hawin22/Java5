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
    <h3>${msg}</h3>
    <h3>Tìm kiếm</h3>
    <form action="/services-management/search" method="get">
        <div class="mb-3">
            <label class="form-label">Tên dịch vụ</label>
            <input type="text" class="form-control" name="tendichvu" placeholder="Nhập tên dịch vụ cần tìm">
        </div>
        <div class="mb-3">
            <label class="form-label">Giá min</label>
            <input type="number" class="form-control" name="giaMin" placeholder="Nhập giá min">
        </div>
        <div class="mb-3">
            <label class="form-label">Giá max</label>
            <input type="number" class="form-control" name="giaMax" placeholder="Nhập giá max">
        </div>
        <button type="submit" class="btn btn-success">Tìm kiếm</button>
    </form>
    <form:form method="post" action="/services-management/add" modelAttribute="dichvu">
        <div class="mb-3">
            <label class="form-label">Tên dịch vụ</label>
            <input type="text" class="form-control" placeholder="Nhập tên dịch vụ" name="tendichvu"
                   value="${detail.tendichvu}">
            <form:errors path="tendichvu" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Đơn giá</label>
            <input type="text" class="form-control" placeholder="Nhập đơn giá" name="don_gia"
                   value="${detail.don_gia}">
            <form:errors path="don_gia" cssClass="text-danger"></form:errors>
        </div>
        <div class="mb-3">
            <label class="form-label">Đơn vị tiền</label>
            <input type="text" class="form-control" placeholder="Nhập đơn vị tiền" name="don_vi_tien"
                   value="${detail.don_vi_tien}">
        </div>
        <div class="mb-3">
            <label class="form-label">Tên loại dịch vụ</label>
            <select name="loaiDichVu" class="form-select">
                <c:forEach items="${listLoaiDV}" var="list">
                    <option ${list.id==detail.loaiDichVu.id?"selected":""}
                            value="${list.id}">${list.ten_loai_dich_vu}</option>
                </c:forEach>
            </select>
        </div>
        <c:if test="${check}">
            <button formaction="/services-management/update/${detail.id}"
                    type="submit" class="btn btn-primary">Save
            </button>
        </c:if>
        <c:if test="${!check}">
            <button formaction="/services-management/add"
                    type="submit" class="btn btn-primary">Save
            </button>
        </c:if>
    </form:form>
    <hr>
    <form action="/services-management/sapxep">
    <a href="/services-management/sapxep">
        <button type="submit" name="sapxep" value="true">Sắp xếp</button>
    </a>
    </form>
    <h3>Danh sách dịch vụ</h3>
<%--    <div>--%>
<%--        &lt;%&ndash;        <c:forEach begin="1" end="${soTrang}">&ndash;%&gt;--%>
<%--        <a href="/services-management/groups?page=${trangHienTai>0?trangHienTai - 1:0} & size=5">--%>
<%--            <button class="btn btn-warning">Previous</button>--%>
<%--        </a>--%>
<%--        <c:forEach begin="1" end="3" varStatus="c">--%>
<%--            <a href="/services-management/groups?page=${c.count-1} & size=5">--%>
<%--                <button class="btn btn-warning">${c.count}</button>--%>
<%--            </a>--%>
<%--        </c:forEach>--%>
<%--        <a href="/services-management/groups?page=${trangHienTai < soTrang-1? trangHienTai + 1:trangHienTai} & size=5">--%>
<%--            <button class="btn btn-warning">Next</button>--%>
<%--        </a>--%>
<%--        &lt;%&ndash;        </c:forEach>&ndash;%&gt;--%>
<%--    </div>--%>
    <table class="table">
        <tr>
            <th>Tên dịch vụ</th>
            <th>Đơn giá</th>
            <th>Đơn vị tiền</th>
            <th>Tên loại dịch vụ</th>
            <th>Mô tả loại dịch vụ</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${listDV}" var="l">
            <tr>
                <td>${l.tendichvu}</td>
                <td>${l.don_gia}</td>
                <td>${l.don_vi_tien}</td>
                <td>${l.loaiDichVu.ten_loai_dich_vu}</td>
                <td>${l.loaiDichVu.mo_ta}</td>
                <td>
                    <a href="/services-management/detail/${l.id}">
                        <button class="btn btn-success">Detail</button>
                    </a>
                    <a href="/services-management/delete/${l.id}">
                        <button class="btn btn-danger">Delete</button>
                    </a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>