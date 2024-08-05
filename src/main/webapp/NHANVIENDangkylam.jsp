<%@page import="bo.ThongSoKyThuatBo"%>
<%@page import="java.sql.Date"%>
<%@page import="bo.DangKyLamBo"%>
<%@page import="bean.DangKyLamBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</head>
<body>
	
	<%
	ThongSoKyThuatBo tsktbo = new ThongSoKyThuatBo();
	DangKyLamBo dklambo = new DangKyLamBo();
	ArrayList<DangKyLamBean> dsdk = ((ArrayList<DangKyLamBean>)request.getAttribute("dsdk")!=null)?(ArrayList<DangKyLamBean>)request.getAttribute("dsdk"):(new ArrayList<DangKyLamBean>());
	String msgSuccess = (request.getAttribute("msgSuccess")!=null)?request.getAttribute("msgSuccess").toString():"";
	String socadadangky = (request.getAttribute("socadadangky")!=null)?request.getAttribute("socadadangky").toString():"";%>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="margin-top: 65px;" class="row">
	
		<div class="col-2  mt-5">
			<jsp:include page="Slidebar.jsp"></jsp:include>
		</div>
		<div class="col-10 mt-4">
				<h2 class="text-center mb-3">Đăng ký làm việc tuần tiếp theo</h2>
		 		<div class="mb-3 row">
					    <label class="col-sm-2 col-form-label">Số ca đã đăng kí cho tháng này:</label>
					    <div class="col-sm-10">
					      <span class="form-control-plaintext"><%=socadadangky %></span>
					    </div>
			    </div>
			     <div class="mb-3 row">
					    <label for="hovaten" class="col-sm-2 col-form-label">Số ca làm tối thiểu 1 tháng:</label>
					    <div class="col-sm-10">
					      <span class="form-control-plaintext"><%=tsktbo.GetThongSo().getSoCaLamMin()%></span>
					    </div>
			    </div>
	    	<%
	    	LocalDate currentDate = LocalDate.now();
			if(currentDate.getDayOfWeek().toString().equalsIgnoreCase("Thursday") || currentDate.getDayOfWeek().toString().equalsIgnoreCase("Friday") ||currentDate.getDayOfWeek().toString().equalsIgnoreCase("Saturday")){%>
				<form action="nhanvien?action=workregistration" method="post">
				<div class="col-10 mt-4">
			   		<div class="container-fluid text-center">
			        <table class="table table-bordered">
			            <thead>
			                <tr>
			                	<%     
			                	currentDate = LocalDate.now().plusDays(7);
			        	        // Tính toán ngày bắt đầu và kết thúc của tuần
			        	        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
			        	        LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
			        	        DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("EEEE", new Locale("vi", "VN"));
			        	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			        	        
			                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                	while (!startOfWeek.isAfter(endOfWeek)) {
			                        String dayOfWeek = startOfWeek.format(dayFormatter);
			                        String date = startOfWeek.format(dateFormatter);
			                        %>
			       	        		<th style="width:14%" class="text-center table-primary">
				                        <%=dayOfWeek%><br />
				                        <%=date%>
				                    </th>
			        	        	<%
			                        startOfWeek = startOfWeek.plusDays(1);
			                    }
			                	%>
			                </tr>
			            </thead>
			            <tbody>
			                    <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();
					                        int countdklam = dklambo.CountRecordsByNgayDKAndMaLoaiCa(Date.valueOf(startOfWeek), "LC001");
					                        %>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="casang"  data-countdklam="<%=countdklam%>" data-maxnvmotca="<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>">
														  <label class="form-check-label" for="flexCheckDefault">
														    Sáng (<%=countdklam%>/<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>)
														  </label>
														</div>
								                    </th>
					            					
					            				
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			                   <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();
					                        int countdklam = dklambo.CountRecordsByNgayDKAndMaLoaiCa(Date.valueOf(startOfWeek), "LC002");
					                        %>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="cachieu"  data-countdklam="<%=countdklam%>" data-maxnvmotca="<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>">
														  <label class="form-check-label" for="flexCheckDefault">
														    Chiều (<%=countdklam%>/<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>)
														  </label>
														</div>
								                    </th>
					            					
					            				
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			                    <tr>
			                    	<%    
			                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
				                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
			                    	try {
					                	while (!startOfWeek.isAfter(endOfWeek)) {
					                        String date = startOfWeek.toString();
					                        int countdklam = dklambo.CountRecordsByNgayDKAndMaLoaiCa(Date.valueOf(startOfWeek), "LC003");
					                        %>
							       	        		<th style="width:14%" class="text-center">
								                        <div class="form-check">
														  <input class="form-check-input" type="checkbox" value="<%=startOfWeek%>" name="catoi" data-countdklam="<%=countdklam%>" data-maxnvmotca="<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>">
														  <label class="form-check-label" for="flexCheckDefault">
														    Tối (<%=countdklam%>/<%=(tsktbo.GetThongSo()).getSoNVMotCaMax()%>)
														  </label>
														</div>
								                    </th>
					        	        	<%startOfWeek = startOfWeek.plusDays(1);
					                    }
			            			} catch (Exception e) {
			            				e.printStackTrace();
			            			}
				                	%>
			                    </tr>
			            </tbody>
			        </table>
					</div>
				</div>
				<button name="submitBtn" value="regis" id="btnDangKy" type="submit" class="btn btn-success" style="display: none;">Đăng ký</button>
				<button name="submitBtn" value="changeregis" id="btnChinhSua" type="submit" class="btn btn-primary" style="display: none;">Chỉnh sửa</button>
			</form>
			<%}else{%>
				<span class="text-center">Chưa tới thời gian đăng ký!</span>
				<br>
				<a href="index">		      		
	      			<button type="button" class="btn btn-success">Trang chủ</button>
		      	</a>
			<%}
    		%>
			
		</div>
	</div>
	
	
	<!-- Modal Success-->
	<div class="modal fade" id="staticBackdropSuccess" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      	<div class="modal-body">
	        	<div class="alert alert-success" role="alert">
	        		<span id="msgsuccess"></span>
				</div>			
			</div>
	      	<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<a href="index">		      		
	      			<button type="button" class="btn btn-success">Trang chủ</button>
		      	</a>
				
	      	</div>
	    </div>
	  </div>
	</div>
	<%
	    // Khởi tạo các mảng để chứa ngày đăng ký cho từng buổi
	    ArrayList<String> casang = new ArrayList<>();
	    ArrayList<String> cachieu = new ArrayList<>();
	    ArrayList<String> catoi = new ArrayList<>();

	    // Duyệt qua từng phần tử trong danh sách dsdk
	    for (int i = 0; i < dsdk.size(); i++) {
	        // Lấy ra ngày đăng ký và ca từ phần tử hiện tại
	        String ngayDK = dsdk.get(i).getNgayDK().toString();
	        String ca = dsdk.get(i).getMaLoaica(); // Trường maLoaica sẽ chứa các giá trị LC001, LC002, LC003

	        // Thêm ngày đăng ký vào mảng tương ứng với ca
	        if (ca.equals("LC001")) {
	            casang.add(ngayDK);
	        } else if (ca.equals("LC002")) {
	            cachieu.add(ngayDK);
	        } else if (ca.equals("LC003")) {
	            catoi.add(ngayDK);
	        }
	    }
		
	    // Khởi tạo chuỗi JSON cho casang
	    StringBuilder casangJson = new StringBuilder("[");
	    for (int i = 0; i < casang.size(); i++) {
	        casangJson.append("\"").append(casang.get(i)).append("\"");
	        if (i < casang.size() - 1) {
	            casangJson.append(",");
	        }
	    }
	    casangJson.append("]");

	    // Khởi tạo chuỗi JSON cho cachieu
	    StringBuilder cachieuJson = new StringBuilder("[");
	    for (int i = 0; i < cachieu.size(); i++) {
	        cachieuJson.append("\"").append(cachieu.get(i)).append("\"");
	        if (i < cachieu.size() - 1) {
	            cachieuJson.append(",");
	        }
	    }
	    cachieuJson.append("]");

	    // Khởi tạo chuỗi JSON cho catoi
	    StringBuilder catoiJson = new StringBuilder("[");
	    for (int i = 0; i < catoi.size(); i++) {
	        catoiJson.append("\"").append(catoi.get(i)).append("\"");
	        if (i < catoi.size() - 1) {
	            catoiJson.append(",");
	        }
	    }
	    catoiJson.append("]");	
	    // Tạo chuỗi JSON tổng cùng với các trường
	    String jsonString = "{";
	    jsonString += "\"casang\": " + casangJson.toString() + ", ";
	    jsonString += "\"cachieu\": " + cachieuJson.toString() + ", ";
	    jsonString += "\"catoi\": " + catoiJson.toString();
	    jsonString += "}";
	%>
