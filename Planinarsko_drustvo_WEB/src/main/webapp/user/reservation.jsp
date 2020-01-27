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
</head>
<body>
	<%@ include file="userHeader.jsp" %>
	
	<c:if test="${not empty planine }">
		<center>
			<div style="margin: 200px 0px;">
				<form action="../userController/chosePlanina">
					<table>
						<tr>
							<th>Одаберите планину:</th>
							<td>
								<select name="planinaId">
									<c:forEach var="pl" items="${planine }">
										<option value="${pl.planinaId }">${pl.naziv }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" value="Пронађи">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</center>
	</c:if>
	
	<c:if test="${not empty domovi and not empty znamenitosti }">
		<center>
			<div style="margin: 200px 0px;">
				<form action="">
				<table>
					<tr>
						<th>Одаберите планинарски дом:</th>
						<td>
							<select name="planinrskiDomId">
								<c:forEach var="dom" items="${domovi }">
									<option value="${dom.planinarskiDomId }">${dom.naziv }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>Датум почетка:</th>
						<td><input type="date" name="reservationStart"></td>
					</tr>
					<tr>
						<th>Датум заврштека:</th>
						<td><input type="date" name="reservationEnd"></td>
					</tr>
					<tr>
						<th>Одаберите знаменитост:</th>
						<td>
							<select name="znamenitostId">
								<c:forEach var="znam" items="${znamenitosti }">
									<option value="${znam.znamenitostId }">${znam.naziv }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>Датум посјете знаменитости:</th>
						<td><input type="date" name="sightReservationDate"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="Резервиши"></td>
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