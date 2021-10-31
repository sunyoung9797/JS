<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="width=device-width, initial-scale=1">
<title>공지사항 작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<jsp:include page="../home/header.jsp"/>
<body>
<div class="container">
	<div><h2>게시글 작성</h2></div><br>
	<div>
		<form id="frm" action="noticeInsert.do" method="post">
			<div class="form-group">
				<label for="id">아이디:</label>
				<input type="text" id="id" name="id" class="form-control">
			</div>
			<div class="form-group">
				<label for="name">작성자:</label>
				<input type="text" id="name" name="name" class="form-control">
			</div>
			<div class="form-group">
				<label for="writedate">작성일자:</label>
				<input type="date" id="writeDate" name="writeDate" class="form-control">
			</div>
			<div class="form-group">
				<label for="title">제목:</label>
				<input type="text" id="title" name="title" class="form-control"></td>
			</div>
			<div class="form-group">
				<label for="contents">내용:</label>
				<textarea rows="10" cols="55" id="contents" name="contents" class="form-control"></textarea>
			</div><br>
			<div>
				<input type="submit" value="저 장" class="btn btn-default">
				<input type="reset" value="취 소" class="btn btn-default">
				<input type="button" value="목 록" onclick="location.href='noticeList.do'" class="btn btn-default">
			</div>
		</form>
	</div>
</div>
</body>
</html>

