<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Почетна страна</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/index_style/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index_style/css/main.css">
	
	
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" method="POST" action="../loginController/logIn">
					<span class="login100-form-title">
						Пријава
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="Унесите корисничко име">
						<input class="input100" type="text" name="jmbg" placeholder="ЈМБГ" min="13" max="13">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Унесите шифру">
						<input class="input100" type="password" name="password" placeholder="Шифра" >
						<span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Улогуј се
						</button>
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<!--===============================================================================================-->
	<script src="index_style/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="index_style/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="index_style/vendor/bootstrap/js/popper.js"></script>
	<script src="index_style/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="index_style/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="index_style/vendor/daterangepicker/moment.min.js"></script>
	<script src="index_style/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="index_style/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="index_style/js/main.js"></script>

</body>
</html>