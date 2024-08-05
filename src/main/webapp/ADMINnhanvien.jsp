<%@page import="bo.NhanVienBo"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="java.util.ArrayList"%>
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

.addBTN {
    background-color: #5d88cd !important;
    height: 40px;
}

.addBTN:hover  {
	cursor: pointer;
	opacity: 0.8;
}

.searchBTN {
	border: 1px solid #5d88cd !important;
	color: #5d88cd !important;
}

.searchBTN:hover {
	background-color: #5d88cd !important;
	color: #fff !important;
}

.center {
	margin-top: 85px;
	text-align: center;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); 
}

.modal-content {
	width: 150% !important;
}

#myModal {
	animation: fadeIn 0.5s ease-in-out;
}

/* CSS cho modalBody */
#modalBody {
    padding: 20px;
    background-color: #f8f9fa; /* Màu nền nhẹ */
    border-radius: 10px; /* Bo tròn góc */
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px); /* Bắt đầu từ vị trí cao hơn */
    }
    to {
        opacity: 1;
        transform: translateY(0); /* Kết thúc tại vị trí ban đầu */
    }
}

#modalBody .form-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px; /* Khoảng cách giữa các dòng */
}

#modalBody p.label {
    flex: 1; /* Để nhãn có thể co giãn */
    font-weight: bold;
    margin-right: 10px; /* Khoảng cách giữa nhãn và input */
    margin-bottom: 0; /* Bỏ margin bottom mặc định của thẻ p */
}

#modalBody input.input-value, 
#modalBody select.input-value {
    flex: 2; /* Để input chiếm nhiều không gian hơn */
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    background-color: #fff; /* Màu nền trắng */
    transition: border-color 0.3s ease;
}

#modalBody input.input-value:focus, 
#modalBody select.input-value:focus {
    border-color: #5d88cd; /* Màu viền khi focus */
    outline: none; /* Bỏ viền mặc định khi focus */
}

/* CSS cho modal header và footer */
.modal-header, .modal-footer {
    border-bottom: 1px solid #dee2e6;
    border-top: 1px solid #dee2e6;
}

.modal-title {
    font-size: 1.5rem;
    color: #343a40; /* Màu tiêu đề modal */
}

.modal-footer .btn-secondary, .modal-footer .btn-primary {
    padding: 10px 20px;
    border-radius: 5px;
}

.modal-footer .btn-secondary {
    background-color: #6c757d; /* Màu nút đóng */
}

.modal-footer .btn-primary {
    background-color: #5d88cd; /* Màu nút xác nhận */
}

.modal-footer .btn-primary:hover {
    background-color: #4e6fb6; /* Màu nút xác nhận khi hover */
}

