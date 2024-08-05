<%@page import="bo.NhanVienBo"%>
<%@page import="bean.thongkecalambean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.DangKyLamBean"%>
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
.dkl-content {
    box-shadow: var(--bs-box-shadow) !important;
    width: 65%;
    height: 40%;
    padding: 24px;
    margin: 100px 0 20px 0;
}
/* Center the form container */
.selectDate {
    margin-top: 20px;
}

/* Style each form section */
.selectDate > div {
    margin: 10px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 200px;
}

/* Label styling */
label {
    display: block;
    margin-bottom: 8px;
    margin-right: 8px;
    font-weight: bold;
    color: #333;
    line-height: 2.3;
}

/* Select box styling */
select {
    width: 100%;
    height: 40px;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

/* Submit button styling */
input[type="submit"] {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Responsive adjustments */
@media (max-width: 600px) {
    .d-flex {
        flex-direction: column;
    }

    .d-flex > div {
        width: 100%;
    }
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="d-flex justify-content-center">
		<div>
		<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
	</div>
		<div class="dkl-content">
			<div style="text-align: center;">
				<h1>Danh Sách Nhân Viên Đăng Ký Làm</h1>
			</div>
			<form id="form_id" action="quanly?action=thongkelichlam" method="post">
			<input type="hidden" id="maNV_hidden" name="maNV" value="">
				<%
				NhanVienBo nvbo = new NhanVienBo();
		        String thang = (request.getAttribute("thang")!=null)?request.getAttribute("thang").toString():"";
				%>
				<div class="selectDate d-flex justify-content-center align-item-center">
			        <div class="d-flex justify-content-center align-item-center">
				        <label for="month">Tháng:</label>
				        <select name="thang" id="month">
				            <option value="1"  <%= (thang.equals("1") ? "selected=\"selected\"" : "") %>> 1</option>
				            <option value="2"  <%= (thang.equals("2") ? "selected=\"selected\"" : "") %>> 2</option>
				            <option value="3"  <%= (thang.equals("3") ? "selected=\"selected\"" : "") %>> 3</option>
				            <option value="4"  <%= (thang.equals("4") ? "selected=\"selected\"" : "") %>> 4</option>
				            <option value="5"  <%= (thang.equals("5") ? "selected=\"selected\"" : "") %>> 5</option>
				            <option value="6"  <%= (thang.equals("6") ? "selected=\"selected\"" : "") %>> 6</option>
				            <option value="7"  <%= (thang.equals("7") ? "selected=\"selected\"" : "") %>> 7</option>
				            <option value="8"  <%= (thang.equals("8") ? "selected=\"selected\"" : "") %>> 8</option>
				            <option value="9"  <%= (thang.equals("9") ? "selected=\"selected\"" : "") %>> 9</option>
				            <option value="10" <%= (thang.equals("10") ? "selected=\"selected\"" : "") %>> 10</option>
				            <option value="11" <%= (thang.equals("11") ? "selected=\"selected\"" : "") %>> 11</option>
				            <option value="12" <%= (thang.equals("12") ? "selected=\"selected\"" : "") %>> 12</option>
				        </select>
			        </div>
			        <div class="d-flex justify-content-center align-item-center">
						<label for="year">Năm:</label>
				        <select name="nam" id="year">
				            <% 
				                long currentYear = java.time.LocalDate.now().getYear();
				                for (long i = currentYear; i >= currentYear - 10; i--) {
				            %>
				            <option value="<%= i %>"><%= i %></option>
				            <% } %>
				        </select>
				    </div>    
			        <input type="submit" value="Search" style="height: 40px;line-height: 1; margin-left: 8px; margin-top: 31px;">
			    </div>
			    <%ArrayList<DangKyLamBean> ChiTiet = (ArrayList<DangKyLamBean>) request.getAttribute("ChiTiet"); %>
			    <%if(ChiTiet == null){ %>
				<table class="table">
						<thead>
							<tr>
								<th>Mã Nhân viên</th>
								<th>Tên Nhân viên</th>
								<th>Số ca làm trong tháng</th>
								<th>Chi tiết ca làm</th>
							</tr>
						</thead>
						<tbody>
						<% ArrayList<thongkecalambean> ds = ((ArrayList<thongkecalambean>)request.getAttribute("BangDangKyLam")!=null)?(ArrayList<thongkecalambean>)request.getAttribute("BangDangKyLam"):new ArrayList<thongkecalambean>();
						int n = ds.size();
						for(int i =0; i<n;i++){
							thongkecalambean tkb = ds.get(i);%>
							<tr >
								<td><%=tkb.getMaNV()%></td>
								<td><%=nvbo.getnhanvientheoma(tkb.getMaNV()).getTenNV()%></td>
								<td><%=tkb.getSocalam()%></td>
								<td><input type="submit" value="Xem chi tiết" name="btn_xemchitiet" onClick="submitForm('<%=tkb.getMaNV()%>')"></td>
							</tr>	
						<%}%>
						</tbody>
				</table>
				<%}%>
				<%if(ChiTiet != null){ %>
				<table class="table" >
						<thead>
							<tr>
								<th>Mã Nhân viên</th>
								<th>Tên Nhân viên</th>
								<th>Mã Loại ca</th>
								<th>Ngày Đăng ký</th>
							</tr>
						</thead>
						<tbody>
						<% 
						int n = ChiTiet.size();
						for(int i =0; i<n;i++){
							DangKyLamBean tkb = ChiTiet.get(i);
							String tenloaica = null;
							if(tkb.getMaLoaica().equals("LC001")){
								tenloaica = "Sáng";
							}else if(tkb.getMaLoaica().equals("LC002")){
								tenloaica = "Chiều";
							}else if(tkb.getMaLoaica().equals("LC003")){
								tenloaica = "Tối";
							}%>
							<tr>
								<td><%=tkb.getMaNV()%></td>
								<td><%=nvbo.getnhanvientheoma(tkb.getMaNV()).getTenNV()%></td>
								<td><%=tenloaica%></td>
								<td><%=tkb.getNgayDK()%></td>
							</tr>	
						<%}%>
						</tbody>
				</table>
				<%}%>
		    </form>
		</div>
	</div>

<script>
function submitForm(maNV) {
    // Đặt giá trị mã nhân viên vào input hidden
    document.getElementById("maNV_hidden").value = maNV;
    // Gửi form
    document.getElementById("form_id").submit();
}
</script>

	
</body>
</html>