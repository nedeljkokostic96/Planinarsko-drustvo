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

.form-elem{
	width: 200px;
	height: 40px;
}

.confirm-button{
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
	<%@ include file="userHeader.jsp" %>
	
	
	<div class="look-experiences" id="look-experiences-form">
		<c:if test="${not empty planine }">
			<div>
				<center>
					<form action="../userController/chosePlanina" method="get"
						id="mountainForm">
						<table>
							<tr>
								<th style="text-align: center;">Одаберите планину:</th>
								<td><select name="planinaId"
									style="max-width: 200px; min-width: 200px; height: 40px; border-radius: 3px;">
										<c:forEach var="item" items="${planine }">
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
	
	<c:if test="${not empty domovi and not empty znamenitosti }">
		<center>
			<div style="margin: 200px 0px;">
				<form action="../userController/saveReservation" method="post">
				<table>
					<tr>
						<th>Одаберите планинарски дом:</th>
						<td>
							<select name="planinarskiDomId" class="form-elem">
								<c:forEach var="dom" items="${domovi }">
									<option value="${dom.planinarskiDomId }">${dom.naziv }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>Датум почетка:</th>
						<td><input type="date" name="reservationStart" class="form-elem"></td>
					</tr>
					<tr>
						<th>Датум заврштека:</th>
						<td><input type="date" name="reservationEnd" class="form-elem"></td>
					</tr>
					<tr>
						<th>Одаберите знаменитост:</th>
						<td>
							<select name="znamenitostId" class="form-elem">
								<c:forEach var="znam" items="${znamenitosti }">
									<option value="${znam.znamenitostId }">${znam.naziv }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>Датум посјете знаменитости:</th>
						<td><input type="date" name="sightReservationDate" class="form-elem"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="Резервиши" class="confirm-button"></td>
					</tr>
				</table>
			</form>
			</div>
		</center>
	</c:if>		
	<%@ include file="userFooter.jsp" %>	
	<%@ include file="userScripts.jsp" %>
</body>
</html>