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
</style>
<body>
<div class="d-flex">
    <nav class=" sidebar pt-3 ms-5">
        <ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <li class="nav-item text-center active">
                <img src="../views/imge/logoAgoni-hihi.png" alt="" class="w-75">
            </li>
            <li class="nav-item">
                <a class="nav-link " id="v-pills-overview-tab" data-bs-toggle="pill" href="/admin"
                   role="tab" aria-controls="v-pills-overview" aria-selected="true">
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
                <a class="nav-link active" id="v-pills-shipping-tab" data-bs-toggle="pill" href="#v-pills-shipping"
                   role="tab" aria-controls="v-pills-shipping" aria-selected="false">
                    <i class="bi bi-list-task"></i>  Danh mục
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
                <a class="nav-link" id="v-pills-sells-tab" data-bs-toggle="pill" href="#v-pills-sells"
                   role="tab" aria-controls="v-pills-sells" aria-selected="false">
                    <i class="fa-duotone fa-solid fa-cash-register"></i> Bán hàng
                </a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid mt-4">
        <div class="home mt-4 ms-5">
            <div class="" style="width: 1100px">
                <form action="/admin/addDanhMuc" method="post">
                    <div class="mb-3">
                        <label for="maDanhMuc" class="form-label">Mã danh mục</label>
                        <input type="text" class="form-control" name="ma_danh_muc" id="maDanhMuc" placeholder="Nhập mã danh mục">
                    </div>
                    <div class="mb-3">
                        <label for="tenDanhMuc" class="form-label">Tên danh mục</label>
                        <input type="text" class="form-control" name="ten_danh_muc" id="tenDanhMuc" placeholder="Nhập tên danh mục">
                    </div>
                    <div class=" mb-3">
                        <label class="form-check-label">
                            Trạng thái
                        </label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="trang_thai" value="active">
                            <label class="form-check-label">
                                Active
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="trang_thai" value="inactive">
                            <label class="form-check-label">
                                Inactive
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="ngayTao" class="form-label">Ngày tạo</label>
                        <input type="date" class="form-control" name="ngay_tao" id="ngayTao">
                    </div>
                    <div class="mb-3">
                        <label for="ngaySua" class="form-label">Ngày sửa</label>
                        <input type="date" class="form-control" name="ngay_sua" id="ngaySua">
                    </div>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>