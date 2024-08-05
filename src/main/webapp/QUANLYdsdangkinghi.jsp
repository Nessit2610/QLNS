<%@page import="bo.NhanVienBo"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="bean.DangKyNghiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Nghỉ Làm</title>
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
		<div class="col-10" style="margin-top: 8rem !important;">
			<%
			ArrayList<DangKyNghiBean> ds = (ArrayList<DangKyNghiBean>)request.getAttribute("ds_dkn");
			NhanVienBo nvbo = new NhanVienBo();
			int i = 1;
			NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
			%>
			<table class="table">
				<thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Tên nhân viên</th>
				      <th scope="col">Mã loại ca</th>
				      <th scope="col">Ngày đăng ký</th>
				      <th scope="col">Trạng thái duyệt</th>
				      <th scope="col">Người duyệt</th>
				      <th scope="col">Lý do</th>
				    </tr>
				</thead>
				<tbody>
				<%for(DangKyNghiBean item : ds){%>
					<tr>
				      <th scope="row"><%=i%></th>
				      <td><%=nvbo.getnhanvientheoma(item.getMaNV()).getTenNV()%></td>
				      <td><%=item.getMaLoaiCa()%></td>
				      <td><%=item.getNgayDK()%></td>
				      <%String trangthaiduyet = "";
				      	if(item.getDuyet()==0){
				    	  	trangthaiduyet = "Đang chờ duyêt";
				    	} else if(item.getDuyet()==1){
				    		trangthaiduyet = "Duyệt";
				    	} else if(item.getDuyet()==2){
				    		trangthaiduyet = "Không Duyệt";
				    	}
				    	else 
				    		trangthaiduyet = "Vắng";
				      	if(item.getDuyet()==0){%> 		
				      <td><%=trangthaiduyet%>
				      <a href="quanly?action=duyetlichnghi&duyet=1&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
						<button type="button" class="btn btn-warning">Duyệt</button>
					  </a>
					  <a href="quanly?action=duyetlichnghi&duyet=2<%%>&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
						<button type="button" class="btn btn-warning">Không Duyệt</button>
					  </a>
				      </td>
				      <td>Chưa có người duyệt</td>
				      <td><%=item.getLyDo()%></td>
				      <%}if(item.getDuyet()!=0){%>
				      <td><%=trangthaiduyet %></td>
				      <td><%=item.getNguoiDuyet()%></td>
				      <td><%=item.getLyDo()%></td>
				      <%}%>
				    </tr>
				  <%i++;}%>
				</tbody>
			</table>				
		</div>
	</div>	
</body>

</html>