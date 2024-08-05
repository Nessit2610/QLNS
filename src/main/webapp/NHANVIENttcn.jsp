<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style type="text/css">
input {
	border : none;
	text-align: center;
}
input:focus-visible {
	outline : none;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex align-items-center">
		<div class="col-2  mt-5">
			<jsp:include page="Slidebar.jsp"></jsp:include>
		</div>
		<div style="margin-left: 260px;">
			<h1>ALOOOOOOOOOOOOOOOOO</h1>
			<%
		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");	
	
		String name = nhanvien.getTenNV();
		String gioiTinh = nhanvien.getGioiTinh().toString();
		String ngaySinh = nhanvien.getNgaySinh().toString();
		String email = nhanvien.getEmail();
		String soDienThoai = nhanvien.getsDT();
		String maCV = nhanvien.getMaCV();
		String dVCT = nhanvien.getdVCT();
		String chucDanh = nhanvien.getChucDanh();
		String username = nhanvien.getTenDangNhap();
	%>
	
	<div class="mx-4 mt-4">
		<div class="container">
			<div class="col-lg-9">
				<form action="thongtincanhan" method="post">
					    <div class="mb-3 row">		
							    <label for="hovaten" class="col-sm-2 col-form-label"><span class="required">*</span>Họ và tên:</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="hovaten" value="<%=name%>" name="name" required="required">
							    </div>
					    </div>
					    <div class="mb-3">
						   
						   
						</div>
					    <div class="mb-3 row">
							    <label for="gioitinh" class="col-sm-2 col-form-label">Giới tính:</label>
							    <div class="col-sm-10">
							       <select class="form-select" id="gioitinh" aria-label="Default select example" name="gioitinh" >
									  <option <%=gioiTinh.equals("")?"selected='selected'":"" %>>Chọn giới tính</option>
									  <option value="1" <%=(gioiTinh.equals("true"))?"selected='selected'":"" %>>Nam</option>
									  <option value="2" <%=(gioiTinh.equals("false"))?"selected='selected'":"" %>>Nữ</option>
									</select>
							    </div>
					    </div>
					    <div class="mb-3 row">
							    <label for="ngaysinh" class="col-sm-2 col-form-label">Ngày sinh:</label>
							    <div class="col-sm-10">
							      <input type="date" class="form-control" id="ngaysinh" value="<%=ngaySinh%>" name="ngaysinh">
							    </div>
					    </div>
					    <div class="mb-3 row">
							    <label for="email" class="col-sm-2 col-form-label"><span class="required">*</span>Email:</label>
							    <div class="col-sm-10">
							      <input type="email" class="form-control" id="email" value="<%=email%>" name="email" required="required">
							    </div>
					    </div>		    
					    <div class="mb-3 row">
							    <label for="sodienthoai" class="col-sm-2 col-form-label"><span class="required">*</span>Số điện thoại:</label>
							    <div class="col-sm-10">
							      <input type="number" class="form-control" id="sodienthoai" value="<%=soDienThoai%>" name="phonenumber" required="required">
							    </div>
					    </div> 
					    <div class="mb-3 row">
							    <label for="usename-register" class="col-sm-2 col-form-label">Tên đăng nhập:</label>
							    <div class="col-sm-10">
							      <input type="text" readonly class="form-control-plaintext" id="usename-register" value="<%=username%>" name="username-register">
							    </div>
					    </div>   
					    <div class="mb-3 row">
							    <label for="diachikhachhang" class="col-sm-2 col-form-label"><span class="required">*</span>Mã chức vụ:</label>
							    <div class="col-sm-10">
							      <input type="text" readonly class="form-control-plaintext" id="diachikhachhang" value="<%=maCV%>" name="macv" required="required">
							    </div>
					    </div>
					    <div class="mb-3 row">
							    <label for="diachinhanhang" class="col-sm-2 col-form-label">Đơn vị công tác:</label>
							    <div class="col-sm-10">
							      <input style="user-select: none;" type="text" readonly class="form-control-plaintext" id="diachinhanhang" value="<%=dVCT%>" name="dvct">
							    </div>
					    </div>
						<div class="">
						        <a href="index" class="btn btn-secondary">Trang chủ</a>
						        <button type="submit" id="submit" class="btn btn-primary " name="action" value="changeinformationuser">Lưu</button>
						</div>
				</form>
			</div>
		</div>
	</div>
		</div>
	</div>	
</body>
</html>