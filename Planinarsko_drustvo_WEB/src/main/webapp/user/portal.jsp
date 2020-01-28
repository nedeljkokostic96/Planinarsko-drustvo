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


	<center>
		<div style="padding: 200px 0px;">
			<form action="../userController/saveSlika" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>Изаберите sliku:</th>
						<td><input type="file" name="mpf" max=""><td> 
					</tr>
					<tr>
						<th>ИД искуства:</th>
						<td><input type="text" name="iskustvoString"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="Sacuvaj"></td>
					</tr>
				</table>
			</form>
		</div>
	</center>
	
			<c:if test="${not empty allPictures }">
				<center>
				<c:forEach var="picture" items="${allPictures }">
					<div style="margin: 10px 0px; border: 1px solid black; width: 50%; height: 40vh;">
					<img alt="" src="../userController/getImage?slikaId=${picture.slikaId }" style="width: 100%; height: 100%;">
				</div>
				</c:forEach>
			</center>
			</c:if>


	<%@ include file="userFooter.jsp" %>
	<%@ include file="userScripts.jsp" %>
</body>
</html>