/* Responsive */
@media (max-width: 768px) {
    #modalBody {
        padding: 10px;
    }

    .modal-title {
        font-size: 1.25rem;
    }

    #modalBody .form-group {
        flex-direction: column;
        align-items: flex-start;
    }

    #modalBody p.label {
        margin-bottom: 5px;
    }

    #modalBody input.input-value, 
    #modalBody select.input-value {
        width: 100%;
    }
    
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="d-flex justify-content-center">
	
		<div class="col-2">
			<jsp:include page="adminSlidebar.jsp"></jsp:include>
		</div>
		<div class="">
			<div class="center">
				<h1>Danh Sách Nhân Viên</h1>
			</div>
			<div class="d-flex justify-content-center align-items-center">
				<form style="width: 50%" class="d-flex justify-content-center" role="search" action="adminNhanVienController">
				      <input style="width: 50%;margin-top: 20px;height: 40px;" class="form-control me-2" type="search" name="txttk" placeholder="Search by name or ID" aria-label="Search">
				      <button style="height: 40px; margin: 20px 0;" class="btn searchBTN" type="submit">Search</button>
			    </form>
			   <button type="button" class="btn btn-primary addBTN" data-bs-toggle="modal" data-bs-target="#ThemNhanSu">Thêm mới nhân sự</button>
			</div>
		    <table id="myTable" class="table table-hover" style="font-size: 11px;">
				<thead>
			        <tr>
			            <th>Mã Nhân Viên</th>
			            <th style="width: 120px;">Tên Nhân Viên</th>
			            <th>Mã Chức Vụ</th>
			            <th>Ngày Sinh</th>
			            <th>Giới Tính</th>
			            <th>Email</th>
			            <th>Số Điện Thoại</th>
			            <th>Đơn Vị Công Tác</th>
			            <th>Chức Danh</th>
			            <th>Tài Khoản</th>
			            <th>Mật Khẩu</th>
			            <th>Trạng Thái Công Việc</th>
			            <th>Ảnh</th> 
			            <th>Ngày Vào Làm</th> 
			            <th>Ngày Kết Thúc</th> 
			            <th>Số Tài Khoản</th> 
			           
			        </tr>
			    </thead>
			    <tbody>
		    <%
				ArrayList<NhanVienBean> ds = (ArrayList<NhanVienBean>)request.getAttribute("DanhSachNhanVien"); 
				if(ds.size()==0){%>
					<td>Không Tìm Thấy</td>
				<%}%>
				<%if(ds.size() != 0){%>
			    
					
					<%NhanVienBo nvbo = new NhanVienBo();
					int n = ds.size();
					for(int i=0; i<n; i++) {
						NhanVienBean nvb = ds.get(i);
						String maNV = nvb.getMaNV();%>
				        <tr onclick="moModal(this)">
				            <td id="maNV_<%=i%>"><%=nvb.getMaNV()%></td>
				            <td id="tenNV_<%=i%>"><%=nvbo.getnhanvientheoma(nvb.getMaNV()).getTenNV() %></td>
				            <td id="maCV_<%=i%>"><%=nvb.getMaCV() %></td>
				            <td id="ngaySinh_<%=i%>"><%=nvb.getNgaySinh() %></td>
				            <td id="gioiTinh_<%=i%>"><%=(nvb.getGioiTinh()==true)?"Nam":"Nữ" %></td>
				            <td id="email_<%=i%>"><%=nvb.getEmail() %></td>
				            <td id="sdt_<%=i%>"><%=nvb.getsDT() %></td>
				            <td id="dvct_<%=i%>"><%=nvb.getdVCT() %></td>
				            <td id="chucDanh_<%=i%>"><%=nvb.getChucDanh() %></td>
				            <td id="tenDangNhap_<%=i%>"><%=nvb.getTenDangNhap() %></td>
				            <td id="matKhau_<%=i%>"><%=nvb.getMatKhau() %></td>
				            <td id="trangThaiCongViec_<%=i%>"><%=nvb.getTrangThaiCongViec()%></td>
				            
			            <%if(nvb.getAnh()!=null) {%>
				            <td id="anh_<%=i%>">Đã có ảnh</td>
			            <%}else{ %>
				            <td id="anh_<%=i%>">Chưa có ảnh</td>
			            <%} %>
			            
				            <td id="ngayvaolam_<%=i%>"><%=nvb.getNgayVaoLam() %></td>
				            
			        	<%if(nvb.getNgayKetThuc()!=null) {%>
				            <td id="ngayketthuc_<%=i%>"><%=nvb.getNgayKetThuc()%></td>
			            <%} else { %>
				            <td id="ngayketthuc_<%=i%>"></td>
				        <%} %>
				        
				            <td id="stknhanvien_<%=i%>"><%=nvb.getSoTaiKhoan()%></td>
				        </tr>
					<%}		
				}%>
				</tbody>
			</table>
		</div>
	</div>

<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" role="dialog">
	    <div class="modal-dialog modal-dialog-centered">
	    	<form action="adminChinhSuaThongTinNhanVien" method="get" onsubmit="return showAlert()">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel">Thông tin nhân viên</h5>
		                <button onclick="dongModal()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body">
		                <div id="modalBody">
		                	
		                </div>
		            </div>
		            <div class="modal-footer">
		                <button onclick="dongModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		                <button type="submit" class="btn btn-primary">Xác Nhận</button>
		            </div>
		        </div>
	    	</form>
	    </div>
	</div>
