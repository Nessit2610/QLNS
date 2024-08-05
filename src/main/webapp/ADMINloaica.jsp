<%@page import="bean.LoaiCaBean"%>
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
.lc-content {
    box-shadow: var(--bs-box-shadow) !important;
    width: 40%;
    height: 40%;
    padding: 24px;
    margin: 100px 0  20px 0;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex justify-content-center">
		<div class="">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<div class="lc-content">
			<div style="text-align: center;">
				<h1>Danh Sách Phân Loại Ca Làm</h1>
			</div>
			<table style="margin-top: 20px;" class="table" >
				<thead>
					<tr>
						<th>Mã Loại Ca</th>
						<th>Tên Loại Ca</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<LoaiCaBean> ds = (ArrayList<LoaiCaBean>)request.getAttribute("BangLoaiCa");
					int n = ds.size();
					for(int i =0; i<n;i++){
						LoaiCaBean lcb = ds.get(i);%>
						<tr>
							<td><%=lcb.getMaLoaiCa() %></td>
							<td><%=lcb.getTenLoaiCa() %></td>
						</tr>	
					<%}%>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>