<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Планинарско друштво</title>

<!-- Bootstrap -->
<link href="../logged_style/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../logged_style/css/font-awesome.min.css">
<link rel="stylesheet" href="../logged_style/css/animate.css">
<link rel="stylesheet" href="../logged_style/css/overwrite.css">
<link href="../logged_style/css/animate.min.css" rel="stylesheet">
<link href="../logged_style/css/style.css" rel="stylesheet" />
<style type="text/css">
.look-experiences {
	width: 100%;
	text-align: center;
	align-content: center;
	margin: 200px 0px;
}

.outer-div-trail {
	height: auto;
	border: 1px solid black;
	width: 90%;
	margin-bottom: 20px;
	min-height: 200px;
	background-color: #dbffc9;
	border-radius: 5px;
	padding: 10px;
	overflow: auto;
}

.trail-map {
	width: 200px;
	height: 200px;
	border: 1px solid black;
}

.trail-map:hover {
	width: 400px;
	height: 400px;
	transition: 0.5s ease;
	-webkit-transition: 0.5s ease;
	-moz-transition: 0.5s ease;
	border-radius: 0px;
}

.show-trail-button {
	width: 40%;
	height: 100px;
	border: 1px solid black;
	border-radius: 10px;
	background-color: #57b846;
	color: white;
}
.content{
	width: 70%; 
	float: left; 
	display: inline-block;
	font-size: 20px;
	overflow: auto;
}
td{
	padding: 10px 10px;	
}

.button{
	border: 1px solid black;
	width: 200px;
	height: 40px;
	background-color: #57b846;
	border-radius: 5px;
	margin: 0px;
	padding: 10px;
	color: white;
	font-size: 20px;
	font-family: 'Roboto';
}
</style>
</head>
<body>
	<%@ include file="userHeader.jsp"%>

	<div class="look-experiences" id="look-experiences-form">
		<c:if test="${not empty planineStaze }">
			<div>
				<center>
					<form action="../userController/getTrails" method="get"
						id="mountainForm">
						<table>
							<tr>
								<th style="text-align: center;">Одаберите планину:</th>
								<td><select name="planinaId"
									style="max-width: 200px; min-width: 200px; height: 40px; border-radius: 3px;">
										<c:forEach var="item" items="${planineStaze }">
											<option value="${item.planinaId }">${item.naziv }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td style="border: 0px;"></td>
								<td><input type="submit" value="Пронађи"
									style="width: 200px; height: 40px; background-color: #57b846; color: white; padding: 0px; margin: 0px; font-size: 18px; border: 1px solid black; border-radius: 3px;"></td>
							</tr>
						</table>
					</form>
				</center>
			</div>
		</c:if>
	</div>


	<c:if test="${not empty trails }">
		<c:forEach var="trail" items="${trails }">
			<center>
				<div class="outer-div-trail">
					<div
						style="border-right: 1px solid black; width: 30%; float: left;">
						<div class="trail-map">
							<img alt=""
								src="../userController/showTrail?stazaId=${trail.stazaId }"
								style="width: 100%; height: 100%;">
						</div>
					</div>
					<div class="content">
						<table style="float: left; margin: 10px 20px; padding: 0px;">
							<tr>
								<td style="padding: 10px;">Назив стазе: ${trail.naziv }</td>
							</tr>
							<tr>
								<td style="padding: 10px;">Тежина стазе: ${trail.tezina }*</td>
							</tr>
							<tr>
								<td style="padding: 10px;">
									<a href="../userController/trailDetails?stazaId=${trail.stazaId }"><div class="button">Погледај детаљније</div></a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</center>
		</c:forEach>
	</c:if>



	<%@ include file="userFooter.jsp"%>
	<%@ include file="userScripts.jsp"%>
</body>
</html>