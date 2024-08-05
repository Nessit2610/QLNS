
<%@page import="bean.DangKyNghiBean"%>
<%@page import="bo.DangKyNghibo"%>
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
			DangKyNghibo dknbo = new DangKyNghibo();
			NhanVienBo nvbo = new NhanVienBo();
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
			ArrayList<DangKyNghiBean> dsdk = ((ArrayList<DangKyNghiBean>)request.getAttribute("dsdknghi")!=null)?(ArrayList<DangKyNghiBean>)request.getAttribute("dsdknghi"):new ArrayList<DangKyNghiBean>();
			String messageString = (request.getParameter("msg")!=null)?request.getParameter("msg"):"";
	        // Định dạng ngày
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				
	        String thang = (request.getAttribute("thang")!=null)?request.getAttribute("thang").toString():"";
	       	String nam = (request.getAttribute("nam")!=null)?request.getAttribute("nam").toString():"";
	        String msg = (request.getAttribute("msg")!=null)?request.getAttribute("msg").toString():"";
		%>
		<div style="margin-top: 65px;" class="row">
				<div class="col-2  mt-5">
					<jsp:include page="Slidebar.jsp"></jsp:include>
				</div>
				<div class="col mt-5">
					<h2 class="mb-5 px-5 mx-5">Danh sách đăng ký nghỉ của tháng: <%=thang%></h2>
					<div class="row container">
						<form action="nhanvien?action=showarrdkn" method="post">
						 	<div class="row">
						 		<div class="col mb-3 mx-2">
							 		<div class="row">
										    <label for="month" class="col col-form-label text-center">Tháng:</label>
										      <select class="form-control col" id="month" name="thang">
										        <option value="1" <%= (thang.equals("1") ? "selected=\"selected\"" : "") %>>1</option>
										        <option value="2" <%= (thang.equals("2") ? "selected=\"selected\"" : "") %>>2</option>
										        <option value="3" <%= (thang.equals("3") ? "selected=\"selected\"" : "") %>>3</option>
										        <option value="4" <%= (thang.equals("4") ? "selected=\"selected\"" : "") %>>4</option>
										        <option value="5" <%= (thang.equals("5") ? "selected=\"selected\"" : "") %>>5</option>
										        <option value="6" <%= (thang.equals("6") ? "selected=\"selected\"" : "") %>>6</option>
										        <option value="7" <%= (thang.equals("7") ? "selected=\"selected\"" : "") %>>7</option>
										        <option value="8" <%= (thang.equals("8") ? "selected=\"selected\"" : "") %>>8</option>
										        <option value="9" <%= (thang.equals("9") ? "selected=\"selected\"" : "") %>>9</option>
										        <option value="10" <%= (thang.equals("10") ? "selected=\"selected\"" : "") %>>10</option>
										        <option value="11" <%= (thang.equals("11") ? "selected=\"selected\"" : "") %>>11</option>
										        <option value="12" <%= (thang.equals("12") ? "selected=\"selected\"" : "") %>>12</option>
										      </select>
							 		</div>
						 		</div>
					 			<div class="mb-3 col">
					 				<div class="row">					 				
								       <label for="year" class="col col-form-label text-center">Năm:</label>
								       <select class="form-control col" id="year" name="nam">
											  <% 
											    int startYear = nhanvien.getNgayVaoLam().getYear()+1900; // Chuyển đổi biến nam sang kiểu int
											    int currentYear = java.time.LocalDate.now().getYear(); // Lấy năm hiện tại
											    for (int year = startYear; year <= currentYear; year++) { %>
											      <option value="<%= year %>" <%= ((nam).equals(year+"") ? "selected=\"selected\"" : "") %>><%= year %></option>
											  <% } %>
										</select>
					 				</div>
								 </div>
							  	<div class="col-sm-4">
							  		<label for=""> </label>
							      <button type="submit" class="btn btn-primary" >Tìm kiếm</button>
							    </div>
							 </div>
						</form>
					</div>
					<div class="row">
						<div class="col-6  mt-5">
									<%if(dsdk.size()==0){%>
										<span ><%=msg%></span>
									<%}else{%>
										<table class="table">
											  <thead>
											    <tr>
											      <th scope="col">#</th>
											      <th scope="col">Ngày</th>
											      <th scope="col">Ca</th>
											      <th scope="col">Duyệt</th>
											      <th scope="col">Người duyệt</th>
											      <th scope="col">Lý do</th>
											    </tr>
											  </thead>
											  <tbody>
											  <%int i = 1;
											  for(DangKyNghiBean item : dsdk){
													// Chuyển đổi thành đối tượng LocalDate
											        LocalDate date = LocalDate.parse(item.getNgayDK().toString(), formatter);
							
											        // Định dạng lại thành "dd/MM/yyyy"
											        String formattedDate = date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
											        
											        String loaica = "";
													if(item.getMaLoaiCa().equals("LC001")){
														loaica = "Ca sáng";
													}else if(item.getMaLoaiCa().equals("LC002")){
														loaica = "Ca chiều";
													}else if(item.getMaLoaiCa().equals("LC003")){
														loaica = "Ca tối";
													}
													
													String duyet = "";
													if(item.getDuyet()==1){
														duyet = "Đã duyệt";
													}else if(item.getDuyet()==2){
														duyet = "Từ chối";
													}else if(item.getDuyet()==0){
														duyet = "Chưa duyệt";
													}
											  %>						
											    <tr>
											      <th scope="row"><%=i%></th>
											      <td><%=formattedDate%></td>
											      <td><%=loaica%></td>
											      <td><%=duyet%></td>
											      <td><%=(item.getNguoiDuyet()!=null)?item.getNguoiDuyet():""%></td>
											      <td><%=item.getLyDo()%></td>
											    </tr>
											  <%i++;} %>
											  </tbody>
											</table>
										<%
									}
							%>
							
						</div>
				</div>
				</div>
		</div>
</body>
</html>



