<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>slider.jsp</title>
<link href="../logged_style/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../logged_style/css/font-awesome.min.css">
<link rel="stylesheet" href="../logged_style/css/animate.css">
<link rel="stylesheet" href="../logged_style/css/overwrite.css">
<link href="../logged_style/css/animate.min.css" rel="stylesheet">
<link href="../logged_style/css/style.css" rel="stylesheet" />
</head>
<body>
	<div class="slider">
		<div id="about-slider">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel"
				style="width: 100%;">
				<!-- Indicators -->
				<ol class="carousel-indicators visible-xs">
					<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-slider" data-slide-to="1"></li>
					<li data-target="#carousel-slider" data-slide-to="2"></li>
				</ol>

				<div class="carousel-inner">
					<div class="item active">
						<img src="../logged_style/img/7.jpg" class="img-responsive" alt=""
							style="width: 100%;">
						<div class="carousel-caption">
							<div class="wow fadeInUp" data-wow-offset="0"
								data-wow-delay="0.9s">
								<form class="form-inline"></form>
							</div>
						</div>
					</div>

					<div class="item">
						<img src="../logged_style/img/6.jpg" class="img-responsive" alt=""
							style="width: 100%;">
						<div class="carousel-caption">
							<div class="wow fadeInUp" data-wow-offset="0"
								data-wow-delay="1.6s">
								<form class="form-inline"></form>
							</div>
						</div>
					</div>
					<div class="item">
						<img src="../logged_style/img/1.jpg" class="img-responsive" alt=""
							style="width: 100%; height: 91vh;">
						<div class="carousel-caption">
							<div class="wow fadeInUp" data-wow-offset="0"
								data-wow-delay="0.9s">
								<form class="form-inline"></form>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control hidden-xs" href="#carousel-slider"
					data-slide="prev"> <i class="fa fa-angle-left"></i>
				</a> <a class=" right carousel-control hidden-xs"
					href="#carousel-slider" data-slide="next"> <i
					class="fa fa-angle-right"></i>
				</a>
			</div>
			<!--/#carousel-slider-->
		</div>
		<!--/#about-slider-->
	</div>
	<!--/#slider-->
</body>
</html>