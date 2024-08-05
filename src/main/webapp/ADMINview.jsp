<%@page import="bean.ThongSoKiThuatBean"%>
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
input {
	border : none;
	text-align: center;
}
input:focus-visible {
	outline : none;
}

.menu-content {
  display: block;
  padding: 10px;
  animation-duration: 0.5s;
  overflow: hidden; /* Ẩn phần nội dung vượt quá kích thước của phần tử */
  position: fixed;
  top: 132px;
  z-index: 1000;
}

.ts-content {
	box-shadow: var(--bs-box-shadow) !important;
    width: 40%;
    height: 40%;
    padding: 24px;
    margin-top: 105px;
}


</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="d-flex justify-content-center align-items-center" >
		<div class="col-2 menu-content" >
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		
		<div class="ts-content">
			<h1 class="text-center">Bảng Thông Số Kỹ Thuật</h1>
		 	<% ThongSoKiThuatBean tsbean = (ThongSoKiThuatBean)request.getAttribute("BangThongSo"); %>
		
		 	
		 	<form action="ThongSoController" method="post">
			 	<table class="table">
			 		<tr>
			 			<th> Lương </th>
			 			<td> 
			 				<input type="text" name="luong" value="<%=tsbean.getLuong()%>">
			 			</td>
			 		</tr>
			 		<tr>
			 			<th> Hệ Số Lương </th>
			 			<td> 
			 				<input type="text" name="hsl" value="<%=tsbean.getHSL()%>">
			 			</td>
			 		</tr>
			 		
			 		<tr>
			 			<th> Hệ Số Lương Tăng Ca </th>
			 			<td> 
			 				<input type="text" name="hslOT" value="<%=tsbean.getHSLOT()%>">
			 			</td>
			 		</tr>
			 		
			 		<tr>
			 			<th> Hệ Số Lương Phạt </th>
			 			<td> 
			 				<input type="text" name="hslPhat" value="<%=tsbean.getHSLPhat()%>">
			 			</td>
			 		</tr>
			 		
			 		<tr>
			 			<th> Số Ca Làm Tối Thiểu 1 Tháng </th>
			 			<td> 
			 				<input type="text" name="sclMinThang" value="<%=tsbean.getSoCaLamMin()%>">
			 			</td>
			 		</tr>
			 		
			 		<tr>
			 			<th> Số Nhân Viên Tối Đa 1 Ca </th>
			 			<td> 
			 				<input type="text" name="sclMaxCa" value="<%=tsbean.getSoNVMotCaMax()%>">
			 			</td>
			 		</tr>
			 		
			 		<tr>
			 			<th> Số Nhân Viên Tối Thiểu 1 Ca </th>
			 			<td> 
			 				<input type="text" name="sclMinCa" value="<%=tsbean.getSoNVMotCaMin()%>">
			 			</td>
			 		</tr>
		 			
			 	</table>
			 	<div class="text-center">
			 		<button class="btn btn-primary" id="submit" type="submit">Xác Nhận</button>
			 	</div>
		 	</form>
		</div>
	</div>
</body>

</html>