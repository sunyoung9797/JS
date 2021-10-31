<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div align="center">
	<div><h2>나의 정보</h2></div><br>
	<div>
		<table class="table">
			<tr>
				<th>아 이 디</th>
				<th>이  름</th>
				<th>주  소</th>
				<th>전화번호</th>
			</tr>
			<tr>
				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.address }</td>
				<td>${member.tel }</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>