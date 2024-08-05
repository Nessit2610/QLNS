
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
<title>Danh Sách Làm Việc</title>
</head>
<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
		
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
		%>
		
		<div style="margin-top: 65px;" class="row">
			<div class="col-2  mt-5" style="margin-top: 8rem !important;">
				<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
			</div>
			<div class="col-6  mt-5">
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
				      <td>
				      	<a href="quanly?action=danhvangkhongphep&maloaica=<%=item.getMaLoaica()%>&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=date%>&manv=<%=item.getMaNV()%>">
							<button type="button" class="btn btn-warning">Vắng</button>
						</a>
				      </td>
				    </tr>
				  <%i++;} %>
				  </tbody>
				</table>
			</div>
			<div class="col-4  mt-5 px-5">
				<a href="quanly?action=xemdsdangkinghi&date=<%=date%>&lc=<%=loaica%>&manv=<%=nhanvien.getMaNV()%>">
					<button type="button" class="btn btn-warning">Xem danh sách đăng kí nghỉ phép cho ngày này</button>
				</a>
			</div>
		</div>
</body>
</html>