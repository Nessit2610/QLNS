<%@page import="bo.ThongSoKyThuatBo"%>
<%@page import="bean.ThongSoKiThuatBean"%>
<%@page import="bo.ThongKeLuongBo"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bean.ThongKeLuongBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="bo.NhanVienBo"%>
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
	<div style="margin-top: 65px;" class="row">
				<div class="col-2  mt-5">
					<jsp:include page="Slidebar.jsp"></jsp:include>
				</div>
				<div class="col mt-5">
	<%
	NhanVienBo nvbo = new NhanVienBo();
	NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
	String thang = (request.getAttribute("thang")!=null)?request.getAttribute("thang").toString():"";
   	String nam = (request.getAttribute("nam")!=null)?request.getAttribute("nam").toString():"";
    String msg = (request.getAttribute("msg")!=null)?request.getAttribute("msg").toString():"";
    ThongKeLuongBo tklbo = new ThongKeLuongBo();
    ThongSoKyThuatBo tsktbo = new ThongSoKyThuatBo();
    ArrayList<ThongKeLuongBean> tkl = ((ArrayList<ThongKeLuongBean>)request.getAttribute("tk")!=null)?(ArrayList<ThongKeLuongBean>)request.getAttribute("tk"):new ArrayList<ThongKeLuongBean>();
    ThongSoKiThuatBean tskt = new ThongSoKiThuatBean();
    try {
    	tskt =  tsktbo.GetThongSo();
    } catch (Exception e) {
    	e.printStackTrace();
    }
				if(tkl.size()!=0){%>
					<h2 class="mb-5 px-5 mx-5">Danh sách thống kê lương <%=((thang).trim().length()!=0)?"tháng":""%>: <%=thang%></h2>
					<%}else if(tkl.size()==0){%>
					<h2 class="mb-5"><%=msg%></h2>
					<%}%>
					<div class="row container">
						<form action="nhanvien?action=showarrluong" method="post">
						 	<div class="row">
						 		<div class="col mb-3 mx-2">
							 		<div class="row">
										    <label for="month" class="col col-form-label text-center">Tháng:</label>
										      <select class="form-control col" id="month" name="thang" required="required">
										        <option ></option>
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
								       <select class="form-control col" id="year" name="nam" required="required">
											 <option></option>
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
					<%if(tkl.size()!=0){%>
						<div class="row">
							<div class="col-6  mt-5">
										<table class="table">
											  <thead>
											    <tr>
											      <th scope="col">#</th>
											      <th scope="col">Tháng</th>
											      <th scope="col">Số ca làm</th>
											      <th scope="col">Số ca nghỉ không phép</th>
											      <th scope="col">Tạm tính</th>
											      <th scope="col">Thưởng</th>
											      <th scope="col">Tổng</th>
											    </tr>
											  </thead>
											  <tbody>
											  <%int i = 1;
											  for(ThongKeLuongBean item : tkl){
												  item.setLuong(tklbo.TinhLuong(tsktbo.GetThongSo(),item.getSoCaLam(), item.getSoCaNghi()));
											  %>						
											    <tr>
											      <th scope="row"></th>
											      <td><%=item.getThangNam().getMonth()+1%>/<%=item.getThangNam().getYear()+1900%></td>
											      <td><%=item.getSoCaLam()%></td>
											      <td><%=item.getSoCaNghi()%></td>
											      <%NumberFormat scientificFormat = NumberFormat.getInstance(Locale.US);
											      scientificFormat.setMaximumFractionDigits(2);%>
											      <td><%=scientificFormat.format(tklbo.TinhLuong(tskt, item.getSoCaLam(), item.getSoCaNghi()))%> VND</td>
											      <td><%=scientificFormat.format(item.getLuong()-tklbo.TinhLuong(tskt, item.getSoCaLam(), item.getSoCaNghi())) %> VND</td>
											      <td><%=scientificFormat.format(item.getLuong())%> VND</td>
											    </tr>
											  <%i++;} %>
											  </tbody>
											</table>
						</div>
					</div>
				<%}%>
		 </div>
	</div>			
</body>
</html>