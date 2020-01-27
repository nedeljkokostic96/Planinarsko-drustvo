<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<%@ include file="secretaryHeader.jsp" %>
	<center>
		<div style="margin: 200px 0px;">
			<form action="../secretaryController/addNewMember" method="post">
				<table>
					<tr>
						<th><label>Име:</label></th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th><label>Презиме:</label></th>
						<td><input type="text" name="surname"></td>
					</tr>
					<tr>
						<th><label>ЈМБГ:</label></th>
						<td><input type="text" name="jmbg"></td>
					</tr>
					<tr>
						<th><label>Датум рођења:</label></th>
						<td><input type="date" name="birthDate"></td>
					</tr>
					<tr>
						<th><label>Телефон:</label></th>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<th><label>Датум:</label></th>
						<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
						<td><input type="text" name="date"
							value="<fmt:formatDate value="${now}" pattern="dd-MM-yyyy" />"
							disabled></td>
					</tr>
					<tr>
						<th><label>Шифра:</label></th>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="Додај члана"></td>
					</tr>
				</table>
			</form>
		</div>
	</center>


	<%@ include file="secretaryFooter.jsp" %>
	<%@ include file="jqueryScripts.jsp" %>
</body>
</html>