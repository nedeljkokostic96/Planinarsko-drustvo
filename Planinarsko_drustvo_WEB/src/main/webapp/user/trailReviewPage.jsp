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
.outer-div-trail {
	
}
</style>
</head>
<body>
	<%@ include file="userHeader.jsp"%>

	<c:if test="${not empty planineStaze }">
		<center>
			<div style="margin: 200px 0px;">
				<form action="../userController/getTrails">
					<table>
						<tr>
							<th>Одаберите планину:</th>
							<td><select name="planinaId">
									<c:forEach var="pl" items="${planineStaze }">
										<option value="${pl.planinaId }">${pl.naziv }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="submit" value="Пронађи"></td>
						</tr>
					</table>
				</form>
			</div>
		</center>
	</c:if>
	
	
	<c:if test="${not empty trails }">
		<c:forEach var="trail" items="${trails }">
			<div class="outer-div-trail">
				<center>
					<div style="border: 1px solid black;">
						<div style="width: 300px; height: 200px; border: 1px solid black;">
							<img alt=""
								src="../userController/showTrail?stazaId=${trail.stazaId }"
								style="width: 100%; height: 100%;">
						</div>
						<div style="width: 300px; height: 40px; border: 1px solid black;">
							${trail.naziv }</div>
					</div>
				</center>
				<center>
					<c:forEach var="sight" items="${trail.znamenitosts }">
						<div style="width: 100%; border: 1px solid black;">${sight.naziv } <a href="../userController/checkComment?znamenitostId=${sight.znamenitostId }">Додај коментар</a>
							<c:if test="${not empty commentAllowed }">
								<form action="../userControllor/saveComment" id="commForm" method="post" onclick="hiddeForm()">
									<table>
										<tr>
											<td>
												Текст:<textarea name="comment" form="commForm" placeholder="Текст"></textarea>
											</td>
										</tr>
										<tr>
											<td>
												<input type="submit" value="Пошаљи">
											</td>
										</tr>
									</table>
								</form>
							</c:if>
						</div>
					</c:forEach>
				</center>
			</div>
		</c:forEach>
	</c:if>

	<%@ include file="userFooter.jsp"%>
	<%@ include file="userScripts.jsp"%>
</body>
</html>