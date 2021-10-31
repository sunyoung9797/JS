<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 목록</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div align="center">
	<div><h2>멤버 목록</h2></div><br>
	<div>
		<table class="table table-striped">
			<tr>
				<th width="100">아 이 디</th>
				<th width="100">패스워드</th>
				<th width="100">이  름</th>
				<th width="200">주  소</th>
				<th width="150">전화번호</th>
			</tr>
			<c:forEach items = "${members }" var = "member">
				<tr>
					<td>${member.id }</td>
					<td>${member.password }</td>
					<td>${member.name }</td>
					<td>${member.address }</td>
					<td>${member.tel }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>