<!--modal 2  -->
<div class="modal fade" id="ThemNhanSu" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Nhập thông tin nhân sự</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
	      <form action="adminNhanVienController" method="get" onsubmit="return validateForm()">
			      	<label for="tennv">Tên NV:</label>
				    <input type="text" id="tennv" name="tennv" required="required"> <br>
				    <label for="selectedDate">Ngày Sinh:</label>
				    <input type="date" id="selectedDate" name="selectedDate" required="required"> <br>
				    Giới tính:
				    <input type="radio" name="gender" value="true" required="required"> Nam
				    <input type="radio" name="gender" value="false" required="required">Nữ<br>
				    Chức vụ:
				    <input type="radio" name="cv" value="CV003" required="required"> Nhân viên
				    <input type="radio" name="cv" value="CV002" required="required"> Quản Lý
				    <input type="radio" name="cv" value="CV001" required="required">Admin<br>
				    <label for="email">Email:</label>
				    <input type="email" id="email" name="email" required="required"><br>
				    <label for="sdt">Số điện thoại:</label>
				    <input type="text" id="sdt" name="sdt" required="required"><br>
				    <label for="tendn">Tên đăng nhập:</label>
				    <input type="text" id="tendn" name="tendn" required="required"><br>
				    <label for="mk">Mật khẩu:</label>
				    <input type="text" id="mk" name="mk" required="required"><br>
				    Ảnh:
				    <input type="file" name="image" accept="image/*" required="required"><br>
				    <label for="stk">Số tài khoản:</label>
				    <input type="text" id="stk" name="stk" required="required">
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Xác nhận</button>
		      </div>      
	    </form>
	  </div>
    </div>
  </div>
</div>

	

</body>


