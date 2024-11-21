<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>Document</title>
</head>
<style>
    /* Custom styles for the navigation bar */
    .sidebar {
        height: 800px;
        width: 300px;
        background-color: #333333;
        margin-top: 50px;
    }

    .sidebar .nav-link {
        color: #ecf0f1;
        text-decoration: none;
        padding: 15px;
        display: block;
    }

    .sidebar .nav-link.active {
        background-color: #2980b9;
        color: white;
    }

    .content {
        padding: 20px;
    }

    .card-icon {
        font-size: 2rem;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .menusp {
        width: 1000px;
    }

    .header {
        background-color: #0056b3;
        color: white;
        padding: 10px 0;
    }

    .search-input {
        width: 300px;
        margin-right: 10px;
    }

    .add-order-btn {
        background-color: #f8f9fa;
        color: #0056b3;
        border: none;
        padding: 2px 8px;
        border-radius: 4px;
    }

    .main-content {
        background-color: white;
        border-radius: 4px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        padding: 20px;
        margin-top: 20px;
    }

    .empty-cart {
        text-align: center;
        padding: 50px 0;
    }

    .empty-cart img {
        width: 100px;
        margin-bottom: 20px;
        opacity: 0.5;
    }

    .sidebar-input {
        margin-bottom: 15px;
    }

    .sidebar-section {
        margin-bottom: 20px;
    }

    .sidebar-section h5 {
        font-size: 14px;
        color: #6c757d;
        margin-bottom: 5px;
    }

    .sidebar-section .value {
        font-size: 18px;
        font-weight: bold;
    }

    .action-buttons {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .action-buttons .btn {
        background-color: #e6f2ff;
        border: 1px solid #b8daff;
        color: #0056b3;
        margin-bottom: 10px;
        font-size: 12px;
        flex-basis: calc(16.666% - 10px);
    }

    .pay-button {
        background-color: #0056b3;
        color: white;
        padding: 10px 20px;
        font-size: 18px;
        border: none;
        border-radius: 4px;
        width: 100%;
        margin-bottom: 10px;
    }

    .quick-actions {
        margin-bottom: 10px;
    }

    .quick-actions .btn {
        background-color: white;
        border: 1px solid #ced4da;
        color: #495057;
    }

    .content {
        display: none;
    }

    .icon-container {
        position: relative;
        display: inline-block;
        font-size: 24px; /* Kích thước icon chính */
    }

    .sup-button {
        position: absolute;
        top: -25px; /* Đẩy nút lên trên */
        right: -15px; /* Đẩy nút sang phải */
        font-size: 15px; /* Kích thước nhỏ của nút */
        border: none; /* Loại bỏ viền của button */
        background-color: transparent; /* Nền trong suốt */
        padding: 0.1px; /* Khoảng cách padding cho button */
    }

    .sup-button i:hover {
        color: white;
    }

    .sup-button:hover {
        background: #dc3545;
    }

    .sup-button {
        width: 20px;
    }

    .sup-button i {
        color: red; /* Màu sắc của icon bên trong button */
    }
</style>
<body>
<div class="d-flex">
    <nav class=" sidebar pt-3 ms-5">
        <ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <li class="nav-item text-center active">
                <img src="../views/imge/logoAgoni-hihi.png" alt="" class="w-75">
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/admin"
                >
                    <i class="bi bi-house-door"></i> Tổng quan
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-orders-tab" data-bs-toggle="pill" href="#v-pills-orders" role="tab"
                   aria-controls="v-pills-orders" aria-selected="false">
                    <i class="bi bi-card-checklist"></i> Đơn hàng
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-shipping-tab" data-bs-toggle="pill" href="#v-pills-shipping"
                   role="tab" aria-controls="v-pills-shipping" aria-selected="false">
                    <i class="bi bi-list-task"></i> Danh mục
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="products-tab" data-bs-toggle="collapse" href="#accordionContainer" role="button"
                   aria-expanded="true" aria-controls="accordionContainer">
                    <i class="bi bi-box-seam"></i> Sản phẩm
                </a>
            </li>
            <div class="collapse" id="accordionContainer">
                <div class="accordion" id="accordionExample">
                    <!-- Accordion 1 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <a href="#v-pills-products" id="v-pills-products-tab" data-bs-toggle="pill"
                               class="accordion-button" aria-expanded="false" role="tab"
                               aria-controls="v-pills-products" aria-selected="false">
                                Danh sách sản phẩm
                            </a>
                        </h2>
                    </div>

                    <!-- Accordion 2 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <a href="#v-pills-productsDetail" id="v-pills-productsDetail-tab" data-bs-toggle="pill"
                               class="accordion-button" aria-expanded="false" role="tab"
                               aria-controls="v-pills-products" aria-selected="false">
                                Chi tiết sản phẩm
                            </a>
                        </h2>
                    </div>
                </div>
            </div>
            <li class="nav-item">
                <a class="nav-link" id="v-pills-customers-tab" data-bs-toggle="pill" href="#v-pills-customers"
                   role="tab" aria-controls="v-pills-customers" aria-selected="false">
                    <i class="bi bi-person"></i> Khách hàng
                </a>
            </li>

            <div class="text-white border-dark-subtle pb-2  border-bottom"></div>
            <li class="nav-item">
                <a class="nav-link active" id="v-pills-sells-tab" data-bs-toggle="pill" href="#v-pills-sells"
                   role="tab" aria-controls="v-pills-sells" aria-selected="false">
                    <i class="fa-duotone fa-solid fa-cash-register"></i> Bán hàng
                </a>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/qlhd">
                    <i class="bi bi-bag-check-fill"></i> Quản lý hoá đơn
                </a>

            </li>

        </ul>
    </nav>
            <!-- Overview Section -->
            <div class="tab-pane fade show active " id="v-pills-sells" role="tabpanel"
                 aria-labelledby="v-pills-sells-tab" style="width: 1000px;">
                <div class="container-fluid mt-4">
                    <div class="home mt-4 ms-5">
                        <div class="container-fluid" style="width: 1000px;">
                            <div class="row header">
                                <div class="col-6 d-flex align-items-center">
                                    <input type="text" class="form-control search-input"
                                           placeholder="Thêm sản phẩm vào đơn">
                                    <select class="form-select" style="width: 100px;">
                                        <option>(F10)</option>
                                    </select>
                                    <div class="order-tabs me-3 ms-3" style="width: 200px;">
                                        <!-- Button trigger modal -->
                                        <button class="add-order-btn" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal1">+ Thêm
                                            hoá đơn
                                        </button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal1" tabindex="-1"
                                             aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel1">Thêm bạn
                                                            vào giỏ
                                                            hàng</h1>
                                                    </div>
                                                    <form action="/admin/hoa-don/add" method="post">
                                                        <table class="table">
                                                            <tr>
                                                                <th>#</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Địa chỉ</th>
                                                                <th>SĐT</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            <c:forEach items="${listKH}" var="kh" varStatus="c">
                                                                <tr>
                                                                    <td>${c.count}</td>
                                                                    <td>${kh.id}</td>
                                                                    <td>${kh.ho_ten}</td>
                                                                    <td>${kh.dia_chi}</td>
                                                                    <td>${kh.sdt}</td>
                                                                    <td>
                                                                        <button type="submit" value="${kh.id}"
                                                                                name="idKhach"
                                                                                class="btn btn-primary">Thêm
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 text-end">
                                    <i class="fas fa-wifi ms-2"></i>
                                    <i class="fas fa-home ms-2"></i>
                                    <i class="fas fa-user ms-2"></i>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-8">
                                    <div class="main-content" style="height: 500px">
                                        <h3>Hoá đơn</h3>
                                        <div style="max-height: 150px; overflow-y:auto">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Mã hoá đơn</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listHoaDon}" var="lhd" varStatus="c">
                                                    <tr onclick="location.href='/admin/detailHD/${lhd.id}'">
                                                        <td>${c.count}</td>
                                                        <td>${lhd.id}</td>
                                                        <td>${lhd.ho_ten}</td>
                                                        <td>${lhd.ngay_tao}</td>
                                                        <td>${lhd.trang_thai}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <hr>
                                        <h3>Chi tiết hoá đơn</h3>
                                        <div style="max-height: 150px; overflow-y:auto">
                                            <table class="table" id="invoiceDetailTable">
                                                <thead>
                                                <tr>
                                                    <th>Sản phẩm</th>
                                                    <th>Số lượng</th>
                                                    <th>Đơn giá</th>
                                                    <th>Thành tiền</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listHDCTTheoHD}" var="lstHdct" varStatus="c">
                                                    <tr>
                                                            <%--<td>${c.count}</td>--%>
                                                        <td>${lstHdct.ten_san_pham}</td>
                                                            <%--                                            <td>${lstHdct.so_luong_mua}</td>--%>
                                                        <td data-product-id="${lstHdct.id}" id="quantity-${lstHdct.id}">
                                                            <span id="quantity-value-${lstHdct.id}">${lstHdct.so_luong_mua}</span>
                                                            <div class="icon-container">
                                                                <button class="sup-button btn btn-danger"
                                                                        onclick="openUpdateModal(${lstHdct.id})">
                                                                    <i class="bi bi-exposure"></i>
                                                                </button>
                                                            </div>

                                                        </td>
                                                        <td>${lstHdct.gia_ban}</td>
                                                        <td>${lstHdct.tong_tien}</td>
                                                    </tr>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="updateQuantityModal" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Cập
                                                                        nhật số
                                                                        lượng</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="/admin/updateSL" method="post">
                                                                        <input type="hidden" id="idHDCT" value=""
                                                                               name="idHDCT"/>
                                                                        <input type="hidden" name="soLuongTon"
                                                                               id="soLuongTon"
                                                                               value="${lstHdct.so_luong_ton}">
                                                                        <div class="mb-3">
                                                                            <label for="newQuantity" class="form-label">Số
                                                                                lượng
                                                                                mới</label>
                                                                            <input type="number" min="0"
                                                                                   class="form-control"
                                                                                   name="newQuantity"
                                                                                   id="newQuantity"
                                                                                   required/>
                                                                            <span style="color: red"
                                                                                  id="errorSL"></span>
                                                                                <%--                                                                <span style="color: red">${valueSL}</span>--%>

                                                                                <%-- Hiển thị thông báo lỗi nếu có --%>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-secondary"
                                                                                    data-bs-dismiss="modal">Đóng
                                                                            </button>
                                                                            <button type="submit"
                                                                                    class="btn btn-primary"
                                                                                    formaction="/admin/updateSL"
                                                                                    id="submitBtn">Cập nhật
                                                                            </button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="main-content">
                                        <form method="post">
                                            <div class="sidebar-section">
                                                <h5>Khách hàng: </h5>
                                                <input type="text" name="tenKH"
                                                       value="${listHoaDonKH}"
                                                       id="ten_KH"
                                                       style="outline: none;border: none; border-bottom: 1px solid black;">
                                            </div>
                                            <div class="sidebar-section">
                                                <h5>Tổng tiền: </h5>
                                                <input type="number" name="tongTien"
                                                       value="${tinhTongTien}"
                                                       id="tongTien"
                                                       style="outline: none;border: none; border-bottom: 1px solid black;">
                                            </div>
                                            <div class="sidebar-section">
                                                <h5>KHÁCH PHẢI TRẢ</h5>
                                                <input type="number" name=""
                                                       value="${tinhTongTien}"
                                                       style="color: #0056b3;outline: none;border: none; border-bottom: 1px solid black;">
                                            </div>
                                            <div class="sidebar-section">
                                                <h5>Tiền khách đưa (F2)</h5>
                                                <input type="number" name="tienKhachDua" id="tienKhachDua"
                                                       oninput="tinhTienThua()"
                                                       style="outline: none;border: none; border-bottom: 1px solid black;">
                                            </div>
                                            <div class="sidebar-section">
                                                <h5>Tiền thừa trả khách</h5>
                                                <input type="number" name="tienThua" id="tienThua"
                                                       value="${tienThua}"
                                                       style="outline: none;border: none; border-bottom: 1px solid black;">
                                            </div>
                                            <%--                                <form id="thanhToanForm" action="/admin/detailHD/${idHoaDon}" method="GET"--%>
                                            <%--                                      style="display: none;">--%>
                                            <%--                                    <input type="hidden" name="action" value="thanhToan">--%>
                                            <%--                                </form>--%>
                                            <button formaction="/admin/thanh-toan" class="btn btn-warning" disabled
                                                    id="inHoaDon"
                                                    type="submit"
                                            >THANH TOÁN (F1)
                                            </button>
                                            <button class="btn btn-success" disabled id="thanhToan"
                                                    onclick="openInvoiceModal()"
                                                    type="button">In hoá đơn
                                            </button>
                                        </form>
                                        <!-- Modal for invoice -->

                                        <div class="modal fade" id="invoiceModal" tabindex="-1"
                                             aria-labelledby="invoiceModalLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="invoiceModalLabel">Hóa đơn thanh
                                                            toán</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body inHoaDon">
                                                        <p><strong>Khách hàng:</strong> <span id="modalTenKH"></span>
                                                        </p>
                                                        <p><strong>Tổng tiền:</strong> <span id="modalTongTien"></span>
                                                        </p>
                                                        <p><strong>Tiền khách đưa:</strong> <span
                                                                id="modalTienKhachDua"></span></p>
                                                        <p><strong>Tiền thừa trả khách:</strong> <span
                                                                id="modalTienThua"></span>
                                                        </p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">
                                                            Đóng
                                                        </button>
                                                        <button type="button" class="btn btn-primary"
                                                                onclick="printInvoice()">In
                                                            hóa đơn
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center">
                                            <span class="text-muted">Hotline hỗ trợ: 1900 6750</span>
                                        </div>
                                    </div>
                                    <h3>${msg}</h3>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pills-profile-tab" data-bs-toggle="pill"
                                                data-bs-target="#pills-profile" type="button" role="tab"
                                                aria-controls="pills-profile"
                                                aria-selected="false">Danh sách sản phẩm
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-home-tab" data-bs-toggle="pill"
                                                data-bs-target="#pills-home" type="button" role="tab"
                                                aria-controls="pills-home"
                                                aria-selected="true">Thao tác nhanh
                                        </button>
                                    </li>

                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-profile" role="tabpanel"
                                         aria-labelledby="pills-profile-tab"
                                         tabindex="0">
                                        <div style="max-height: 200px; overflow-y: auto;">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Tên màu</th>
                                                    <th>Tên size</th>
                                                    <th>Giá bán</th>
                                                    <th>Số lượng bán</th>
                                                    <th>Thêm</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${listSPBanHang}" var="lspbh" varStatus="c">
                                                    <tr>
                                                        <td>${c.count}</td>
                                                        <td>${lspbh.ten_san_pham}</td>
                                                        <td>${lspbh.ten_mau}</td>
                                                        <td>${lspbh.ten_size}</td>
                                                        <td>${lspbh.gia_ban}</td>
                                                        <td>${lspbh.so_luong_ton}</td>
                                                        <td class="d-flex ">
                                                            <form action="/admin/ban_hang/addsp" method="post"
                                                                  class="d-flex">
                                                                <button style="width: 30px;" type="button"
                                                                        class="btn btn-warning d-flex justify-content-center "
                                                                        name="action"
                                                                        onclick="giam('changeSL${c.index}');"
                                                                        value="giam">-
                                                                </button>
                                                                <input type="text" value="1" id="changeSL${c.index}"
                                                                       name="chonSL"
                                                                       min="1"
                                                                       max="${lspbh.so_luong_ton}"
                                                                       style="width: 30px; outline: none; text-align: center; border: beige; background-color: bisque">
                                                                <button style="width: 30px;" type="button"
                                                                        class="btn btn-warning d-flex justify-content-center"
                                                                        name="action"
                                                                        onclick="tang('changeSL${c.index}', ${lspbh.so_luong_ton});"
                                                                        value="tang">+
                                                                </button>

                                                                <input type="hidden" value="1" name="minSoluong">
                                                                <input type="hidden" value="${lspbh.so_luong_ton}"
                                                                       name="maxSoluong">
                                                                <input type="hidden" name="idSanPham"
                                                                       value="${lspbh.id}">
                                                                <input type="hidden" name="idHoaDon"
                                                                       value="${idHoaDon}">

                                                                <button type="submit" class="btn btn-primary">Thêm
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade " id="pills-home" role="tabpanel"
                                         aria-labelledby="pills-home-tab"
                                         tabindex="0">
                                        <div class="action-buttons">
                                            <button class="btn">Thêm dịch vụ (F9)</button>
                                            <button class="btn">Chiết khấu đơn (F6)</button>
                                            <button class="btn">Khuyến mãi (F8)</button>
                                            <button class="btn">Đổi quà</button>
                                            <button class="btn">Thiết lập chung</button>
                                            <button class="btn">Đổi giá bán hàng</button>
                                            <button class="btn">Thông tin khách hàng</button>
                                            <button class="btn">Xóa toàn bộ sản phẩm</button>
                                            <button class="btn">Đổi trả hàng</button>
                                            <button class="btn">Xem danh sách đơn hàng</button>
                                            <button class="btn">Xem báo cáo</button>
                                            <button class="btn">Tất cả thao tác</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</div>
