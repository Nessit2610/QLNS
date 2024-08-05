<%@page import="java.util.Locale"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
<script src="https://kit.fontawesome.com/ba968237f2.js" crossorigin="anonymous"></script>
<style type="text/css">
/* Đặt các thành phần vào hàng */
form {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
    align-items: center;
    margin: 24px 0;
}

/* Tạo kiểu cho các nhãn */
form label {
    font-weight: bold;
    margin-right: 5px;
}

/* Tạo kiểu cho các ô nhập */
form input[type="date"],
form input[type="submit"] {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

/* Tạo kiểu cho nút bấm */
form input[type="submit"] {
    background-color: #007bff;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Thay đổi màu nền khi di chuột qua nút bấm */
form input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Đảm bảo rằng các thành phần không quá lớn */
form input[type="date"],
form input[type="submit"] {
    max-width: 200px;
}

/* Tạo khoảng cách giữa các thành phần */
form > * {
    margin: 5px 0;
}

</style>
</head>
<body>
<%
LocalDate currentDate = LocalDate.now();
LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
String startOfWeek_String = startOfWeek.format(dateFormatter);
String endOfWeek_String = endOfWeek.format(dateFormatter);
%>

	<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<div class="col-2  mt-5" style="margin-top: 8rem !important;">
				<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
			</div>
			<div class="col-10  mt-5" style="margin-top: 8rem !important; margin: auto;">
				<div style="text-align: center;">
					<h1>Danh sách nghỉ làm</h1>
				</div>
				<form action="quanly?action=danhsachnghilam" method="post" onsubmit="return validateDate()">
			        <label for="selectedDate">Từ ngày :</label>
			        <input type="date" id="selectedDate" name="ngayBatDau" required value="<%=(request.getAttribute("ngayBatDau")==null)?startOfWeek: request.getAttribute("ngayBatDau")%>">
			        <label for="selectedDate">Đến ngày :</label>
			        <input type="date" id="selectedDate2" name="ngayKetThuc" value="<%=(request.getAttribute("ngayKetThuc")==null)?endOfWeek: request.getAttribute("ngayKetThuc")%>">
			        <input type="submit" value="Tìm Kiếm" class="btn btn-primary">
			    </form>
			    <%
				ArrayList<DangKyNghiBean> ds = ((ArrayList<DangKyNghiBean>)request.getAttribute("ds_dkn")!=null)?(ArrayList<DangKyNghiBean>)request.getAttribute("ds_dkn"):new ArrayList<DangKyNghiBean>();
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
					    	} else 
					    		trangthaiduyet = "Vắng";
					      	if(item.getDuyet()==0){%> 		
					      <td><%=trangthaiduyet%>
					      <a href="quanly?action=duyetlichnghi&duyet=1&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
							<button type="button" class="btn btn-success"><i class="fa-solid fa-check"></i></button>
						  </a>
						  <a href="quanly?action=duyetlichnghi&duyet=2<%%>&nguoiduyet=<%=nhanvien.getTenNV()%>&ngaydk=<%=item.getNgayDK()%>&manv=<%=item.getMaNV()%>">
							<button type="button" class="btn btn-danger"><i class="fa-solid fa-xmark"></i></button>
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
		<script>
        // Hàm này được sử dụng để kiểm tra định dạng của ngày tháng
        function validateDate() {
            var selectedDate = document.getElementById("selectedDate").value;
            // Kiểm tra xem selectedDate có đúng định dạng ngày tháng YYYY-MM-DD không
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (!regex.test(selectedDate)) {
                alert("Vui lòng chọn ngày tháng hợp lệ (YYYY-MM-DD)!");
                return false;
            }
            return true;
        }
	</script>
</body>
</html>