
<%@page import="bo.NhanVienBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="bo.DangKyLamBo"%>
<%@page import="bean.DangKyLamBean"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
			LocalDate dateNow = LocalDate.now();
			DangKyLamBo dklambo = new DangKyLamBo();
			NhanVienBo nvbo = new NhanVienBo();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
			String dateString = (request.getAttribute("date")!=null?request.getAttribute("date").toString():"");
			String loaicaString = (request.getAttribute("loaica")!=null?request.getAttribute("loaica").toString():"");
			ArrayList<DangKyLamBean> dsdkl = dklambo.GetAllNVLamCungCa(Date.valueOf(dateString), loaicaString);
			String loaica = "";
			if(loaicaString.equals("LC001")){
				loaica = "Ca sáng";
			}else if(loaicaString.equals("LC002")){
				loaica = "Ca chiều";
			}else if(loaicaString.equals("LC003")){
				loaica = "Ca tối";
			}
			
	        // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // Chuyển đổi thành đối tượng LocalDate
	        LocalDate date = LocalDate.parse(dateString, formatter);

	        // Định dạng lại thành "dd/MM/yyyy"
	        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	        String msgSuccess = (request.getAttribute("msgSuccess")!=null)?request.getAttribute("msgSuccess").toString():"";

	        %>
		<div style="margin-top: 65px;" class="row">
			<div class="col-2  mt-5">
				<jsp:include page="Slidebar.jsp"></jsp:include>
			</div>
			<div class="col-6  mt-5">
				<h2 class="text-center mb-3">Danh sách nhân viên:</h2>
				<br>
				<br>
					Ngày: <%=formattedDate%> 
				<br>
				 	Loại ca: <%=loaica%>
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Tên nhân viên</th>
				      <th scope="col">Chức danh</th>
				      <th scope="col">Đơn vị</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%int i = 1;
				  for(DangKyLamBean item : dsdkl){%>						
				    <tr>
				      <th scope="row"><%=i%></th>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getTenNV()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getChucDanh()%></td>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getdVCT()%></td>
				    </tr>
				  <%i++;} %>
				  </tbody>
				</table>
			</div>
			<div class="col-4  mt-5 px-5">
				<!-- Button trigger modal -->
				<%if (dateNow.isBefore(date)) {%>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					   Đăng kí nghỉ phép cho ngày này
					</button>
	        	<%}%>
			</div>
		</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <form action="nhanvien?action=dknghi" method="post">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Đăng ký nghỉ:</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		  	<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Tên nhân viên: </span>
			  <input type="text" class="form-control" value="<%=nhanvien.getTenNV()%>" aria-describedby="basic-addon1" disabled="disabled">
			  <input type="hidden" class="form-control" name="manv" value="<%=nhanvien.getMaNV()%>" aria-describedby="basic-addon1">
			</div>
		    <div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Ngày đăng ký: </span>
			  <input type="text" class="form-control" value="<%=formattedDate%>" aria-describedby="basic-addon1" disabled="disabled">
			  <input type="hidden" class="form-control" name="date" value="<%=dateString%>" aria-describedby="basic-addon1">
			</div>
		     <div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Ca: 	</span>
			  <input type="text" class="form-control" value="<%=loaica%>" aria-describedby="basic-addon1" disabled="disabled">
			  <input type="hidden" class="form-control" name="loaica" value="<%=loaicaString%>" aria-describedby="basic-addon1">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">Lý do:</label>
			  <textarea name="lydo" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="submit" class="btn btn-primary">Gửi</button>
      </div>
    </div>
  </div>
 </form>
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
</script>



