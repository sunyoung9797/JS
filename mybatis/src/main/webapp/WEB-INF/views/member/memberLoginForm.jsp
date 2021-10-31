<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div align="center" class="container">
	<div><h2>로 그 인</h2></div><br>
	<div>
		<form id="frm" action="memberLogin.do" method="post">
			<div class="form-group">
				<table>
					<tr>
						<th width="100">아 이 디</th>
						<td width="200">
							<input class="form-control" type="text" id="id" name="id" required="required">
						</td>
					</tr>
					<tr>
						<th width="100">패스워드</th>
						<td width="200">
							<input class="form-control" type="password" id="password" name="password" required="required">
						</td>
					</tr>
				</table>
			</div><br>
			<input class="btn btn-default" type="submit" value="로그인">
		</form>
	</div>
</div>
</body>
</html>