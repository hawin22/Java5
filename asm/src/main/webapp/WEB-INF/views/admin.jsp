<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vertical Navigation Bar with Tabs</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
</head>

<body>
<div class="d-flex">

    <!-- Sidebar -->
    <nav class=" sidebar pt-3 ms-5">
        <ul class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <li class="nav-item text-center active">
                <img src="../views/imge/logoAgoni-hihi.png" alt="" class="w-75">
            </li>
            <li class="nav-item">
                <a class="nav-link active" id="v-pills-overview-tab" data-bs-toggle="pill" href="#v-pills-overview"
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

                    <a class="nav-link" href="/admin/ban_hang">
                        <i class="fa-duotone fa-solid fa-cash-register"></i>
                        Bán hàng
                    </a>

            </li>

        </ul>
    </nav>

    <!-- Content -->
    <div class="content d-flex d-flex justify-content-evenly ">
        <div class="tab-content" id="v-pills-tabContent">
            <!-- Overview Section -->
            <div class="tab-pane fade show active " id="v-pills-overview" role="tabpanel"
                 aria-labelledby="v-pills-overview-tab" style="width: 1000px;">
                <div class="container-fluid mt-3">
                    <h1 class="mb-4">Tổng quan</h1>

                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <span>KẾT QUẢ KINH DOANH TRONG NGÀY</span>
                            <select class="form-select form-select-sm" style="width: auto;">
                                <option>Tất cả chi nhánh</option>
                            </select>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon bg-primary text-white me-3">
                                            <i class="fas fa-dollar-sign"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Doanh thu</h6>
                                            <h4 class="mb-0">0</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon bg-success text-white me-3">
                                            <i class="fas fa-shopping-cart"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Đơn hàng mới</h6>
                                            <h4 class="mb-0">0</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon bg-warning text-white me-3">
                                            <i class="fas fa-undo"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Đơn trả hàng</h6>
                                            <h4 class="mb-0">0</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon bg-danger text-white me-3">
                                            <i class="fas fa-times"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-0">Đơn hủy</h6>
                                            <h4 class="mb-0">0</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <span>ĐƠN HÀNG CHỜ XỬ LÝ</span>
                            <select class="form-select form-select-sm" style="width: auto;">
                                <option>7 ngày qua</option>
                            </select>
                        </div>
                        <div class="card-body">
                            <div class="row text-center">
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-check-circle fa-2x text-primary mb-2"></i>
                                    <h6>Chờ duyệt</h6>
                                    <h5>0</h5>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-money-bill fa-2x text-success mb-2"></i>
                                    <h6>Chờ thanh toán</h6>
                                    <h5>0</h5>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-box fa-2x text-info mb-2"></i>
                                    <h6>Chờ đóng gói</h6>
                                    <h5>0</h5>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-truck fa-2x text-warning mb-2"></i>
                                    <h6>Chờ lấy hàng</h6>
                                    <h5>0</h5>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-shipping-fast fa-2x text-danger mb-2"></i>
                                    <h6>Đang giao hàng</h6>
                                    <h5>0</h5>
                                </div>
                                <div class="col-md-2 mb-3">
                                    <i class="fas fa-times-circle fa-2x text-secondary mb-2"></i>
                                    <h6>Hủy giao - chờ nhận</h6>
                                    <h5>0</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <span>TOP SẢN PHẨM</span>
                                    <div>
                                        <select class="form-select form-select-sm d-inline-block me-2"
                                                style="width: auto;">
                                            <option>7 ngày qua</option>
                                        </select>
                                        <select class="form-select form-select-sm d-inline-block"
                                                style="width: auto;">
                                            <option>...</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="bg-primary text-white rounded-circle me-3 p-2"
                                             style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                                            01
                                        </div>
                                        <div>
                                            <h6 class="mb-0">9999</h6>
                                            <small class="text-muted">123</small>
                                        </div>
                                        <div class="ms-auto">2</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <span>THÔNG TIN KHO</span>
                                    <select class="form-select form-select-sm" style="width: auto;">
                                        <option>Tất cả chi nhánh</option>
                                    </select>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div>
                                            <h6 class="mb-0">Sản phẩm dưới định mức</h6>
                                            <small class="text-muted">1</small>
                                        </div>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div>
                                            <h6 class="mb-0">Số tồn kho chi nhánh</h6>
                                            <small class="text-muted">12,117</small>
                                        </div>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-0">Giá trị tồn kho chi nhánh</h6>
                                            <small class="text-muted">12,092,766</small>
                                        </div>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders Section -->
            <div class="tab-pane fade" id="v-pills-orders" role="tabpanel" aria-labelledby="v-pills-orders-tab">
                <h1>Đơn hàng</h1>
                <p>Đây là nơi quản lý đơn hàng của bạn.</p>
            </div>

            <!-- Shipping Section -->
            <div class="tab-pane fade ms-5" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab"
                 style="width:1000px">
                <div class="product_hot mt-4">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" class="form-control"
                                       placeholder="Tìm kiếm theo tên danh mục">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="d-flex justify-content-end">
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Loại sản phẩm</option>
                                </select>
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Ngày tạo</option>
                                </select>
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Nhãn hiệu</option>
                                </select>
                                <button class="btn btn-outline-secondary me-2">Bộ lọc khác</button>
                                <button class="btn btn-outline-secondary">Lưu bộ lọc</button>
                            </div>
                        </div>
                    </div>
                </div>
                <h2>Danh sách danh mục</h2>
                <a href="/admin/addDanhMuc">
                    <button type="submit" class="btn btn-primary my-4">Thêm danh mục</button>
                </a>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã danh mục</th>
                        <th>Tên danh mục</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Ngày sửa</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listDanhMuc}" var="ldmuc" varStatus="c">
                        <tr>
                            <td>${c.count}</td>
                            <td>${ldmuc.ma_danh_muc}</td>
                            <td>${ldmuc.ten_danh_muc}</td>
                            <td>${ldmuc.trang_thai}</td>
                            <td>${ldmuc.ngay_tao}</td>
                            <td>${ldmuc.ngay_sua}</td>
                            <td>
                                <a href="/admin/detailDanhMuc/${ldmuc.id}">
                                    <button type="submit" class="btn btn-warning">Sửa</button>
                                </a>
                                <a href="/admin/deleteDanhMuc/${ldmuc.id}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có muốn xoá không')">Xoá</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="v-pills-productsDetail" role="tabpanel"
                 aria-labelledby="v-pills-productsDetail-tab">
                <div class="container-fluid mt-4">
                    <h1>Chi tiết sản phẩm</h1>
                    <div class="home mt-4">
                        <div class="product_hot">
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                        <input type="text" class="form-control"
                                               placeholder="Tìm kiếm theo tên sản phẩm">
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="d-flex justify-content-end">
                                        <select class="form-select me-2" style="width: auto;">
                                            <option>Loại sản phẩm</option>
                                        </select>
                                        <select class="form-select me-2" style="width: auto;">
                                            <option>Ngày tạo</option>
                                        </select>
                                        <select class="form-select me-2" style="width: auto;">
                                            <option>Nhãn hiệu</option>
                                        </select>
                                        <button class="btn btn-outline-secondary me-2">Bộ lọc khác</button>
                                        <button class="btn btn-outline-secondary">Lưu bộ lọc</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên sản phẩm</th>
                                <th>Tên màu</th>
                                <th>Tên size</th>
                                <th>Giá bán</th>
                                <th>Số lượng bán</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Ngày sửa</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listCTSP}" var="lctsp" varStatus="c">
                                <tr>
                                    <td>${c.count}</td>
                                    <td>${lctsp.sanPham.ten_san_pham}</td>
                                    <td>${lctsp.mauSac.ten_mau}</td>
                                    <td>${lctsp.size.ten_size}</td>
                                    <td>${lctsp.gia_ban}</td>
                                    <td>${lctsp.so_luong_ton}</td>
                                    <td>${lctsp.trang_thai}</td>
                                    <td>${lctsp.ngay_tao}</td>
                                    <td>${lctsp.ngay_sua}</td>
                                    <td>

                                        <a href="/admin/detailCTSP/${lctsp.id}">
                                            <button class="btn btn-warning">Sửa</button>
                                        </a>
                                        <a href="/admin/xoaCT/${lctsp.id}">
                                            <button class="btn btn-danger">Xóa</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <span>Hiển thị</span>
                                <select class="form-select d-inline-block mx-2" style="width: auto;">
                                    <option>20</option>
                                </select>
                                <span>kết quả</span>
                            </div>
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Trang trước</a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Trang sau</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Products Section -->
            <div class="tab-pane fade" id="v-pills-products" role="tabpanel" aria-labelledby="v-pills-products-tab">
                <div class="container-fluid mt-4">
                    <h1>Sản phẩm</h1>
                    <div class="container container-fluid mt-3">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light menusp">
                            <div class="container-fluid">
                                <ul class="navbar-nav ">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-file-export"></i> Xuất
                                            file</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#"><i class="fas fa-file-import"></i> Nhập
                                            file</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Loại sản phẩm</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Combo</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Sản phẩm quy đổi</a>
                                    </li>
                                </ul>
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">+
                                    Thêm sản phẩm
                                </button>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm nè</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/admin/add" method="post">
                                                    <div class="mb-3">
                                                        <label class="form-label">Mã</label>
                                                        <input type="text" class="form-control"
                                                               name="ma_san_pham" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Tên</label>
                                                        <input type="text" class="form-control"
                                                               name="ten_san_pham" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Ngày tạo</label>
                                                        <input type="date" class="form-control" required
                                                               name="ngay_tao">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Ngày sửa</label>
                                                        <input type="date" class="form-control" required
                                                               name="ngay_sua">
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
                                                        <label for="productCategory" class="form-label">Danh mục</label>
                                                        <select class="form-select" id="productCategory" required
                                                                name="danhMuc">
                                                            <option value="">Chọn danh mục</option>
                                                            <c:forEach items="${listDanhMuc}" var="l">
                                                                <option value="${l.id}">${l.ten_danh_muc}</option>
                                                            </c:forEach>

                                                        </select>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-bs-dismiss="modal">Đóng
                                                        </button>
                                                        <button type="submit" class="btn btn-primary">Thêm</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </nav>

                    </div>
                    <div class="home mt-4">
                        <nav>
                            <div class="nav nav-tabs mb-4" id="nav-tab" role="tablist">
                                <button class="nav-link nav-links active px-5" id="nav-home-tab"
                                        data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab"
                                        aria-controls="nav-home" aria-selected="true">Tất cả sản phẩm
                                </button>
                                <button class="nav-link nav-links px-5" id="nav-profile-tab" data-bs-toggle="tab"
                                        data-bs-target="#nav-profile" type="button" role="tab"
                                        aria-controls="nav-profile" aria-selected="false">Thuộc tính
                                </button>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                 aria-labelledby="nav-home-tab" tabindex="0">
                                <div class="product_hot">
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                                <input type="text" class="form-control"
                                                       placeholder="Tìm kiếm theo tên sản phẩm">
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="d-flex justify-content-end">
                                                <select class="form-select me-2" style="width: auto;">
                                                    <option>Loại sản phẩm</option>
                                                </select>
                                                <select class="form-select me-2" style="width: auto;">
                                                    <option>Ngày tạo</option>
                                                </select>
                                                <select class="form-select me-2" style="width: auto;">
                                                    <option>Nhãn hiệu</option>
                                                </select>
                                                <button class="btn btn-outline-secondary me-2">Bộ lọc khác</button>
                                                <button class="btn btn-outline-secondary">Lưu bộ lọc</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày tạo</th>
                                        <th>Ngày sửa</th>
                                        <th>Danh mục</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listSanPham}" var="lsp" varStatus="c">
                                        <tr>
                                            <td>${c.count}</td>
                                            <td>${lsp.ma_san_pham}</td>
                                            <td>${lsp.ten_san_pham}</td>
                                            <td>${lsp.trang_thai}</td>
                                            <td>${lsp.ngay_tao}</td>
                                            <td>${lsp.ngay_sua}</td>
                                            <td>${lsp.danhMuc.ten_danh_muc}</td>
                                            <td>
                                                    <%--                                   Thêm thuộc tính--%>
                                                    <%--                                                <form action="/admin/addCTSP/" method="post">--%>
                                                    <%--                                                    <input type="hidden" name="idSanPham" value="${lsp.id}">--%>
                                                    <%--                                                    <button class="btn btn-success" type="button"--%>
                                                    <%--                                                            onclick="document.getElementById('maSP').value='${lsp.id}'"--%>
                                                    <%--                                                            data-bs-toggle="modal"--%>
                                                    <%--                                                            data-bs-target="#modal1">--%>
                                                    <%--                                                        Thêm thuộc tính--%>
                                                    <%--                                                    </button>--%>
                                                    <%--                                                </form>--%>
                                                    <%--                                                <div class="modal fade" id="modal1" tabindex="-1"--%>
                                                    <%--                                                     aria-labelledby="modal1Label" aria-hidden="false">--%>
                                                    <%--                                                    <div class="modal-dialog">--%>
                                                    <%--                                                        <div class="modal-content">--%>
                                                    <%--                                                            <div class="modal-header">--%>
                                                    <%--                                                                <h5 class="modal-title" id="modal1Label">Thêm thuộc tính--%>
                                                    <%--                                                                    nè</h5>--%>
                                                    <%--                                                                <button type="button" class="btn-close"--%>
                                                    <%--                                                                        data-bs-dismiss="modal"--%>
                                                    <%--                                                                        aria-label="Close"></button>--%>
                                                    <%--                                                            </div>--%>
                                                    <%--                                                            <div class="modal-body">--%>
                                                    <%--                                                                <form action="/admin/addCTSP/" method="post">--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Mã sản phẩm</label>--%>
                                                    <%--                                                                        <input type="text" class="form-control"--%>
                                                    <%--                                                                               name="ctspID" id="maSP" required--%>
                                                    <%--                                                                               disabled>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Màu sắc</label>--%>
                                                    <%--                                                                        <select class="form-select" required--%>
                                                    <%--                                                                                name="mauSac">--%>
                                                    <%--                                                                            <option value="">Chọn màu sắc</option>--%>
                                                    <%--                                                                            <c:forEach items="${listMauSac}" var="lms">--%>
                                                    <%--                                                                                <option value="${lms.id}">${lms.ten_mau}</option>--%>
                                                    <%--                                                                            </c:forEach>--%>

                                                    <%--                                                                        </select>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Size</label>--%>
                                                    <%--                                                                        <select class="form-select" required--%>
                                                    <%--                                                                                name="size">--%>
                                                    <%--                                                                            <option value="">Chọn size</option>--%>
                                                    <%--                                                                            <c:forEach items="${listSize}" var="ls">--%>
                                                    <%--                                                                                <option value="${ls.id}">${ls.ten_size}</option>--%>
                                                    <%--                                                                            </c:forEach>--%>

                                                    <%--                                                                        </select>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Giá bán</label>--%>
                                                    <%--                                                                        <input type="number" class="form-control"--%>
                                                    <%--                                                                               required--%>
                                                    <%--                                                                               name="gia_ban">--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Số lượng tồn</label>--%>
                                                    <%--                                                                        <input type="number" class="form-control"--%>
                                                    <%--                                                                               required--%>
                                                    <%--                                                                               name="so_luong_ton">--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Ngày tạo</label>--%>
                                                    <%--                                                                        <input type="date" class="form-control" required--%>
                                                    <%--                                                                               name="ngay_tao">--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="mb-3">--%>
                                                    <%--                                                                        <label class="form-label">Ngày sửa</label>--%>
                                                    <%--                                                                        <input type="date" class="form-control" required--%>
                                                    <%--                                                                               name="ngay_sua">--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class=" mb-3">--%>
                                                    <%--                                                                        <label class="form-check-label">--%>
                                                    <%--                                                                            Trạng thái--%>
                                                    <%--                                                                        </label>--%>
                                                    <%--                                                                        <div class="form-check">--%>
                                                    <%--                                                                            <input class="form-check-input" type="radio"--%>
                                                    <%--                                                                                   name="trang_thai" value="active">--%>
                                                    <%--                                                                            <label class="form-check-label">--%>
                                                    <%--                                                                                Active--%>
                                                    <%--                                                                            </label>--%>
                                                    <%--                                                                        </div>--%>
                                                    <%--                                                                        <div class="form-check">--%>
                                                    <%--                                                                            <input class="form-check-input" type="radio"--%>
                                                    <%--                                                                                   name="trang_thai" value="inactive">--%>
                                                    <%--                                                                            <label class="form-check-label">--%>
                                                    <%--                                                                                Inactive--%>
                                                    <%--                                                                            </label>--%>
                                                    <%--                                                                        </div>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                    <div class="modal-footer">--%>
                                                    <%--                                                                        <button type="button" class="btn btn-secondary"--%>
                                                    <%--                                                                                data-bs-dismiss="modal">Đóng--%>
                                                    <%--                                                                        </button>--%>
                                                    <%--                                                                        <button type="submit" class="btn btn-primary">--%>
                                                    <%--                                                                            Thêm--%>
                                                    <%--                                                                        </button>--%>
                                                    <%--                                                                    </div>--%>
                                                    <%--                                                                </form>--%>
                                                    <%--                                                            </div>--%>

                                                    <%--                                                        </div>--%>
                                                    <%--                                                    </div>--%>
                                                    <%--                                                </div>--%>


                                                <form action="/admin/addCTSP/" method="post">
                                                    <input type="hidden" name="idSanPham" value="${lsp.id}">
                                                    <button class="btn btn-success" type="button"
                                                            onclick="document.getElementById('maSP').value='${lsp.id}'"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#modal1">
                                                        Thêm thuộc tính
                                                    </button>
                                                </form>
                                                <div class="modal fade" id="modal1" tabindex="-1"
                                                     aria-labelledby="modal1Label" aria-hidden="false">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="modal1Label">Thêm thuộc tính
                                                                    nè</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="/admin/addCTSP/" method="post">
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Mã sản phẩm</label>
                                                                        <input type="text" class="form-control"
                                                                               name="ctspID" id="maSP" required
                                                                        >
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Màu sắc</label>
                                                                        <select class="form-select" required
                                                                                name="mauSac">
                                                                            <option value="">Chọn màu sắc</option>
                                                                            <c:forEach items="${listMauSac}" var="l">
                                                                                <option value="${l.id}">${l.ten_mau}</option>
                                                                            </c:forEach>

                                                                        </select>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Size</label>
                                                                        <select class="form-select" required
                                                                                name="size">
                                                                            <option value="">Chọn size</option>
                                                                            <c:forEach items="${listSize}" var="l">
                                                                                <option value="${l.id}">${l.ten_size}</option>
                                                                            </c:forEach>

                                                                        </select>
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Giá bán</label>
                                                                        <input type="number" class="form-control"
                                                                               required
                                                                               name="gia_ban">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Số lượng tồn</label>
                                                                        <input type="number" class="form-control" min="1"
                                                                               required
                                                                               name="so_luong_ton">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Ngày tạo</label>
                                                                        <input type="date" class="form-control" required
                                                                               name="ngay_tao">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label class="form-label">Ngày sửa</label>
                                                                        <input type="date" class="form-control" required
                                                                               name="ngay_sua">
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
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-primary">
                                                                            Thêm
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="/admin/detail/${lsp.id}">
                                                    <button type="submit" class="btn btn-warning">Sửa</button>
                                                </a>
                                                <a href="/admin/xoa/${lsp.id}">
                                                    <button class="btn btn-danger">Xóa</button>
                                                </a>
                                                <a href="/admin/ctsp/${lsp.id}">
                                                    <button class="btn btn-danger">Cụ thể</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <span>Hiển thị</span>
                                        <select class="form-select d-inline-block mx-2" style="width: auto;">
                                            <option>20</option>
                                        </select>
                                        <span>kết quả</span>
                                    </div>
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="#">Trang trước</a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Trang sau</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                 aria-labelledby="nav-profile-tab" tabindex="0">

                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <!-- Customers Section -->
            <div class="tab-pane fade ms-5" id="v-pills-customers" role="tabpanel" aria-labelledby="v-pills-customers-tab"
                 style="width:1000px">
                <div class="product_hot mt-5">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" class="form-control"
                                       placeholder="Tìm kiếm theo tên hoặc số điện thoại">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="d-flex justify-content-end">
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Loại sản phẩm</option>
                                </select>
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Ngày tạo</option>
                                </select>
                                <select class="form-select me-2" style="width: auto;">
                                    <option>Nhãn hiệu</option>
                                </select>
                                <button class="btn btn-outline-secondary me-2">Bộ lọc khác</button>
                                <button class="btn btn-outline-secondary">Lưu bộ lọc</button>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="/admin/addKH">
                    <button type="submit" class="btn btn-primary my-2">Thêm khách hàng</button>
                </a>
                <h1>Danh sách hách hàng</h1>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Họ tên</th>
                        <th>Địa chỉ</th>
                        <th>Số điện thoại</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Ngày sửa</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listKhachHang}" var="lkHang" varStatus="c">
                        <tr>
                            <td>${c.count}</td>
                            <td>${lkHang.ho_ten}</td>
                            <td>${lkHang.dia_chi}</td>
                            <td>${lkHang.sdt}</td>
                            <td>${lkHang.trang_thai}</td>
                            <td>${lkHang.ngay_tao}</td>
                            <td>${lkHang.ngay_sua}</td>
                            <td>
                                <a href="/admin/detailKH/${lkHang.id}">
                                    <button type="submit" class="btn btn-warning">Sửa</button>
                                </a>
                                <a href="/admin/deleteKH/${lkHang.id}">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có muốn xoá không')">Xoá</button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
