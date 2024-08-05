<%@page import="bean.TKeLuongBean"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.ThongKeLuongBean"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="bean.DangKyNghiBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thống Kê Lương</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="row">
		<div class="col-2  mt-5" style="margin-top: 8rem !important;">
			<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
		</div>
		<%
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
			String messageString = (request.getParameter("msg")!=null)?request.getParameter("msg"):"";
	        // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			
	        ArrayList<ThongKeLuongBean> tkl =  ((ArrayList<ThongKeLuongBean>)request.getAttribute("tkl")!=null)?(ArrayList<ThongKeLuongBean>)request.getAttribute("tkl"):new ArrayList<ThongKeLuongBean>();
	        ArrayList<TKeLuongBean> tkl_tam =  ((ArrayList<TKeLuongBean>)request.getAttribute("tkl_tam")!=null)?(ArrayList<TKeLuongBean>)request.getAttribute("tkl_tam"):new ArrayList<TKeLuongBean>();			
	        String thang = (request.getAttribute("thang")!=null)?request.getAttribute("thang").toString():"";
	       	String nam = (request.getAttribute("nam")!=null)?request.getAttribute("nam").toString():"";
	        String msg = (request.getAttribute("msg")!=null)?request.getAttribute("msg").toString():"";
		%>
		<div class="col-10 mt-4" style="margin-top: 8rem !important;" >
			<div class="row container">
			<div style="text-align: center;margin-bottom: 24px;">
				<h1>Bảng lương</h1>
			</div>
				<form action="quanly?action=bangluong" method="post">
				 	<div class="row">
						    <div class="col-sm-4">
						       <select class="form-control col" id="month" name="thang">
							        <% for (int i = 1; i <= 12; i++) { %>
							          <option value="<%= i %>" <%= (thang.equals(String.valueOf(i)) ? "selected=\"selected\"" : "") %>><%= i %></option>
							        <% } %>
							      </select>
						    </div>
						    <div class="col-sm-4">
						       <select class="form-control" id="year" name="nam">
									  <% 
									    int startYear = nhanvien.getNgayVaoLam().getYear()+1900; // Chuyển đổi biến nam sang kiểu int
									    int currentYear = java.time.LocalDate.now().getYear(); // Lấy năm hiện tại
									    for (int year = startYear; year <= currentYear; year++) { %>
									      <option value="<%= year %>" <%= ((nam).equals(year+"") ? "selected=\"selected\"" : "") %>><%= year %></option>
									  <% } %>
								</select>
						    </div>
						  	<div class="col-sm-4">
						      <button type="submit" class="btn btn-primary" >Tìm kiếm</button>
						    </div>
						    <div class="row" style="margin-top: 24px;">
								<div class="col-10">
								<table class="table table-hover">
									  <thead>
									    <tr>
									      <th>#</th>
									      <th>Mã NV</th>
									      <th>Số ca làm</th>
									      <th>Số ca nghỉ không phép</th>
									      <th>Tổng lương</th>
									    </tr>
									  </thead>
									  <tbody>
									  <%int i = 1;
									  for(ThongKeLuongBean item : tkl){
									  %>						
									    <tr>
									      <th scope="row"><%=i%></th>
									      <td><%=item.getMaNV()%></td>
									      <td><%=item.getSoCaLam()%></td>
									      <td><%=item.getSoCaNghi()%></td>
									      <%NumberFormat scientificFormat = NumberFormat.getInstance(Locale.US);
									      scientificFormat.setMaximumFractionDigits(2);%>
									      <td><%=scientificFormat.format(item.getLuong())%> VND
									    </tr>
									  <%i++;}%>
									  </tbody>
									</table>
								</div>
						</div>
					 </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>