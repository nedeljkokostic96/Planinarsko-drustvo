<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../logged_style/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../logged_style/css/font-awesome.min.css">
<link rel="stylesheet" href="../logged_style/css/animate.css">
<link rel="stylesheet" href="../logged_style/css/overwrite.css">
<link href="../logged_style/css/animate.min.css" rel="stylesheet">
<link href="../logged_style/css/style.css" rel="stylesheet" />
</head>
<body>
	<header id="header">
		<nav class="navbar navbar-fixed-top" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Навигација</span> <span class="icon-bar"></span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#header">Планинарско друштво</a>
				</div>
				<div class="collapse navbar-collapse navbar-right">
					<ul class="nav navbar-nav">
						<li class="active"><a href="../user/indexUser"
							style="width: 120px; text-align: center; margin-right: 0px;">Почетна</a></li>
						<li class="active"><a href="../userController/getPlanine"
							style="width: 120px; text-align: center; margin-left: 5px;">Резервација</a></li>
						<li class="active"><a href="#"style="width: 120px; text-align: center; margin-left: 5px;">Стазе</a></li>
						<li class="active"><a href="#"style="width: 120px; text-align: center; margin-left: 5px;">Портал</a></li>
						<li class="active"><a href="../loginController/logOut"
							style="width: 120px; text-align: center; margin-left: 5px;"
							onclick="">Одјава</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!--/header-->
</body>
</html>