<script type="text/javascript">
	//Lấy modal
	var modal = document.getElementById("myModal");
	
	// Lấy nút để mở modal
	var btnOpenModal = document.querySelector("tr");
	
	// Lấy phần tử <span> đóng modal
	var spanCloseModal = document.getElementsByClassName("close")[0];
	

	
	// Khi người dùng click vào <span> (x), đóng modal
	function dongModal() {
	    modal.style.display = "none";
	}
	
	// Khi người dùng click bất kỳ nơi nào ngoài modal, đóng modal
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	function moModal(row) {
	    modal.style.display = "block";
	    // Lấy các giá trị từ các ô trong hàng được nhấp vào
	    var maNV = row.querySelector("[id^='maNV_']").textContent;
	    var tenNV = row.querySelector("[id^='tenNV_']").textContent;
	    var maCV = row.querySelector("[id^='maCV_']").textContent;
	    var ngaySinh = row.querySelector("[id^='ngaySinh_']").textContent;
	    var gioiTinh = row.querySelector("[id^='gioiTinh_']").textContent;
	    var email = row.querySelector("[id^='email_']").textContent;
	    var sdt = row.querySelector("[id^='sdt_']").textContent;
	    var dvct = row.querySelector("[id^='dvct_']").textContent;
	    var chucDanh = row.querySelector("[id^='chucDanh_']").textContent;
	    var tenDangNhap = row.querySelector("[id^='tenDangNhap_']").textContent;
	    var matKhau = row.querySelector("[id^='matKhau_']").textContent;
	    var trangThaiCongViec = row.querySelector("[id^='trangThaiCongViec_']").value;
	    var ngayvaolam = row.querySelector("[id^='ngayvaolam_']").textContent;
	    var ngayketthuc = row.querySelector("[id^='ngayketthuc_']").textContent;
	    var stknhanvien = row.querySelector("[id^='stknhanvien_']").textContent;

	    // Hiển thị các giá trị trong modal
	    var modalBody = document.getElementById("modalBody");
	    // Xóa nội dung cũ của modalBody
	    modalBody.innerHTML = "";
	    // Tạo và thêm các phần tử <p> vào modalBody
	    var rows = [
	        { label: "Mã Nhân Viên", value: maNV },
	        { label: "Tên Nhân Viên", value: tenNV },
	        { label: "Mã Chức Vụ", value: maCV },
	        { label: "Ngày Sinh", value: ngaySinh },
	        { label: "Giới Tính", value: gioiTinh },
	        { label: "Email", value: email },
	        { label: "Số Điện Thoại", value: sdt },
	        { label: "Đơn Vị Công Tác", value: dvct },
	        { label: "Chức Danh", value: chucDanh },
	        { label: "Tên Đăng Nhập", value: tenDangNhap },
	        { label: "Mật Khẩu", value: matKhau },
	        { label: "Trạng Thái Công Việc", value: trangThaiCongViec },
	        { label: "Ngày Vào Làm", value: ngayvaolam },
	        { label: "Ngày Kết Thúc", value: ngayketthuc },
	        { label: "Số Tài Khoản", value: stknhanvien }
	    ];
	    rows.forEach(rowData => {
	        var formGroup = document.createElement("div");
	        formGroup.classList.add("form-group");

	        var labelElement = document.createElement("p");
	        labelElement.textContent = rowData.label + ": ";
	        labelElement.classList.add("label");

	        var valueElement;
	        if (rowData.label === "Trạng Thái Công Việc") {
	            valueElement = document.createElement("select");
	            valueElement.classList.add("input-value");

	            var optionTrue = document.createElement("option");
	            optionTrue.value = "true";
	            optionTrue.text = "True";
	            valueElement.appendChild(optionTrue);

	            var optionFalse = document.createElement("option");
	            optionFalse.value = "false";
	            optionFalse.text = "False";
	            valueElement.appendChild(optionFalse);
	            valueElement.setAttribute("name", rowData.label.toLowerCase());
	        } else {
	            valueElement = document.createElement("input");
	            valueElement.value = rowData.value;
	            valueElement.classList.add("input-value");
	            valueElement.setAttribute("name", rowData.label.toLowerCase());
	        }

	        formGroup.appendChild(labelElement);
	        formGroup.appendChild(valueElement);
	        modalBody.appendChild(formGroup);
	    });
	}
	
	function showAlert() {
	    var confirmation = confirm("Bạn muốn thay đổi thông tin?");
	    if (confirmation) {
	        alert("Thông tin đã được thay đổi!");
	        return true; 
	    } else {
	    	window.location.href = "adminNhanVienController";
	    	return false; 
	    }
	}
	// Hàm kiểm tra ngày tháng
    function validateDate(selectedDate) {
        var regex = /^\d{4}-\d{2}-\d{2}$/;
        return regex.test(selectedDate);
    }

    // Hàm kiểm tra email
    function validateEmail(email){
        var regex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
        return regex.test(email);
    }

    // Hàm kiểm tra số điện thoại
    function validatePhonenumber(sdt){
        var regex = /([\+84|84|0]+(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})\b/;
        return regex.test(sdt);
    }

    // Hàm kiểm tra tên
    function validateName(tennv) {
        var regex = /^[A-Za-zÀ-ỹ]+\s([A-Za-zÀ-ỹ]+\s?)+$/;
        return regex.test(tennv);
    }
	 function validateForm() {
		 console.log("Tao Chạy tới được đây rồi ");
		 var tennv = document.getElementById('tennv').value;
         var selectedDate = document.getElementById('selectedDate').value;
         var email = document.getElementById('email').value;
         var sdt = document.getElementById('sdt').value;
         // Kiểm tra tính hợp lệ của các trường
         if (!validateName(tennv)) {
             alert("Vui lòng nhập tên nhân viên hợp lệ !");
             return false;
         }
         if (!validateDate(ngaysinh)) {
             alert("Vui lòng nhập ngày sinh hợp lệ !");
             return false;
         }
         if (!validateEmail(email)) {
             alert("Vui lòng nhập địa chỉ email hợp lệ!");
             console.log("Tao Chạy tới được đây rồi 3 ");
             return false;
         }
         if (!validatePhonenumber(sdt)) {
             alert("Vui lòng nhập số điện thoại hợp lệ!");
             return false;
         }
         return true;
     }	
</script>
</html>