<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
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
.outter-div-trail {
	height: auto;
	border: 1px solid black;
	width: 90%;
	margin-bottom: 20px;
	margin-top: 100px;
	min-height: 400px;
	background-color: #dbffc9;
	border-radius: 5px;
	padding: 10px;
	overflow: auto;
	min-height: 400px;
}

.sight {
	widows: 100%;
	height: 100%;
	border: 1px solid black;
	margin: 10px;
}

.details {
	display: block;
	width: 100%;
	height: auto;
	border: 1px solid black;
	float: left;
	overflow: auto;
}

.comments {
	width: 90%;
	height: auto;
	display: block;
	float: left;
	overflow: auto;
	margin: 30px 5%;
}

.images {
	width: 100%;
	overflow: auto;
}

.image {
	margin-left: 20px;
	display: inline-block;
	padding: 0px;
	width: 200px;
	height: 200px;
	overflow: auto;
	border: 1px solid black;
	border-radius: 5px;
}

.image:hover{
	width: 400px;
	height: 400px;
	transition: 0.5s ease;
	-webkit-transition: 0.5s ease;
	-moz-transition: 0.5s ease;
	border-radius: 0px;
}

.sight-det {
	border-top: 1px solid black;
	padding: 20px 0px 50px 0px;
	overflow: auto;
	overflow-wrap: word-break;
	text-align: justify, center;
	font-size: 20px;
	font-family: 'Roboto';
	font-style: oblique;
	font-weight: 500;
	overflow: auto;
}

.one-comment {
	padding: 0px;
	width: 100%;
	height: auto;
	overflow: auto;
	margin-top: 20px;
	border: 1px solid black;
	border-radius: 10px;
}

.author {
	border-right: 1px solid black;
	width: 30%;
	height: auto;
	overflow: auto;
	padding: 20px;
	margin: 0px;
	display: inline-block;
	float: left;
	overflow-wrap: word-break;
	text-align: justify, center;
	font-size: 20px;
	font-family: 'Roboto';
	font-style: oblique;
	font-weight: 500;
}

.comment-body {
	width: 70%;
	height: auto;
	overflow: auto;
	padding: 20px;
	margin: 0px;
	display: inline-block;
	overflow-wrap: word-break;
	text-align: justify, center;
	font-size: 20px;
	font-family: 'Roboto';
	font-style: oblique;
	font-weight: 500;
	float: left;
}

.insert-comm{
	display: block;
	width: 100%;
	height: auto;
	padding: 20px;
	margin: 30px 0px;
	align-items: center;
	overflow: auto;
}
.comment-button{
	width: 200px; 
	padding: 0px 0px 2px 0px; 
	margin: 0px; 
	height: 40px; 
	font-size: 20px; 
	font-style: oblique; 
	font-family: 'Roboto'; 
	font-weight: 700; 
	color: white;
	border-radius: 5px;
	background-color: #57b846;
	border-color: #57b846;
}

.area{
	max-width: 600px; 
	min-width: 600px; 
	min-height: 40px;
	height: 40px; 
	border-radius: 5px;
}

.time-combo{
	width: 200px; 
	padding: 0px; 
	margin: 0px; 
	height: 40px; 
	font-size: 20px; 
	font-style: oblique; 
	font-family: 'Roboto'; 
	font-weight: 700; 
	color: white;
	border-radius: 5px;
	background-color: #57b846;
	border-color: #57b846;
}
</style>
</head>
<body>
	<%@ include file="userHeader.jsp"%>

	<c:if test="${not empty trailDetail }">
		<center>
			<c:forEach var="sight" items="${trailDetail.znamenitosts }">
				<div class="outter-div-trail">
					<div class="details">
						<div class="images">
							<c:forEach var="img" items="${sight.slikas }">
								<div class="image">
									<img alt=""
										src="../userController/getImage?slikaId=${img.slikaId }"
										style="width: 100%; height: 100%; margin: 0px; border-radius: 5px;">
								</div>
							</c:forEach>
						</div>
						<div class="sight-det">
							<b>${sight.naziv }</b><br> ${sight.opis }
						</div>
					</div>
					<center>
						<div class="comments">
							<div
								style="margin: 20px; padding: 20px; font-size: 40px; font-family: 'Roboto'; font-style: oblique; font-weight: 700;">Коментари</div>
							<c:set var="hasComment" value="false"></c:set>
							<c:forEach var="comm" items="${sight.posjetas }">
								<c:if test="${not empty comm.komentar }">
									<center>
										<div class="one-comment">
											<div class="author">${comm.rezervacijaBean.osobaBean.ime }
												${comm.rezervacijaBean.osobaBean.prezime }</div>
											<div class="comment-body">${comm.komentar }</div>
										</div>
									</center>
								</c:if>
								<c:if test="${comm.rezervacijaBean.osobaBean.osobaId == osoba.osobaId }">
								<c:set var="hasComment" value="true"></c:set>
								</c:if>
							</c:forEach>
							<c:if test="${hasComment == true }">
								<div class="insert-comm">
										<form action="../userController/saveComment" id="comment-form" method="post">
											<table>
												<tr>
													<td>
														<select name="posjetaId" class="time-combo">
															<c:forEach var="item" items="${sight.posjetas }">
																<c:if test="${item.rezervacijaBean.osobaBean.osobaId == osoba.osobaId  }">
																	<option value="${item.posjetaId }">${item.termin}</option>																
																</c:if>
															</c:forEach>
														</select>
													</td>
													<td style="padding: 14px 0px 10px 0px;">
														<textarea form="comment-form" name="comment" class="area" placeholder="Коментар..."></textarea>
													</td>
													<td style="padding: 10px 0px;">
														<input type="submit" value="Додај коментар" class="comment-button">
													</td>
												</tr>
											</table>
										</form>
									</div>
							</c:if>
						</div>
					</center>
				</div>
			</c:forEach>
		</center>
	</c:if>

	<%@ include file="userFooter.jsp"%>
	<%@ include file="userScripts.jsp"%>
</body>
</html>