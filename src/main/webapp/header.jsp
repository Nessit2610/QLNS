<%@page import="bean.NhanVienBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/ba968237f2.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<style>
	.required{
		color: red;
	}
</style>
<header style="position: fixed;z-index: 1;top:0; width: 100%; background: linear-gradient(to bottom, #93ccf6, #fff);" class="p-3 text-bg-light">
 <div class="row align-items-center">
 	<div class="col">
      	<div class="d-flex justify-content-start">
			<a href="index">
				<img alt="" src="assets/imgs/Logo.png" style="width: 62px;">
			</a>
      	</div>
 	</div>
      <div class="col">
        <div class="d-flex justify-content-end ">
          	<%
          	
          	String baoLoiUsername = request.getAttribute("baoLoiUsername")+"";
          	String baoLoiPassword = request.getAttribute("baoLoiPassword")+"";
          	String baoLoiRegister = request.getAttribute("baoLoiRegister")+"";
          	String baoLoiLogin = request.getAttribute("baoLoiLogin")+"";
          	
          	NhanVienBean nhanvien = (NhanVienBean)session.getAttribute("nhanvien");
				if(nhanvien != null){%>
				<a href="info"><button type="button" class="btn btn-outline-secondary me-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
					  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
					</svg> <%=nhanvien.getTenNV()%></button>
				</a>
				<a href="logout"><button type="button" style="color: #fff; background-color: #44b4f2 !important; border: 1px solid #44b4f2;" class="btn btn-danger">Đăng xuất <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
					  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
					</svg></button>
				</a>					
			<%}%>
        </div>
      </div>
    </div>
    
	</header>