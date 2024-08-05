<%@page import="bean.NhanVienBean"%>
<%@page import="bean.VDangKyNghiBean"%>
<%@page import="adminbo.adminNhanVienBo"%>
<%@page import="bean.DangKyNghiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phương Chi Software</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style type="text/css">
.dkn-content {
	box-shadow: var(--bs-box-shadow) !important;
    width: 75%;
    height: 40%;
    padding: 24px;
    margin: 100px 0 20px 0;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	
	<div class="d-flex align-items-center justify-content-center;">
		<div class="col-2 menu-content" >
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<div class="dkn-content">
			<div style="text-align: center;">
				<h1>Danh Sách Nhân Viên Đăng Ký Nghỉ</h1>
			</div>
			<form action="adminDuyetDangKyNghiController" method="get">
				<table class="table">
					<thead>
				        <tr>
				        	<th>All
				        	<input type="checkbox" id="selectAll"></th>
				            <th>Mã Nhân Viên</th>
				            <th>Tên Nhân Viên</th>
				            <th>Loại Ca Làm</th>
				            <th>Ngày Đăng Ký</th>
				            <th>Duyệt</th>
				            <th>Người Duyệt</th>
				            <th>Lý Do</th> 
				        </tr>
		   			 </thead>
		   			 <tbody>
		   			 	<%ArrayList<VDangKyNghiBean> ds = (ArrayList<VDangKyNghiBean>)request.getAttribute("BangDangKyNghi");
		   			 		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
				   			int n = ds.size();
				   			for(int i=0; i<n; i++) {
				   			VDangKyNghiBean dkb = ds.get(i);%>
		   			 	<tr>
		   			 		   <td><input type="checkbox" name="check" value="<%=dkb.getMaDkNghi() %>"></td>
					           <td><%=dkb.getMaNV() %></td>  
					           <td><%=dkb.getTenNV() %></td>     
					           <td><%=dkb.getMaLoaiCa() %></td>      
					           <td><%=dkb.getNgayDK() %></td>
				           <%if(dkb.getDuyet() == 0) {%>
					           <td style="color: #c6cd1e;">Chờ duyệt</td>
					           <td></td>
				           <%} if(dkb.getDuyet() == 1) {%>
					           <td style="color: #35c51c;">Đã duyệt</td>
					           <td><%=dkb.getNguoiDuyet() %></td> 
				           <%} if(dkb.getDuyet() == 2) {%>
				           		<td style="color: #ff0000;">Không duyệt</td>
					           <td><%=dkb.getNguoiDuyet() %></td> 
				           <%} %>
					           <td><%=dkb.getLyDo() %></td>
		        	   </tr>
		   			 <%}%>
		   			 </tbody>
		
				</table>
				<button class="btn btn-success" type="submit" name="btn-duyet" value="<%=nhanvien.getTenNV() %>">Duyệt</button>
				<button class="btn btn-danger" type="submit" name="btn-tuchoi" value="<%=nhanvien.getTenNV() %>">Từ Chối</button>
			</form>	
		</div>
	</div>
</body>
<script>
    // Xử lý sự kiện khi ô "Select All" được thay đổi
    document.getElementById("selectAll").addEventListener("change", function() {
        // Lấy ra danh sách tất cả các checkbox trong bảng
        var checkboxes = document.querySelectorAll('input[type="checkbox"][name="check"]');
        // Lặp qua từng checkbox và thiết lập trạng thái của nó giống với trạng thái của ô "Select All"
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = document.getElementById("selectAll").checked;
        });
    });
</script>


</html>