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
<title>Lịch làm tuần này</title>
 </head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<div style="margin-top: 65px;" class="row">
	<div class="col-2  mt-5">
		<jsp:include page="Slidebar.jsp"></jsp:include>
	</div>
	<div class="col-10 mt-4">
			 <h2 class="text-center mb-3">Lịch trình tuần hiện tại</h2>
   		<div class="container-fluid">
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
			            				for (DangKyLamBean bangdangkybean : ds) {
			            					if(bangdangkybean.getNgayDK().toString().equals(date)){%>
						                        <%if(bangdangkybean.getMaLoaica().equals("LC001")){
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
							       	        		<a href="nhanvien?action=showemployeesworkingtogether&date=<%=date%>&lc=<%=bangdangkybean.getMaLoaica()%>">							       	        		
							       	        			Sáng
							       	        		</a>
								                    </th>
						                        <%}%>
			            				<%}%>
			            				<% }%>
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
			            				for (DangKyLamBean bangdangkybean : ds) {
			            					if(bangdangkybean.getNgayDK().toString().equals(date)){%>
						                        <%if(bangdangkybean.getMaLoaica().equals("LC002")){
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
							       	        			<a href="nhanvien?action=showemployeesworkingtogether&date=<%=date%>&lc=<%=bangdangkybean.getMaLoaica()%>">	       	        		
							       	        				Chiều
							       	        			</a>
								                    </th>
						                        <%}%>
			            				<%}%>
			            				<% }%>
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
			            				for (DangKyLamBean bangdangkybean : ds) {
			            					if(bangdangkybean.getNgayDK().toString().equals(date)){%>
						                        <%if(bangdangkybean.getMaLoaica().equals("LC003")){
						                        n=1;%>
							       	        		<th style="width:14%" class="text-center">
														<a href="nhanvien?action=showemployeesworkingtogether&date=<%=date%>&lc=<%=bangdangkybean.getMaLoaica()%>">		       	        		
							       	        				Tối
							       	        			</a>
								                    </th>
						                        <%}%>
			            				<%}%>
			            				<% }%>
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
</body>
</html>