<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="../logged_style/js/my_functions.js"></script>

<style type="text/css">
.users{
	padding:20px;
	margin: 200px 5% 100px 5%;
	width: 90%;
	height: auto;
	overflow: auto;
	background-color: #dbffc9;
	border-radius: 10px;
}
tr{
	height: 40px;
}

th{
	padding: 20px;
}

.row{
	padding: 20px;
}

.button{
	width:100%;  
	height: 100%; 
	background-color: #57b846; 
	color: white;
	margin: 0px;
	padding: 10px;
	border-radius: 5px;
	font-size: 22px;
	font-family: 'Roboto';
	font-style: oblique;
}
</style>
</head>
<body>
	<%@ include file="secretaryHeader.jsp" %>
	
	<c:if test="${not empty users }">
		<div class="users">
			<table id="users-results" border="1" style="width: 100%;">
				<tr>
					<th>Име</th>
					<th>Презиме</th>
					<th>Матични број</th>
					<th>Датум рођења</th>
					<th>Датум уплате чланарине</th>
					<th>Датум истека чланарине</th>
					<th>Износ</th>
					<th>Продужетак</th>
				</tr>
				<c:forEach var="user" items="${users }">
					<tr>
						<td class="row">${user.osoba.ime }</td>
						<td class="row">${user.osoba.prezime }</td>
						<td class="row">${user.osoba.jmbg }</td>
						<td class="row"><fmt:formatDate type="date" value="${user.osoba.datumRodjenja }"/></td>
						<td class="row"><fmt:formatDate type="date" value="${user.clanarina.odDatum }"/></td>
						<td class="row"><fmt:formatDate type="date" value="${user.clanarina.doDatum }"/></td>
						<td class="row">${user.clanarina.iznos } РСД</td>
						<td><a href="../secretaryController/membershipExtension?osobaId=${user.osoba.osobaId }"><div class="button">Продужетак чланарине</div></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	
	<c:if test="${not empty extensionUser }">
		<div id="extension" style="font-size: 20px; height: auto; padding: 30px;">
			<center>
				<form action="../secretaryController/updateMembership" method="post">
				<table>
					<tr>
						<th><label>Име:</label></th>
						<td><input type="text" name="name" value="${extensionUser.osoba.ime }" disabled="disabled"></td>
					</tr>
					<tr>
						<th><label>
						Презиме:
					</label></th>
						<td><input type="text" name="surname" value="${extensionUser.osoba.prezime }" disabled="disabled"></td>
					</tr>
					<tr>
						<th><label>
						ЈМБГ:
					</label></th>
						<td><input type="text" name="jmbg" value="${extensionUser.osoba.jmbg }" disabled="disabled"></td>
					</tr>
					<tr>
						<th><label>
						Данашњи датум:
					</label></th>
						<td><jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
					<input type="text" name="" value="<fmt:formatDate value="${now}" pattern="dd-MM-yyyy" />" disabled="disabled"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" class="button" value="Продужи чланарину"></td>
					</tr>
				</table>
					<input type="text" name="userId" value="${extensionUser.osoba.osobaId }" hidden onclick="">
				</form>
			</center>
		</div>
	</c:if>

	<%@ include file="secretaryFooter.jsp" %>
	<%@ include file="jqueryScripts.jsp" %>
</body>
</html>