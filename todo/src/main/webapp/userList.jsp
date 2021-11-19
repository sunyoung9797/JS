<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>RESTful 웹서비스 클라이언트(JSON)</title>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" >
	
</script>
</head>
<body>
<div class="container">
	<form id="form1"  class="form-horizontal">
		<h2>사용자 등록 및 수정</h2>
		<div class="form-group">		
			<label >아이디:</label>
			<input type="text"  class="form-control" name="id" >
		</div>	
		<div class="form-group">
			<label>패스워드:</label>
			<input type="text"  class="form-control"  name="password" >
		</div>
		<div class="form-group">
			<label>이름:</label>
			<input type="text"  class="form-control"  name="name" >
		</div>			 
		<div class="form-group">   
			<label>역할:</label>
				<select class="form-control" name="role">
					   		<option value="Admin">관리자</option>
					   		<option value="User">사용자</option>
				</select>
		</div>  
		<div class="btn-group">      
				<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
				<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
				<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
		</div>
	</form>
</div>		
<hr/>		
<div class="container">	
	<h2>사용자 목록</h2>
	<table class="table text-center" id="myTable">
		<thead>
			<tr>
				<th class="text-center">아이디</th>
				<th class="text-center">패스워드</th>
				<th class="text-center">이름</th>
				<th class="text-center">롤</th>
				<th class="text-center">처리</th>
			</tr>
		</thead>
		<tbody>
			<!-- 들어갈곳 -->
		</tbody>
	</table>
</div>	
<script>
	//리스트 조회
	$.ajax({
		url : "./userList",
		method: "get",
		dataType : "json"
	}).done(result => {
		console.log(result);
		for(let list of result) {
			newElement(list);
		}
	})
	
	//함수
	function newElement(list) {
		var table = document.getElementById("myTable");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);

		cell1.innerHTML = list.id;
		cell2.innerHTML = list.password;
		cell3.innerHTML = list.name;
		cell4.innerHTML = list.role;

		cell1.className = "id";
		cell2.className = "password";
		cell3.className = "name";
		cell4.className = "role";

		var btn1 = document.createElement("button") 
		var btn2 = document.createElement("button") 

		cell5.appendChild(btn1);
		cell5.appendChild(btn2);
		btn1.className = "btnUpd";
		btn2.className = "btnDel";

		var upd = document.getElementsByClassName("btnUpd")[0];
		var del = document.getElementsByClassName("btnDel")[0];
		upd.innerHTML = "조회"
		del.innerHTML = "삭제"

		upd.addEventListener("click", function (ev) {
			updClick(list.id);
		})
		del.addEventListener("click", function () {
			var tr = this.parentElement;
			var id = tr.getAttribute('id');

			$.ajax({
				url: "./deleteUser",
				method: "get",
				data: { id: id },
				dataType: "json"
			}).done(() => {
				tr.remove();
			})
		})
				
	}

	function updClick(id) {
		console.log(event.target)
		tr = event.target.closest('tr');
		var ID = tr.firstChild.innerHTML;
		var PASSWORD = tr.querySelector('.password').innerHTML;
		var NAME = tr.querySelector('.name').innerHTML;
		var ROLE = tr.querySelector('.role').innerHTML;
		console.log(ROLE);
	
			$.ajax({
				url : "./users",
				method: "get",
				data: {id: id},
				dataType : "json"
			}).done(() => {
				document.querySelector('[name="id"]').value = ID;
				document.querySelector('[name="password"]').value = PASSWORD;
				document.querySelector('[name="name"]').value = NAME;
				document.querySelector('option').innerHTML = ROLE;

			})
		
	}

</script>
</body>
</html>