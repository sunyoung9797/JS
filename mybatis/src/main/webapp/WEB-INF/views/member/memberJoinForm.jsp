<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function CallValidation() {
		var pw = frm.password.value;
		var pw1 = frm.password1.value;
		
		if(frm.name.value == "") {
			alert("이름이 입력되지 않았습니다.");
			frm.name.focus();
			return false;
		}
		
		if (pw == pw1) {
			frm.submit();
		} else {
			alert("패스워드가 일치 하지 않습니다.");
			frm.password.value = "";
			frm.password1.value = "";
			frm.password.focus();
			return false;
		}
	}
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<jsp:include page="../home/header.jsp" />
<body>
<div align="center" class="container">
	<div><h2>회 원 가 입</h2></div><br>
	<div>
		<form id="frm" action="memberJoin.do" method="post">
			<div class="form-group">
				<table>
					<tr>
						<th width="150">아 이 디</th>
						<td width="200">
							<input class="form-control" type="text" id="id" name="id" required="required">
						</td>
					</tr>
					<tr>
						<th width="150">패스워드</th>
						<td width="200">
							<input class="form-control" type="password" id="password" name="password" required="required">
						</td>
					</tr>
					<tr>
						<th width="150">패스워드 확인</th>
						<td width="200">
							<input class="form-control" type="password" id="password1" name="password1" required="required">
						</td>
					</tr>
					<tr>
						<th width="150">이 름</th>
						<td width="200">
							<input class="form-control" type="text" id="name" name="name">
						</td>
					</tr>
					<tr>
						<th width="150">주 소</th>
						<td width="200">
							<input class="form-control" type="text" id="address" name="address">
						</td>
					</tr>
					<tr>
						<th width="150">전화번호</th>
						<td width="200">
							<input class="form-control" type="text" id="tel" name="tel">
						</td>
					</tr>
				</table>
			</div><br>
				<input class="btn btn-default" type ="hidden" id="author" name="author" value="USER">
				<input class="btn btn-default" type="button" value="회원가입" onclick="CallValidation()">&nbsp;&nbsp;&nbsp;
				<input class="btn btn-default" type="reset" value="취 소">
		</form>
	</div>
</div>
</body>
</html>