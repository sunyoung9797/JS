<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div align="center">
	<div><h1>나의 정보</h1></div>
	<div>
		<table border ="1">
			<tr>
				<th width="100">아 이 디</th>
				<th width="100">이  름</th>
				<th width="100">주  소</th>
				<th width="100">전화번호</th>
			</tr>
			<tr align="center">
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