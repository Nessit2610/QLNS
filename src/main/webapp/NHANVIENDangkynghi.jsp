<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Đăng ký nghỉ phép:
	<br><br>
	ngày:
	<br>
	Ca:
	
	<%
	NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien"); 
	String dateString = (request.getAttribute("date")!=null?request.getAttribute("date").toString():"");
	String loaicaString = (request.getAttribute("loaica")!=null?request.getAttribute("loaica").toString():"");
	%>
	
</body>
</html>