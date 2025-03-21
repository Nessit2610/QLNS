<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.slideFull {
	position: relative;
    width: 30%; /* Chiều rộng ban đầu của thẻ div */
    overflow: hidden;
    transition: width 0.5s; /* Animation chuyển động */
    background-color: #eceff8;
}

.slideFull.active {
    width: 100%; /* Khi kích hoạt, thẻ div sẽ mở rộng */
  }
  
.nav {
    list-style: none;
    padding: 0;
    margin: 0;
}

.nav li {
    display: none;
}

.nav li a{
   	color: #000 !important;
}

.nav li a:hover{
   	text-decoration: underline;
}

.icons {
    display: flex;
    flex-direction: column; /* Hiển thị các icon trên cùng một hàng dọc */
    align-items: flex-start; /* Căn các icon sang trái */
    padding: 0 36px;
}

.icons i {
    font-size: 24px;
    margin-top: 40px;
    color: #000;
}

.slideFull.active .icons {
    display: none; /* Ẩn các icon khi ở full size */
}

.slideFull.active .nav li {
    display: block; /* Hiển thị danh sách li khi ở full size */
    margin-top: 30px;
}

.menu-icon {
  cursor: pointer;
  color: #000;
  padding: 10px;
}
</style>
</head>
<body>
	<div style="position: fixed; top: 0; left: 0; height: 100%; z-index:2;" class="d-flex">
        <div class="justify-content-start slideFull" id="menuContent">
        	<a href="index">
				<img style="margin-top: 12px; height: 70px;width: 197px;" alt="" src="assets/imgs/Logomenu.png">
			</a>
            <div class="icons">
                <a href="ThongSoController"><i class="fas fa-cogs"></i></a>
                <a href="adminNhanVienController"><i class="fas fa-user"></i></a>
                <a href="adminDangKyNghiController"><i class="fas fa-calendar-alt"></i></a>
                <a href="adminLoaiCaController"><i class="fas fa-clock"></i></a>
                <a href="adminThongKeLuongController"><i class="fas fa-chart-bar"></i></a>
                <a href="adminDangKyLamController"><i class="fas fa-calendar-check"></i></a>
            </div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="ThongSoController">Thông Số Kỹ Thuật</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminNhanVienController">Thông Tin Nhân Viên</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDangKyNghiController">Bảng Đăng Ký Nghỉ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminLoaiCaController">Phân Loại Ca Làm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminThongKeLuongController">Bảng Thống Kê Lương</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDangKyLamController">Bảng Đăng Ký Lịch Làm</a>
                </li>
                
            </ul>
        </div>
        <div style="background-color: #eceff8; box-shadow: 7px 0 15px rgba(0, 0, 0, 0.1);" class="menu-icon" onclick="toggleSize()">
            <i style="margin-top: 28px;" class="fas fa-bars"></i>
        </div>
    </div>
</body>

<script type="text/javascript">
function toggleSize() {
    const container = document.querySelector('.slideFull');
    container.classList.toggle('active');
}

</script>
</html>