<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Планинарско друштво</title>
</head>
<body onload="document.getElementById('redirectButton').click()">
	<form action="loginController/isLoggedOsoba" method="post" hidden>
		<input type="submit" id="redirectButton">
	</form>
</body>
</html>