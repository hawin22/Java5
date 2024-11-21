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
<div>
    <div class="input-group" style="width:800px; margin-left:400px">
        <span class="input-group-text"><i class="fas fa-search"></i></span>
        <input type="text" class="form-control" name="idQLHD"
               placeholder="Tìm kiếm theo id hoá đơn">
    </div>
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
                    <a class="nav-link" id="products-tab" data-bs-toggle="collapse" href="#accordionContainer"
                       role="button"
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
                        <i class="fa-duotone fa-solid fa-cash-register"></i> Bán hàng
                    </a>

                </li>
                <li class="nav-item">
                    <a class="nav-link active" id="v-pills-carts-tab" data-bs-toggle="pill" href="#v-pills-bills"
                       role="tab" aria-controls="v-pills-carts" aria-selected="false">
                        <i class="bi bi-bag-check-fill"></i> Quản lý hoá đơn
                    </a>

                </li>

            </ul>
        </nav>

        <div class="tab-pane fade ms-5 mt-5 show" id="v-pills-bills" role="tabpanel" aria-labelledby="v-pills-bills-tab"
             style="width:1000px">
            <div class="main-content" style="height: 800px">
                <h3>Hoá đơn</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã hoá đơn</th>
                        <th>Tên khách hàng</th>
                        <th>Ngày tạo</th>
                        <th>Trạng thái</th>
                        <th>Tổng tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listQLHD}" var="lhd" varStatus="c">
                        <tr>
                            <td>${c.count}</td>
                            <td>${lhd.id}</td>
                            <td>${lhd.ho_ten}</td>
                            <td>${lhd.ngay_tao}</td>
                            <td>${lhd.trang_thai}</td>
                            <td>${lhd.tongTien}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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