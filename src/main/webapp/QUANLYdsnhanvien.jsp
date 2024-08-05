<%@page import="bean.NhanVienBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Nhân Viên</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style>
	/* The Modal (background) */
	.modal {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  overflow: auto;
	  background-color: rgba(0,0,0,0.4);
	}
	
	/* Modal Content/Box */
	.modal-content {
	  background-color: #fefefe;
	  margin: 15% auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	
	/* Close Button */
	.close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		<div class="row">
			<div class="col-2 mt-5" style="margin-top: 8rem !important;">
				<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
			</div>
			<div class="col-10" style="margin-top: 8rem !important;">
			<div style="text-align: center;">
				<h1>Danh sách nhân viên</h1>
			</div>
					<!-- <button type="button" class="btn btn-warning" id="openModalBtn">Thêm mới nhân viên</button> -->
					
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModalThemNV">
				  Thêm mới nhân sự
				</button>
					<table  class="table table-hover" style="font-size: 11px;">
					<thead>
				        <tr>
				            <th style="width: 100px;">Mã Nhân Viên</th>
				            <th style="width: 180px;">Tên Nhân Viên</th>
				            <th style="width: 100px;">Mã Chức Vụ</th>
				            <th style="width: 100px;">Ngày Sinh</th>
				            <th style="width: 80px;">Giới Tính</th>
				            <th >Email</th>
				            <th style="width: 100px;">Số Điện Thoại</th>
				            <th>Đơn Vị Công Tác</th>
				            <th>Chức Danh</th>
				            <th style="width: 80px;">Tài Khoản</th>
				            <th style="width: 80px;">Mật Khẩu</th>
				            <th style="width: 100px;">Trạng Thái Công Việc</th>
				            <th>Ảnh</th> 
				            <th style="width: 100px;">Ngày Vào Làm</th> 
				            <th style="width: 100px;">Ngày Kết Thúc</th> 
				            <th>Số Tài Khoản</th> 
				        </tr>
				    </thead>
				    <tbody>
					<%
					ArrayList<NhanVienBean> ds = (ArrayList<NhanVienBean>)request.getAttribute("ds_nv"); 
					int n = ds.size();
					for(int i=0; i<n; i++) {
						NhanVienBean nvb = ds.get(i);%>
				        <tr onclick="moModal(this)">
				            <td id="maNV_<%=i%>"><%=nvb.getMaNV()%></td>
				            <td id="tenNV_<%=i%>"><%=nvb.getTenNV() %></td>
				            <td id="maCV_<%=i%>"><%=nvb.getMaCV() %></td>
				            <td id="ngaySinh_<%=i%>"><%=nvb.getNgaySinh() %></td>
				            <td id="gioiTinh_<%=i%>"><%=(nvb.getGioiTinh()==true)?"Nam":"Nữ" %></td>
				            <td id="email_<%=i%>"><%=nvb.getEmail() %></td>
				            <td id="sdt_<%=i%>"><%=nvb.getsDT() %></td>
				            <td id="dvct_<%=i%>"><%=nvb.getdVCT() %></td>
				            <td id="chucDanh_<%=i%>"><%=nvb.getChucDanh() %></td>
				            <td id="tenDangNhap_<%=i%>"><%=nvb.getTenDangNhap() %></td>
				            <td id="matKhau_<%=i%>"><%=nvb.getMatKhau() %></td>
				            <td id="trangThaiCongViec_<%=i%>"><%=nvb.getTrangThaiCongViec()%></td>
				            
			            <%if(nvb.getAnh()!=null) {%>
				            <td id="anh_<%=i%>">Đã có ảnh</td>
			            <%}else{ %>
				            <td id="anh_<%=i%>">Chưa có ảnh</td>
			            <%} %>
			            
				            <td id="ngayvaolam_<%=i%>"><%=nvb.getNgayVaoLam() %></td>
				            
			        	<%if(nvb.getNgayKetThuc()!=null) {%>
				            <td id="ngayketthuc_<%=i%>"><%=nvb.getNgayKetThuc()%></td>
			            <%} else { %>
				            <td id="ngayketthuc_<%=i%>"></td>
				        <%} %>
				        
				            <td id="stknhanvien_<%=i%>"><%=nvb.getSoTaiKhoan()%></td>
				        </tr>
					<%}%>
					</tbody>
				</table>
			</div>
		</div>	
	
	<!-- Modal add employees -->
	<div class="modal fade" id="myModalThemNV" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <form action="quanly?action=themnhanvien" method="post">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm mới nhân sự</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<div class="mb-3">
			        <label for="tennv" class="form-label">Tên NV:</label>
				    <input type="text" class="form-control" id="tennv" name="tennv" required="required">
		       	</div>
			    <div class="mb-3">
				    <label for="ngaysinh" class="form-label">Ngày Sinh:</label>
				    <input type="date" class="form-control" id="ngaysinh" name="ngaysinh" required="required">
		       	</div>
			    <div class="mb-3">
				    <label for="gioitinh" class="form-label">Giới tính:</label>
				    <select class="form-select" id="gioitinh" name="gioitinh">
				        <option value="true">Nam</option>
				        <option value="false">Nữ</option>
				    </select>
				</div>
			    <div class="mb-3">
				    <label for="tennv" class="form-label">Email:</label>
				    <input type="email" class="form-control" id="email" name="email" required="required">
		       	</div>
			    <div class="mb-3">
				    <label for="manv" class="form-label">Số điện thoại:</label>
				    <input type="text" class="form-control" id="sdt" name="sdt" required="required">
		       	</div>
			    <!-- <div class="mb-3">
				    <label for="dvct" class="form-label">Đơn vị công tác:</label>
				    <input type="text" class="form-control" id="dvct" name="dvct">
		       	</div>
			    <div class="mb-3">
				    <label for="chucdanh" class="form-label">Chức danh:</label>
				    <input type="text" class="form-control" id="chucdanh" name="chucdanh">
		       	</div> -->
			    <div class="mb-3">
				    <label for="tennv" class="form-label">Tên đăng nhập:</label>
				    <input type="text" class="form-control" id="tendn" name="tendn" required="required">
		       	</div>
			    <div class="mb-3">
				    <label for="manv" class="form-label">Mật khẩu:</label>
				    <input type="text" class="form-control" id="mk" name="mk" required="required">
		       	</div>
			    <div class="mb-3">
				    <label for="manv" class="form-label">Số tài khoản:</label>
				    <input type="text" class="form-control" id="stk" name="stk" required="required">
		       	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		        <button type="submit" id="saveEmployeeBtn" class="btn btn-primary">Lưu thông tin nhân viên</button>
		      </div>
		      
	      </form>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- The Modal Them NV -->
	<div id="myModalThemNV" class="modal">
	
		  <!-- Modal content -->
		  <form action="quanly?action=themnhanvien" method="post">
		  <div class="modal-content">
		    <span class="close">&times;</span>
		    <label for="tennv">Tên NV:</label>
		    <input type="text" id="tennv" name="tennv">
		    <label for="ngaysinh">Ngày Sinh:</label>
		    <input type="text" id="ngaysinh" name="ngaysinh">
		    <label for="manv">Giới tính:</label>
		    <input type="text" id="gioitinh" name="gioitinh">
		    <label for="tennv">Email:</label>
		    <input type="text" id="email" name="email">
		    <label for="manv">Số điện thoại:</label>
		    <input type="text" id="sdt" name="sdt">
		    <label for="tennv">Tên đăng nhập:</label>
		    <input type="text" id="tendn" name="tendn">
		    <label for="manv">Mật khẩu:</label>
		    <input type="text" id="mk" name="mk">
		    <label for="tennv">Ảnh:</label>
		    <input type="text" id="anh" name="anh">
		    <label for="manv">Số tài khoản:</label>
		    <input type="text" id="stk" name="stk">
		    <button id="submitBtn">Thêm nhân viên</button>
		  </div>
		  </form>
		<div id="successMessage" style="display: none;">Thêm nhân viên thành công!</div>
	</div>
</body>

<script type="text/javascript">
	//Get the modal
	var modal = document.getElementById("myModalThemNV");
	
	// Get the button that opens the modal
	var btn = document.getElementById("openModalBtn");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	// Handle form submission
	var submitBtn = document.getElementById("submitBtn");
	submitBtn.onclick = function() {
	  var manv = document.getElementById("manv").value;
	  var tennv = document.getElementById("tennv").value;
	
	  // Tạo một đối tượng FormData chứa dữ liệu của form
	  var formData = new FormData();
	  formData.append('manv', manv);
	  formData.append('tennv', tennv);
	
	  // Tạo một yêu cầu mới
	  var xhr = new XMLHttpRequest();
	  
	  // Thiết lập phương thức và URL cho yêu cầu
	  xhr.open("POST", "quanly?action=themnhanvien", true);
	  
	  // Gửi yêu cầu với dữ liệu form
	  xhr.send(formData);
	
	  // Xử lý phản hồi từ Servlet nếu cần
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState == XMLHttpRequest.DONE) {
	      if (xhr.status == 200) {
	        console.log("Dữ liệu đã được gửi thành công!");
	     // Đóng modal sau khi gửi dữ liệu thành công
	        modal.style.display = "none";
	     // Hiển thị thông báo thành công
	        document.getElementById("successMessage").style.display = "block";
	      } else {
	        console.error("Đã xảy ra lỗi khi gửi dữ liệu.");
	      }
	    }
	  };
	}
</script>


</html>