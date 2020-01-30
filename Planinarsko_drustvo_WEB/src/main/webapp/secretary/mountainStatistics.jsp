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
<style type="text/css">
.stat {
	padding: 20px;
	margin: 200px 10% 100px 10%;
	width: 60%;
	height: auto;
	overflow: auto;
	background-color: #dbffc9;
	border-radius: 10px;
	align-content: center;
}

th {
	padding: 20px 100px;
}

td {
	padding: 20px 100px;
}
</style>
</head>
<body>
	<%@ include file="secretaryHeader.jsp"%>

	<c:if test="${not empty statistics }">
		<center>
			<div class="stat">
				<table border="1">
					<tr>
						<th>Планина</th>
						<th>Број ноћења</th>
					</tr>
					<c:forEach var="stat" items="${statistics }">
						<tr>
							<td>${stat.planina.naziv }</td>
							<td>${stat.nightsReserved }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</center>
	</c:if>

	<%@ include file="secretaryFooter.jsp"%>
	<%@ include file="jqueryScripts.jsp"%>
</body>
</html>