</body>
</html>
<script >
	document.addEventListener("DOMContentLoaded", function() {
		  // Lấy giá trị của các thuộc tính từ request.getAttribute
		  var msgSuccess = "<%=msgSuccess%>";
		  // Kiểm tra nếu một trong hai giá trị 
		 if(msgSuccess.length > 0){
			// Lấy tham chiếu đến modal
			    var modalLogin = document.getElementById("staticBackdropSuccess");

			    // Khởi tạo modal bằng Bootstrap JavaScript
			    var myModal = new bootstrap.Modal(modalLogin, {
			      backdrop: 'static',
			      keyboard: false
			    });

			    // Hiển thị modal
			    myModal.show();
			    document.getElementById("msgsuccess").innerHTML = msgSuccess;
		  }
		});
	// Hàm để đặt dấu tick cho các ô checkbox đã được đăng ký và xử lý việc ẩn hiện checkbox dựa trên số lượng nhân viên đã đăng ký và số lượng tối đa nhân viên được đăng ký trong mỗi ca làm việc
function setCheckedState(dsdk) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(function(checkbox) {
        var date = checkbox.value;
        var session = checkbox.name;
        
        // Số lượng nhân viên đã đăng ký
        var countdklam = parseInt(checkbox.getAttribute("data-countdklam"));
        // Số lượng tối đa nhân viên được đăng ký trong mỗi ca
        var maxNhanVienMotCa = parseInt(checkbox.getAttribute("data-maxnvmotca"));

        if (dsdk[session] && dsdk[session].includes(date)) {
            // Đặt dấu tick cho ô checkbox đã được đăng ký
            checkbox.checked = true;
        }

        // Kiểm tra và ẩn hiện ô checkbox dựa trên số lượng nhân viên đã đăng ký và số lượng tối đa nhân viên được đăng ký trong mỗi ca làm việc
        if (countdklam >= maxNhanVienMotCa && !checkbox.checked) {
            checkbox.style.display = "none"; // Ẩn ô checkbox nếu đã đạt đến số lượng tối đa nhân viên được đăng ký trong mỗi ca
        } else {
            checkbox.style.display = "block"; // Hiện ô checkbox nếu chưa đạt đến số lượng tối đa nhân viên được đăng ký trong mỗi ca
        }
    });
}
	
	setCheckedState(<%= jsonString %>);	
	
    // Giả sử dsdk là một mảng JavaScript
    var dsdk = <%=dsdk.size()%>;
    // Kiểm tra giá trị của dsdk
    if (dsdk > 0) {
        // Ẩn nút Đăng ký
        document.getElementById("btnDangKy").style.display = "none";
        // Hiển thị nút Chỉnh sửa
        document.getElementById("btnChinhSua").style.display = "block";
    } else if(dsdk == 0){
        // Hiển thị nút Đăng ký
        document.getElementById("btnDangKy").style.display = "block";
        // Ẩn nút Chỉnh sửa
        document.getElementById("btnChinhSua").style.display = "none";
    }



</script>