<%--            <div class="tab-pane fade" id="v-pills-sells" role="tabpanel"--%>
<%--                 aria-labelledby="v-pills-sells-tab">--%>
<%--                <div class="container-fluid" style="width: 1000px;">--%>
<%--                    <div class="row header">--%>
<%--                        <div class="col-6 d-flex align-items-center">--%>
<%--                            <input type="text" class="form-control search-input" placeholder="Thêm sản phẩm vào đơn">--%>
<%--                            <select class="form-select" style="width: 100px;">--%>
<%--                                <option>(F10)</option>--%>
<%--                            </select>--%>
<%--                            <div class="order-tabs me-3 ms-3" style="width: 200px;">--%>
<%--                                <button class="add-order-btn">+ Thêm hoá đơn</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-6 text-end">--%>
<%--                            <i class="fas fa-wifi ms-2"></i>--%>
<%--                            <i class="fas fa-home ms-2"></i>--%>
<%--                            <i class="fas fa-user ms-2"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="row mt-3">--%>
<%--                        <div class="col-8">--%>
<%--                            <div class="main-content" style="height: 500px">--%>
<%--                                <h3>Hoá đơn</h3>--%>
<%--                                <div style="max-height: 150px; overflow-y:auto">--%>
<%--                                    <table class="table table-hover">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>#</th>--%>
<%--                                            <th>Mã hoá đơn</th>--%>
<%--                                            <th>Tên khách hàng</th>--%>
<%--                                            <th>Ngày tạo</th>--%>
<%--                                            <th>Trạng thái</th>--%>
<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>
<%--                                        <c:forEach items="${listHoaDon}" var="lhd" varStatus="c">--%>
<%--                                            <tr onclick="location.href='/admin/detailHD/${lhd.id}'">--%>
<%--                                                <td>${c.count}</td>--%>
<%--                                                <td>${lhd.id}</td>--%>
<%--                                                <td>${lhd.ho_ten}</td>--%>
<%--                                                <td>${lhd.ngay_tao}</td>--%>
<%--                                                <td>${lhd.trang_thai}</td>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </div>--%>
<%--                                <hr>--%>
<%--                                <h3>Chi tiết hoá đơn</h3>--%>
<%--                                <div style="max-height: 150px; overflow-y:auto">--%>
<%--                                    <table class="table" id="invoiceDetailTable">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>Sản phẩm</th>--%>
<%--                                            <th>Số lượng</th>--%>
<%--                                            <th>Đơn giá</th>--%>
<%--                                            <th>Thành tiền</th>--%>
<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>
<%--                                        <c:forEach items="${listHDCTTheoHD}" var="lstHdct" varStatus="c">--%>
<%--                                            <tr >--%>
<%--                                                    &lt;%&ndash;<td>${c.count}</td>&ndash;%&gt;--%>
<%--                                                <td>${lstHdct.ten_san_pham}</td>--%>
<%--                                                <td>${lstHdct.so_luong_mua}</td>--%>
<%--                                                <td>${lstHdct.gia_ban}</td>--%>
<%--                                                <td>${lstHdct.tong_tien}</td>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-4">--%>
<%--                            <div class="main-content">--%>
<%--                                <div class="sidebar-section">--%>
<%--                                    <h5>Tổng tiền: (0 sản phẩm)</h5>--%>
<%--                                    <input type="number" name=""--%>
<%--                                           style="outline: none;border: none; border-bottom: 1px solid black;">--%>
<%--                                </div>--%>
<%--                                <div class="sidebar-section">--%>
<%--                                    <h5>KHÁCH PHẢI TRẢ</h5>--%>
<%--                                    <input type="number" name=""--%>
<%--                                           style="color: #0056b3;outline: none;border: none; border-bottom: 1px solid black;">--%>
<%--                                </div>--%>
<%--                                <div class="sidebar-section">--%>
<%--                                    <h5>Tiền khách đưa (F2)</h5>--%>
<%--                                    <input type="number" name=""--%>
<%--                                           style="outline: none;border: none; border-bottom: 1px solid black;">--%>
<%--                                </div>--%>
<%--                                <div class="sidebar-section">--%>
<%--                                    <h5>Tiền thừa trả khách</h5>--%>
<%--                                    <input type="number" name="" id=""--%>
<%--                                           style="outline: none;border: none; border-bottom: 1px solid black;">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <button class="pay-button">THANH TOÁN (F1)</button>--%>
<%--                            <div class="text-center">--%>
<%--                                <span class="text-muted">Hotline hỗ trợ: 1900 6750</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="row mt-3">--%>
<%--                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">--%>
<%--                            <li class="nav-item" role="presentation">--%>
<%--                                <button class="nav-link active" id="pills-profile-tab" data-bs-toggle="pill"--%>
<%--                                        data-bs-target="#pills-profile" type="button" role="tab"--%>
<%--                                        aria-controls="pills-profile"--%>
<%--                                        aria-selected="false">Danh sách sản phẩm--%>
<%--                                </button>--%>
<%--                            </li>--%>
<%--                            <li class="nav-item" role="presentation">--%>
<%--                                <button class="nav-link" id="pills-home-tab" data-bs-toggle="pill"--%>
<%--                                        data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"--%>
<%--                                        aria-selected="true">Thao tác nhanh--%>
<%--                                </button>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                        <div class="tab-content" id="pills-tabContent">--%>
<%--                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel"--%>
<%--                                 aria-labelledby="pills-home-tab"--%>
<%--                                 tabindex="0">--%>
<%--                                <div class="action-buttons">--%>
<%--                                    <button class="btn">Thêm dịch vụ (F9)</button>--%>
<%--                                    <button class="btn">Chiết khấu đơn (F6)</button>--%>
<%--                                    <button class="btn">Khuyến mãi (F8)</button>--%>
<%--                                    <button class="btn">Đổi quà</button>--%>
<%--                                    <button class="btn">Thiết lập chung</button>--%>
<%--                                    <button class="btn">Đổi giá bán hàng</button>--%>
<%--                                    <button class="btn">Thông tin khách hàng</button>--%>
<%--                                    <button class="btn">Xóa toàn bộ sản phẩm</button>--%>
<%--                                    <button class="btn">Đổi trả hàng</button>--%>
<%--                                    <button class="btn">Xem danh sách đơn hàng</button>--%>
<%--                                    <button class="btn">Xem báo cáo</button>--%>
<%--                                    <button class="btn">Tất cả thao tác</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="tab-pane fade" id="pills-profile" role="tabpanel"--%>
<%--                                 aria-labelledby="pills-profile-tab"--%>
<%--                                 tabindex="0">--%>
<%--                                <div style="max-height: 200px; overflow-y: auto;">--%>
<%--                                    <table class="table table-hover">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>#</th>--%>
<%--                                            <th>Tên sản phẩm</th>--%>
<%--                                            <th>Tên màu</th>--%>
<%--                                            <th>Tên size</th>--%>
<%--                                            <th>Giá bán</th>--%>
<%--                                            <th>Số lượng bán</th>--%>
<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody>--%>
<%--                                        <c:forEach items="${listSPBanHang}" var="lspbh" varStatus="c">--%>
<%--                                            <tr>--%>
<%--                                                <td>${c.count}</td>--%>
<%--                                                <td>${lspbh.ten_san_pham}</td>--%>
<%--                                                <td>${lspbh.ten_mau}</td>--%>
<%--                                                <td>${lspbh.ten_size}</td>--%>
<%--                                                <td>${lspbh.gia_ban}</td>--%>
<%--                                                <td>${lspbh.so_luong_ton}</td>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>
<%--                                        </tbody>--%>
<%--                                    </table>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>

<%--                    </div>--%>


<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>

</html>