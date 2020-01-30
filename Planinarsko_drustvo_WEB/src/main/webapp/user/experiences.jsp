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
.chose-operation-outter {
	margin-top: 200px;
	margin-bottom: 100px;
	width: 100%;
	height: auto;
	text-align: center;
	height: auto;
}

.chose-operation-inner {
	border-radius: 3px;
	display: inline-block;
	margin: 0px 20px;
	padding: 10px;
	height: 42px;
	width: 200px;
	background: #57b846;
	border: 1px solid black;
	color: white;
	font-size: 18px;
	font-family: 'Roboto';
}

.add-experience {
	width: 100%;
	text-align: center;
	align-content: center;
	display: none;
	margin-bottom: 200px;
}

.look-experiences {
	width: 100%;
	text-align: center;
	align-content: center;
	display: none;
	margin-bottom: 200px;
}
.sekcija{
	text-align: center;
	padding: 10px;
	min-width: 60px;
	font-size: 40px;
	font-weight: 700;
	font-style: oblique;
	margin-bottom: 50px;
}
.experience-div{
	height: auto;
	border: 1px solid black; 
	width: 90%; 
	margin-bottom: 20px; 
	min-height: 300px; 
	background-color: #dbffc9;
	border-radius: 5px;
	padding: 10px;
}

td{
	height: auto;
	min-width: 200px;
	min-height: 200px;
}

.outter{
	width: 300px;
	max-width: 300px;
	height: 400px;
	margin: 0px;
	padding: 10px;
}
.image{
	border: 1px solid black;
	width: 200px;
	height: 200px;
	margin-left: 10px;
	border-radius: 10px;
}
.inner-top{
	margin: 0px;
	padding: 40px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 100%;
	height: 30%;
	text-align: center;
	font-size: 30px;
	font-family: 'Roboto';
}
.inner-bottom{
	margin: 0px;
	padding: 10px;
	border-right: 1px solid black;
	width: 100%;
	height: 70%;
	overflow: scroll;
	overflow-wrap: break-word;
	font-size: 18px;
	text-align: center;
	font-family: 'Roboto';
}
.image img{
	width: 100%;
	height: 100%;
	border-radius: 10px;
}

.exp-header{
	width: 300px;
	float: left;
}
.image:hover {
	width:400px;
	height: 400px;
    transition: 0.5s ease;
    -webkit-transition: 0.5s ease;
    -moz-transition: 0.5s ease;
    border-radius: 0px;
}
.image img:hover{
	border-radius: 0px;
}
</style>
<script type="text/javascript">
	function openMountainForm() {
		document.getElementById('look-experiences-form').style.display = "block";
		document.getElementById('add-experience-form').style.display = "none";
	}

	function openExperienceForm() {
		document.getElementById('look-experiences-form').style.display = "none";
		document.getElementById('add-experience-form').style.display = "block";
	}

	function closeExpDiv() {
		var str = window.location.pathname;
		var splited = str.split("/");
		var end = splited[splited.length - 1];
		//window.alert(end);
		if (end === "getAllMountains" || end === "getMyReservations") {
			document.getElementById('exper-div').style.display = "none";
		}
	}

	function funToCall() {
		var str = window.location.pathname;
		if (str.includes("/userController/getAllMountains")) {
			openMountainForm();
		}
		if (str.includes("/userController/getMyReservations")) {
			openExperienceForm();
		}
		closeExpDiv();
	}
</script>

</head>
<body onload="funToCall()">
	<%@ include file="userHeader.jsp"%>
	<center>
		<div class="chose-operation-outter">
			<a href="../userController/getAllMountains"
				onclick="openMountainForm();"><div class="chose-operation-inner">Прегледај
					искуства</div></a> <a href="../userController/getMyReservations"
				onclick="openExperienceForm();"><div
					class="chose-operation-inner">Постави искуство</div></a>
		</div>
	</center>


	<div class="add-experience" id="add-experience-form">
		<c:if test="${not empty reservations }">
			<div>
				<center>
					<form action="../userController/saveExperience" method="post"
						enctype="multipart/form-data" id="experienceForm"
						class="insert-experienxe-form">
						<table>
							<tr>
								<th>Посјета:</th>
								<td><select name="reservation"
									style="max-width: 255px; min-width: 255px; height: 40px; border-radius: 3px;">
										<c:forEach var="res" items="${reservations }">
											<option value="${res.rezervacijaId }">Од
												${res.odDatum } до ${res.doDatum  }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>Слика:</th>
								<td><input type="file" name="mpf"
									accept="image/jpeg, image/png"
									style="height: 40px; max-width: 255px; min-width: 255px; border: 1px solid grey; border-radius: 3px;">
							</tr>
							<tr>
								<th>Опис:</th>
								<td><textarea name="experienceText" form="experienceForm"
										placeholder="Искуство"
										style="max-width: 255px; min-width: 255px; border-radius: 3px;"></textarea></td>
							</tr>
							<tr>
								<td style="border: 0px;"></td>
								<td><input type="submit" value="Пошаљи"
									style="width: 255px; height: 40px; background-color: #57b846; color: white; padding: 0px; margin: 0px; font-size: 18px; border: 1px solid black; border-radius: 3px;"></td>
							</tr>
						</table>
					</form>
				</center>
			</div>
		</c:if>
	</div>


	<div class="look-experiences" id="look-experiences-form">
		<c:if test="${not empty mountains }">
			<div>
				<center>
					<form action="../userController/getExperiences" method="get"
						id="mountainForm">
						<table>
							<tr>
								<th style="text-align: center;">Планина:</th>
								<td><select name="planinaId"
									style="max-width: 200px; min-width: 200px; height: 40px; border-radius: 3px;">
										<c:forEach var="item" items="${mountains }">
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


	

		<c:if test="${not empty experiences }">
			<center>
				<div class="sekcija">${experiences.planina.naziv }</div>
				<c:forEach var="item" items="${experiences.iskustva }">
					<div class="experience-div">
						<table>
							<tr>
								<td class="exp-header"><div class="outter">
									<div class="inner-top">${item.rezervacijaBean.osobaBean.ime } ${item.rezervacijaBean.osobaBean.prezime }</div>
									<div class="inner-bottom">${item.iskustvo }</div>
								</div></td>
								<c:forEach var="image" items="${item.slikas }">
									<td><div class="image">
										<img alt="" src="../userController/getImage?slikaId=${image.slikaId }">
									</div></td>
								</c:forEach>
								<c:if test="${empty item.slikas }">
									<td><div class="image"><img alt="" src="../user/no_image.png"></div></td>
								</c:if>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</center>
		</c:if>

	<%@ include file="userFooter.jsp"%>
	<%@ include file="userScripts.jsp"%>

</body>
</html>