<script>

    function giam(inputId) {
        let input = document.getElementById(inputId);
        let soLuongs = parseInt(input.value); // Chuyển đổi giá trị từ string sang số
        if (soLuongs > 1) { // Kiểm tra nếu số lượng lớn hơn 1
            input.value = soLuongs - 1; // Cập nhật giá trị trong input
        }
    }

    function tang(inputId, maxSoLuong) {
        let input = document.getElementById(inputId);
        let soLuongs = parseInt(input.value); // Chuyển đổi giá trị từ string sang số
        if (soLuongs < maxSoLuong) { // Kiểm tra nếu số lượng nhỏ hơn số lượng tồn
            input.value = soLuongs + 1; // Cập nhật giá trị trong input
        }
    }

    function tinhTienThua() {
        var tongTien = parseFloat(document.getElementById("tongTien").value);
        var tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value);
        var thanhToan = document.getElementById("thanhToan");
        var inHoaDon = document.getElementById("inHoaDon");

        if (!isNaN(tienKhachDua) && tienKhachDua >= tongTien) {
            var tienThua = tienKhachDua - tongTien;
            document.getElementById("tienThua").value = tienThua;
            thanhToan.disabled = false;
            inHoaDon.disabled = false;
        } else {
            var tienThua = tienKhachDua - tongTien;
            document.getElementById("tienThua").value = tienThua;
            thanhToan.disabled = true;
            inHoaDon.disabled = true;
        }
    }

    function openInvoiceModal() {
        var tenKH = document.getElementById("ten_KH").value;
        var tongTien = document.getElementById("tongTien").value;
        var tienKhachDua = document.getElementById("tienKhachDua").value;
        var tienThua = document.getElementById("tienThua").value;

        // Set values in the modal
        // document.getElementById("thanhToanForm").submit(); // Gửi form khi nhấn nút
        document.getElementById("modalTenKH").innerText = tenKH;
        document.getElementById("modalTongTien").innerText = tongTien;
        document.getElementById("modalTienKhachDua").innerText = tienKhachDua;
        document.getElementById("modalTienThua").innerText = tienThua;

        // Show modal
        var invoiceModal = new bootstrap.Modal(document.getElementById('invoiceModal'));
        invoiceModal.show();
    }

    function printInvoice() {
        var invoiceContent = document.querySelector('.inHoaDon').innerHTML;
        var printWindow = window.open('', '', 'height=400,width=600');
        printWindow.document.write('<html><head><title>In Hóa Đơn</title></head><body>');
        printWindow.document.write('<h3>HÓA ĐƠN THANH TOÁN</h3>');
        printWindow.document.write(invoiceContent);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.print();

    }

    function openUpdateModal(idHDCT) {
        // Lấy giá trị hiện tại từ ô số lượng
        var currentQuantity = document.getElementById('quantity-value-' + idHDCT).innerText;

        // Đặt giá trị hiện tại vào ô input
        document.getElementById('newQuantity').value = currentQuantity;
        document.getElementById('idHDCT').value = idHDCT; // Lưu ID sản phẩm

        // Mở modal
        var myModal = new bootstrap.Modal(document.getElementById('updateQuantityModal'));
        myModal.show();
    }

    // function updateQuantity() {
    //     // Lấy giá trị mới từ input
    //     var newQuantity = document.getElementById('newQuantity').value;
    //     var productId = document.getElementById('productId').value;
    //
    //     // Cập nhật số lượng hiển thị trong ô
    //     var quantityValueCell = document.getElementById('quantity-value-' + productId);
    //     quantityValueCell.innerText = newQuantity; // Cập nhật số lượng hiển thị
    //
    //     // Đóng modal
    //     var myModal = bootstrap.Modal.getInstance(document.getElementById('updateQuantityModal'));
    //     myModal.hide();
    // }
    document.getElementById("newQuantity").addEventListener("input", function () {
        var soLuongTon = parseInt(document.getElementById("soLuongTon").value);
        console.log(soLuongTon);
        var newQuantity = parseInt(this.value);
        var errorSL = document.getElementById("errorSL");
        var submitBtn = document.getElementById("submitBtn");

        if (newQuantity > soLuongTon) {
            errorSL.textContent = "Số lượng mới phải nhỏ hơn hoặc bằng số lượng tồn.";
            submitBtn.disabled = true;
        } else {
            errorSL.textContent = "";
            submitBtn.disabled = false;
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>