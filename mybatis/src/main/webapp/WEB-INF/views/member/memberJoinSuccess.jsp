<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div align = "center">
	<div><h2>${message }</h2></div>
	<button type="button" onclick="location.href='memberLoginForm.do'">로그인</button>
</div>
</body>
</html>