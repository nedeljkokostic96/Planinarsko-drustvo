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
.result {
	padding: 20px;
	margin: 100px 10% 200px 10%;
	width: 60%;
	height: auto;
	overflow: auto;
	background-color: #dbffc9;
	border-radius: 10px;
	align-content: center;
}

.result th {
	padding: 20px 100px;
}

.result td {
	padding: 20px 100px;
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

.field{
		width:200px;
		height: 40px;
		border-radius: 5px;
	}

</style>
</head>
<body>
	<%@ include file="secretaryHeader.jsp" %>
	
	<c:if test="${not empty sights }">
		<center>
			<div style="margin: 200px 0px;">
				<form action="../secretaryController/getVisitDates" method="post">
				<table>
					<tr>
						<td><label>Одаберите знаменитост:</label></td>
						<td>
							<select name="sight" class="field">
								<c:forEach var="s" items="${sights }">
									<option value="${s.znamenitostId }">${s.naziv }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Пронађи" class="button"></td>
					</tr>
				</table>
			</form>
			</div>
		</center>
	</c:if>
	<c:if test="${not empty visitDates }">
		<center>
			<div class="result">
				<table border="1">
				<tr>
				<th>Термин посјете</th>
				<th>Посјетилац</th>
				</tr>
				<c:forEach var="date" items="${visitDates }">
					<tr>
						<td>
							${date.termin }
						</td>
						<td>
							${date.rezervacijaBean.osobaBean.ime } ${date.rezervacijaBean.osobaBean.prezime }
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</center>
	</c:if>
	
	<%@ include file="secretaryFooter.jsp" %>
	<%@ include file="jqueryScripts.jsp" %>
</body>
</html>