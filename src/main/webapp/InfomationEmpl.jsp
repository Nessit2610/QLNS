<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Account</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="assets/css/infoCSS.css">
	
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<%
			String msgSuccess = (request.getAttribute("msgSuccess")!=null)?request.getAttribute("msgSuccess").toString():"";
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");	
			String anh = nhanvien.getAnh();
			String name = nhanvien.getTenNV();
			String maCV = nhanvien.getMaCV();
			String ngaySinh = nhanvien.getNgaySinh().toString();
			boolean gioiTinh = nhanvien.getGioiTinh();
			String email = nhanvien.getEmail();
			String soDienThoai = nhanvien.getsDT();
			String dVCT = nhanvien.getdVCT();
			String chucDanh = nhanvien.getChucDanh();
			boolean trangThaiCongViec = nhanvien.getTrangThaiCongViec();
			Date ngayVaolam = nhanvien.getNgayVaoLam();
			Date ngayKetThuc = nhanvien.getNgayKetThuc();
			String soTaiKhoan = nhanvien.getSoTaiKhoan();
			String username = nhanvien.getTenDangNhap();
			
			String chucVu = "";
			if(maCV.equals("CV001")){
				chucVu = "Admin";
			}else if(maCV.equals("CV002")){
				chucVu = "Quản lý";
			}else if(maCV.equals("CV003")){
				chucVu = "Nhân viên";
			}
			 // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // Chuyển đổi thành đối tượng LocalDate
	        LocalDate date = LocalDate.parse(ngayVaolam.toString(), formatter);

	        // Định dạng lại thành "dd/MM/yyyy"
	        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	%>
	<div class="d-flex" style="margin-top: 52px;">
		<div class="col-2 mt-5">
			<%
			if(nhanvien.getMaCV().equals("CV001")){
				%><jsp:include page="adminSlidebar.jsp"></jsp:include><%
			}else if(nhanvien.getMaCV().equals("CV002")){
				%><jsp:include page="QUANLYslidebar.jsp"></jsp:include><%
			}else if(nhanvien.getMaCV().equals("CV003")){
				%><jsp:include page="Slidebar.jsp"></jsp:include><%
			}
			%>
		</div>
		<div class="main-content">
       
	        <!-- Header -->
	        <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 200px; background-size: cover; background-position: center top;">
	            <!-- Mask -->
	            <span class="mask opacity-8"></span>
	            <!-- Header container -->
	            <div class="container-fluid d-flex align-items-center">
	                <div class="row">
	                    <div class="col-lg-7 col-md-10">
	
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Page content -->
	        <div class="container-fluid mt--7">
	            <div class="row">
	                <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
	                    <div class="card card-profile shadow">
	                        <div class="row justify-content-center">
	                            <div class="col-lg-3 order-lg-2">
	                                <div class="card-profile-image">
	                                    <a href="#">
	                                    	<img style="box-shadow: 6px 7px 10px 0px rgba(0, 0, 0, 0.1) !important;" class="rounded-circle" alt="" src="<%=anh%>">
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
	                        </div>
	                        <div class="card-body pt-0 pt-md-4">
	                            <div class="row">
	                                <div class="col">
	                                    <div class="card-profile-stats d-flex justify-content-center mt-md-5">
	
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="text-center">
	
	                                <h3>
	                                    <%=name%>
	                                </h3>
	                                <div class="h5 font-weight-300">
	                                    <i class="ni location_pin mr-2"></i><%=chucVu%>
	                                </div>
	                                <div class="h5 mt-4">
	                                    <i class="ni business_briefcase-24 mr-2"></i><%=email%>
	                                </div>
	                                <div>
	                                    <i class="ni education_hat mr-2"></i><%=trangThaiCongViec==true?"Đang hoạt động":"Ngưng hoạt động"%>
	                                </div>
	                                <hr class="my-4">
	                                <p><%=dVCT%></p>
	                                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModalDoiMk">
									  Đổi mật khẩu
									</button>
	
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-xl-8 order-xl-1">
	                    <div class="card bg-color shadow">
	                        <div class="card-header bg-white border-0">
	                            <div class="row align-items-center">
	                                <div class="col-8">
	                                    <h3 class="mb-0">My account</h3>
	                                </div>
	                                <button style="width: 150px; color: #fff;" type="button" class="btn btn-info col-4 text-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
									  Edit Profile
									</button>
	                            </div>
	                        </div>
	                        <div class="card-body">
	                                <h6 class="heading-small text-muted mb-4">User information</h6>
	                                <div class="pl-lg-4">
	                                    <div class="row">
	                                        <div class="col-lg-6">
	                                            <div class="form-group focused">
	                                                <label class="form-control-label" for="input-username">Họ và tên</label>
	                                                <input type="text" id="input-username" class="form-control form-control-alternative" id="hovaten" value="<%=name%>" name="name" readonly>
	                                                
	                                            </div>
	                                        </div>
	                                        <div class="col-lg-6">
	                                            <div class="form-group">
	                                                <label class="form-control-label" for="input-email">Email</label>
	                                                <input type="email" id="input-email" class="form-control form-control-alternative" id="email" value="<%=email%>" name="email" readonly>
	                                                
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-lg-6">
	                                            <div class="form-group focused">
	                                                <label class="form-control-label" for="input-first-name">Giới tính</label>
	                                                <input type="text" class="form-control form-control-alternative" id="gioitinh" value="<%=gioiTinh==true?"Nam":"Nữ"%>" readonly>
	                                            </div>
	                                        </div>
	                                        <div class="col-lg-6">
	                                            <div class="form-group focused">
	                                                <label class="form-control-label" for="input-last-name">Số điện thoại</label>
	                                                <input type="number" class="form-control form-control-alternative" id="sodienthoai" value="<%=soDienThoai%>" name="phonenumber" readonly>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <hr class="my-4">
	                                <!-- Address -->
	                                <h6 class="heading-small text-muted mb-4">Thông tin công tác</h6>
	                                <div class="pl-lg-4">
	                                    <div class="row">
	                                        <div class="col-md-12">
	                                            <div class="form-group focused">
	                                                <label class="form-control-label" for="input-address">Đơn vị công tác</label>
	                                                <input type="text" class="form-control form-control-alternative" id="donvicongtac" value="<%=dVCT%>" name="dvct" readonly>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-lg-4">
	                                            <div class="form-group focused">
	                                                <label class="form-control-label" for="input-city">Chức danh</label>
	                                                <input type="text" class="form-control form-control-alternative" id="chucdanh" value="<%=chucDanh%>" name="chucdanh" readonly>
	                                            </div>
	                                        </div>
	                                        <div class="col-lg-4 ">
	                                            <div class="form-group focused ">
	                                                <label class="form-control-label " for="input-country ">Ngày vào làm</label>
	                                                <input type="text"  class="form-control form-control-alternative " id="ngayvaolam" value="<%=formattedDate%>" readonly>
	                                            </div>
	                                        </div>
	                                        <div class="col-lg-4 ">
	                                            <div class="form-group ">
	                                                <label class="form-control-label " for="input-country ">Số tài khoản ngân hàng</label>
	                                                <input type="text"  class="form-control form-control-alternative" id="sotaikhoan" value="<%=soTaiKhoan%>" readonly>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <hr class="my-4 ">
	                                <!-- Description -->
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalDoiMk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<form action="nhanvien?action=changerpass" method="post">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Đổi mật khẩu</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="mb-3 row">
					    <label for="password" class="col-sm-4 col-form-label">Mật khẩu cũ:</label>
					    <div class="col-sm-8 ">
					      <input type="password" class="form-control" id="password" name="matkhaucu" required="required" >
					    </div>
			    </div>   
			    <span id="msg" style="color: red;"></span>
			    <div class="mb-3 row">
					    <label for="newpassword" class="col-sm-4 col-form-label">Mật khẩu mới:</label>
					    <div class="col-sm-8">
					      <input type="password" class="form-control" id="newpassword" name="matkhaumoi" required="required" onkeyup="kiemTraMatKhau()">
					    </div>
			    </div>   
			    <div class="mb-3 row">
					    <label for="renewpassword" class="col-sm-4 col-form-label">Nhập lại mật khẩu:</label>
					    <div class="col-sm-8">
					      <input type="password" class="form-control" id="renewpassword" name="matkhaumoi2" required="required" onkeyup="kiemTraMatKhau()">
					    </div>
			    </div>   
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		        <button type="submit" class="btn btn-primary" id="submit">Đổi mật khẩu</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>	
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			       <form action="nhanvien?action=changerinf" method="post">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Chỉnh sửa thông tin cá nhân</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<div class="mb-3 row">
					    <div style="margin: auto; text-align: center;" class="col-sm-10">
					      <img style="width: 150px;height: 150px;border-radius: 50%;object-fit: cover;" alt="" src="<%=anh%>">
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="hovaten" class="col-sm-4 col-form-label">Họ và tên:</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control-plaintext" id="hovaten" value="<%=name%>" name="name" readonly>
					    </div>
			    </div>
			    <div class="mb-3 row">
					    <label for="email" class="col-sm-4 col-form-label">Email:</label>
					    <div class="col-sm-8">
					      <input type="email" class="form-control" id="email" value="<%=email%>" name="email">
					    </div>
			    </div>		    
			    <div class="mb-3 row">
					    <label for="sodienthoai" class="col-sm-4 col-form-label">Số điện thoại:</label>
					    <div class="col-sm-8">
					      <input type="tel" class="form-control" id="sodienthoai" value="<%=soDienThoai%>" name="sdt">
					    </div>
			    </div> 
			    <div class="mb-3 row">
					    <label for="sotaikhoan" class="col-sm-4 col-form-label">Số tài khoản:</label>
					    <div class="col-sm-8">
					      <input type="tel" class="form-control" id="sotaikhoan" value="<%=soTaiKhoan%>" name="stk">
					    </div>
			    </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
			        <button type="submit" class="btn btn-primary">Lưu</button>
			      </div>
			       </form>
			    </div>
			  </div>
		</div>
			<!-- Modal Success-->
		<div class="modal fade" id="staticBackdropSuccess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      	<div class="modal-body">
		        	<div class="alert alert-success" role="alert">
		        		<span id="msgsuccess"></span>
					</div>			
				</div>
		      	<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<a href="index">		      		
		      			<button type="button" class="btn btn-success">Trang chủ</button>
			      	</a>
					
		      	</div>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	  // Lấy giá trị của các thuộc tính từ request.getAttribute
	  var msgSuccess = "<%=msgSuccess%>";
	  // Kiểm tra nếu một trong hai giá trị 
	 if(msgSuccess.length > 0){
		// Lấy tham chiếu đến modal
		    var modalLogin = document.getElementById("staticBackdropSuccess");

		    // Khởi tạo modal bằng Bootstrap JavaScript
		    var myModal = new bootstrap.Modal(modalLogin, {
		      backdrop: 'static',
		      keyboard: false
		    });

		    // Hiển thị modal
		    myModal.show();
		    document.getElementById("msgsuccess").innerHTML = msgSuccess;
	  }
	});

function kiemTraMatKhau(){
	matKhau = document.getElementById("newpassword").value;
	matKhauNhapLai = document.getElementById("renewpassword").value;
	if(matKhau!=matKhauNhapLai){
		document.getElementById("msg").innerHTML = "Mật khẩu không khớp!";
		document.getElementById("submit").disabled = "disabled";
		return false;
	}else{
		document.getElementById("msg").innerHTML = "";
		document.getElementById("submit").removeAttribute("disabled");
		return true;
	}
}
</script>