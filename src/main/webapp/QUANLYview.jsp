<%@page import="bean.DangKyLamBean"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@page import="bean.NhanVienBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<div class="d-flex justify-content-center">
	<div class="col-2 mt-5" style="margin-top: 8rem !important;" >
		<jsp:include page="QUANLYslidebar.jsp"></jsp:include>
	</div>
	<div class="col-10 mt-4" style="margin-top: 10rem !important;">
		<h2 class="text-center mb-4">Lịch trình tuần hiện tại</h2>
   		<div class="container-fluid col-10 mt-5">
	    	<%

	    			    	LocalDate currentDate = LocalDate.now();
	    		    		NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
	    			        // Tính toán ngày bắt đầu và kết thúc của tuần
	    			        LocalDate startOfWeek = currentDate.with(DayOfWeek.MONDAY);
	    			        LocalDate endOfWeek = currentDate.with(DayOfWeek.SATURDAY);
	    			        DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("EEEE", new Locale("vi", "VN"));
	    			        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	    	%>
	        <table class="table table-bordered">
	            <thead>
	                <tr>
	                	<%                	
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
	                    </tr>
	                    <tr>
	                    	 <%    
	                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
		                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
                        	try {
                        		
                        		ArrayList<DangKyLamBean> ds = (ArrayList<DangKyLamBean>)request.getAttribute("bdk");
			                	while (!startOfWeek.isAfter(endOfWeek)) {
			                		int n =0;
			                        String date = startOfWeek.toString();
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
							       	        		<a href="quanly?action=showemployeesworkingtogether&date=<%=date%>&lc=LC001">							       	        		
							       	        			Sáng
							       	        		</a>
								                    </th>
						                       
			        	        	<%
			                        startOfWeek = startOfWeek.plusDays(1);%>
			                        <%if(n==0){ %>
			            				<th style="width:14%" class="text-center">&nbsp;
					                    </th>
					                    <%} %>
			                  <%  }
	            			} catch (Exception e) {
	            				e.printStackTrace();
	            			}
		                	%>
	                    </tr>
	                    <tr>
	                    </tr>
	                    <tr>
	                    	 <%    
	                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
		                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
                        	try {
                        		ArrayList<DangKyLamBean> ds = (ArrayList<DangKyLamBean>)request.getAttribute("bdk");
			                	while (!startOfWeek.isAfter(endOfWeek)) {
			                		int n =0;
			                        String date = startOfWeek.toString();
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
							       	        			<a href="quanly?action=showemployeesworkingtogether&date=<%=date%>&lc=LC002">	       	        		
							       	        				Chiều
							       	        			</a>
								                    </th>
			        	        	<%
			                        startOfWeek = startOfWeek.plusDays(1);%>
			                        <%if(n==0){ %>
			            				<th style="width:14%" class="text-center">&nbsp;
					                    </th>
					                    <%} %>
			                  <%  }
	            			} catch (Exception e) {
	            				e.printStackTrace();
	            			}
		                	%>
	                    </tr>
	                    <tr>
	                    </tr>
	                    <tr>
                          <%    
	                    	startOfWeek = currentDate.with(DayOfWeek.MONDAY);
		                	// In ra các ngày từ thứ 2 đến thứ 7 của tuần
                        	try {
	            				
                        		ArrayList<DangKyLamBean> ds = (ArrayList<DangKyLamBean>)request.getAttribute("bdk");
			                	while (!startOfWeek.isAfter(endOfWeek)) {
			                		int n =0;
			                        String date = startOfWeek.toString();
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
														<a href="quanly?action=showemployeesworkingtogether&date=<%=date%>&lc=LC003">		       	        		
							       	        				Tối
							       	        			</a>
								                    </th>
			        	        	<%
			                        startOfWeek = startOfWeek.plusDays(1);%>
			                        <%if(n==0){ %>
			            				<th style="width:14%" class="text-center">&nbsp;
					                    </th>
					                    <%} %>
			                  <%  }
	            			} catch (Exception e) {
	            				e.printStackTrace();
	            			}
		                	%>
	                    </tr>
	            </tbody>
	        </table>
		</div>
	</div>
</div>	
</body>
</html>