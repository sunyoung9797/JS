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

	<script type="text/javascript">

	</script>
</head>

<body>
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">
				<label>아이디:</label>
				<input type="text" class="form-control" name="id">
			</div>
			<div class="form-group">
				<label>패스워드:</label>
				<input type="text" class="form-control" name="password">
			</div>
			<div class="form-group">
				<label>이름:</label>
				<input type="text" class="form-control" name="name">
			</div>
			<div class="form-group">
				<label>역할:</label>
				<select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록" id="btnInsert" />
				<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" />
				<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>사용자 목록</h2>
		<table class="table text-center">
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
			url: "./userList",
			method: "get",
			dataType: "json"
		}).done(result => {
			console.log(result);
			for (let list of result) {
				newElement(list);
			}
		})

		//리스트 추가함수
		function newElement(list) {
			var tbody = document.getElementsByTagName("tbody")[0];
			var row = tbody.insertRow(-1);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);

			row.setAttribute('data-id', list.id);
			row.className = list.id;

			cell1.innerHTML = list.id;
			cell2.innerHTML = list.password;
			cell3.innerHTML = list.name;
			cell4.innerHTML = list.role;

			cell1.className = "id";
			cell2.className = "password";
			cell3.className = "name";
			cell4.className = "role";

			var upd = document.createElement("button")
			var del = document.createElement("button")

			cell5.appendChild(upd);
			cell5.appendChild(del);
			upd.className = "btnUpd";
			del.className = "btnDel";

			upd.innerHTML = "조회"
			del.innerHTML = "삭제"

			upd.addEventListener("click", function () {
				updClick(list.id);
			})
			del.addEventListener("click", function () {
				if (confirm("삭제할까요?")) {
					var tr = this.closest('tr');
					var id = tr.getAttribute('data-id');

					$.ajax({
						url: "./deleteUser",
						method: "get",
						data: {
							id: id
						}
					}).done(() => {
						tr.remove();
					})
				}
			})

		}

		//목록에서 폼으로 정보뜨게하기
		function updClick(id) {
			console.log(id);
			$.ajax({
				url: "./users",
				method: "get",
				data: {
					id: id
				},
				dataType: "json"
			}).done(result => {
				console.log(result);
				//console.log(result.id);
				document.querySelector('[name="id"]').readOnly = true;
				document.querySelector('[name="id"]').value = result.id;
				document.querySelector('[name="password"]').value = result.password;
				document.querySelector('[name="name"]').value = result.name;
				document.querySelector('[name="role"]').value = result.role;
				/*opt = document.querySelectorAll('option');
				console.log(opt.value);
				console.log(opt[0].value);
				console.log(opt[1].value);
				console.log(result.role);
				if(result.role == "Admin") {
					opt[0].setAttribute('selected', '');
				}
				if(result.role == "User") {
					opt[1].setAttribute('selected', '');
				} */
			})
		}
		
		// 수정기능
		var btnUpdate = document.getElementById("btnUpdate");
		btnUpdate.addEventListener("click", function () {
			var id = document.querySelector('[name="id"]').value;
			var password = document.querySelector('[name="password"]').value;
			var name = document.querySelector('[name="name"]').value;
			var role = document.querySelector('[name="role"]').value;
			fetch("./updateUser", {
				method: 'POST',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded',
				},
				body: "id=" + id + "&password=" + password + "&name=" + name + "&role=" + role
			})
			.then(response => response.json())
			.then(result => {
				console.log(result);
				console.log(result.id);
				console.log(id);
				var tr = document.getElementsByClassName(id)[0];
				console.log(tr);
				if (tr.getAttribute("data-id") == id) {
					tr.querySelector(".password").innerHTML = result.password;
					tr.querySelector(".name").innerHTML = result.name;
					tr.querySelector(".role").innerHTML = result.role;
					Init();
				}
			})
		})

		//초기화
		var btnInit = document.getElementById("btnInit");
		btnInit.addEventListener("click", function () {
			Init();
		})
		
		//초기화함수
		function Init() {
			document.querySelector('[name="id"]').readOnly = false;
			document.querySelector('[name="id"]').value = "";
			document.querySelector('[name="password"]').value = "";
			document.querySelector('[name="name"]').value = "";
			document.querySelector('[name="role"]').value = "";
		}

		
		//등록
		var btnInsert = document.getElementById("btnInsert");
		btnInsert.addEventListener("click", function () {
			//수정버튼가리고 저장버튼보이게
			var btnUpdate = document.getElementById("btnUpdate");
			btnUpdate.style.display = "none";
			var save = document.createElement("button");
			btnInsert.after(save);
			save.innerHTML = "저장";
			save.className = "btn btn-primary";
			var input = document.getElementsByClassName("form-control");
			console.log(input);
			for (i = 0; i < input.length; i++) {
				if (input[i].value == '') {
					alert('입력하세요');
					return
				}
			}

			var id = document.querySelector('[name="id"]').value;
			var password = document.querySelector('[name="password"]').value;
			var name = document.querySelector('[name="name"]').value;
			var role = document.querySelector('[name="role"]').value;

			fetch("./insertUser", {
					method: 'POST',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded',
					},
					body: "id=" + id + "&password=" + password + "&name=" + name + "&role=" + role
				})
				.then(response => response.json())
				.then(result => {
					console.log(result);
					newElement(result);
				})
		})
	</script>
</body>

</html>