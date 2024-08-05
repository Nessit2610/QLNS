<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/login.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
<style>
.red {
	color: red;
}
@font-face {
    font-family: MyCustomFont; /* Tên font bạn muốn sử dụng */
    src: url('assets/fonts/Avobold.ttf') format('ava');
    font-weight: normal;
    font-style: normal;
}
body {
    font-family: MyCystomFont, sans-serif;
    background-image: url(assets/imgs/BG.png);
    background-size: 100% 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

.pl-20 {
	padding-left: 20px !important;
}

.mt-20 {
	margin-top: 20% !important;
}

.lable-input {
	color: #a7beeb;
    font-size: 20px;
    font-weight: bold;
    padding-top: 12px !important;
}

.form-input {
	border-radius: 30px;
	box-shadow: 0.4rem 0.4rem .3rem rgba(0, 0, 0, 0.15) !important;
}

.form-input-position {
	width: 37%;
    margin: auto;
}

.form-btn {
	border-radius: 30px;
	width: 20% !important;
	font-weight: bold;
    font-size: 30px;
    padding: 4px;
    border: 3px solid #fff !important;
}
</style>
<!-- Custom styles for this template -->
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
String username = (request.getAttribute("tendangnhap")!=null)?request.getAttribute("tendangnhap").toString():"";
String baoloilogin = (request.getAttribute("baoloilogin")!=null)?request.getAttribute("baoloilogin").toString():"";
%>
</head>
<body >
	<div class="container mt-20">
		<main class="form-signin w-100 m-auto">
			<form class="text-center" action="login" method="POST">
				<input type="hidden" name="hanhDong" value="dang-nhap"/>
			
				<img class="mb-4" src="<%=url %>/img/logo/logo.png"
					alt="" width="72">
				<span class="required" id="msg-err-login"><%=baoloilogin%></span>
				<div class="form-floating mb-4 form-input-position">
					<input type="text" class="form-control form-input pl-20" id="tenDangNhap" value="<%=username%>"
						placeholder="Tên đăng nhập" name="tendangnhap"> <label class="pl-20 lable-input" for="tenDangNhap">Username</label>
				</div>
				<div class="form-floating mb-4 form-input-position">
					<input type="password" class="form-control form-input pl-20" id="matKhau" 
            			placeholder="Mật khẩu" name="matkhau"> <label class="pl-20 lable-input" for="matKhau">Password</label>
				</div>
				 <button class="btn btn-lg btn-primary form-btn" id="submit" disabled type="submit">Login</button>
				<!-- <a href="dangky.jsp">Đăng ký tài khoản mới</a> -->
				<p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
			</form>
		</main>
	</div>
</body>
</html>
 <script>
        function checkmatkhau() {
            var matkhau = document.getElementById("matKhau").value; // Lấy giá trị của trường mật khẩu
            if (matkhau.length > 0) {
                document.getElementById("submit").removeAttribute("disabled");
            } else {
                document.getElementById("submit").setAttribute("disabled", "disabled"); // Thêm thuộc tính disabled
            }
        }

        // Gắn sự kiện để gọi hàm checkmatkhau() mỗi khi có sự thay đổi trong trường mật khẩu
        document.getElementById("matKhau").addEventListener("input", checkmatkhau);
    </script>