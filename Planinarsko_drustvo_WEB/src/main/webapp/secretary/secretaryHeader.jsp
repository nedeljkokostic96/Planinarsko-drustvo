<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<li class="active"><a href="../secretary/indexSecretary.jsp"
							style="width: 100px;">Почетна</a></li>
						<li><div>
								<a href="#" onclick="open_dropdown()" class="dropbtn"
									style="color: white;">Операције</a>
								<div id="myDropdown" class="dropdown-content">
									<a href="../secretaryController/getUsers">Сви чланови</a> 
									<a href="../secretary/newMember.jsp">Додај планинара</a>
									<a href="../secretaryController/getStatistics">Статистика ноћења</a>
									<a href="../secretaryController/getSights">Списак резервација знаменитости</a>
								</div>
							</div></li>
						<li class="active"><a href="../loginController/logOut"
							style="width: 100px; text-align: center; margin-left: 20px;"
							onclick="">Одјава</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>