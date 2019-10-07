<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function doCheck() {
		var id_length = document.getElementById("id").value.length;
		var pw_length = document.getElementById("pw").value.length;
		var repw_length = document.getElementById("repw").value.length;
		var name_length = document.getElementById("name").value.length;
		if(id_length < 1 ) {
			alert('아이디 입력하세요');
			return;
		} else if (pw_length < 1){
			alert('비밀번호 입력하세요');
			return;
		} else if (name_length <1) {
			alert('이름 입력하세요');
			return;
		} 
		
		if(document.getElementById("pw").value != document.getElementById("repw").value){
			alert('입력한 패스워드가 같지 않습니다');
			return;
		}
		
		document.getElementById("singupform").submit();
		
	}
	$(function(){
	    $("#age1").datepicker();
	});
</script>
<style>
	h2{
		text-align: center;
	}
	table{
		margin: auto;
	}
	h4 {
		text-align: center;
	}
	input{
		border: 0;
		border-bottom:1px solid black;
		text-align: center;
	}
	.div2{
		text-align: center;
		margin: 40px;
		padding: 10px; 
	}
	.div2 input{
		width: 100px;
		height: 40px;
		border-radius: 50px;
		border: none;
		background-color: black;
		color: white;
	}
	.div2 input:hover{
		background-color: white;
		color: black;
	}
	td {
		text-align: center;
	}
	select {
		width: 100%;
		height: 30px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<form action = "singupProc.jsp" id="singupform">
<h2>회원가입</h2>
	<div class = "div1">
		<table>
		<tr>
			<td><h4>아이디</h4></td>
		</tr>
		<tr>
			<td><input type = "text" name ="id" id="id"></td>
		</tr>
		<tr>
			<td><h4>비밀번호</h4></td>
		</tr>
		<tr>
			<td><input type = "password" name ="pw" id="pw"></td>
		</tr>
		<tr>
			<td><h4>비밀번호 확인</h4></td>
		</tr>
		<tr>
			<td><input type = "password" name ="repw" id="repw"></td>
		</tr>
		<tr>
			<td><h4>이름</h4></td>
		</tr>
		<tr>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td><h4>성별</h4></td>
		</tr>
		<tr>
			<td><select name="gender"><option value="남자">남자</option><option value="여자">여자</option></select></td>
		</tr>
		<tr>
			<td><h4>생년월일</h4></td>
		</tr>
		<tr>
			<td><input type="text" name="age" id="age1"></td>
		</tr>
		<tr>
			<td><h4>주소</h4></td>
		</tr>
		<tr>
			<td><input type = "text" name ="are"></td>
		</tr>
		<tr>
			<td><h4>전화번호</h4></td>
		</tr>
		<tr>
			<td><input type = "text" name ="phone"></td>
		</tr>
		<tr>
			<td><h4>E-mail</h4></td>
		</tr>
		<tr>
			<td><input type = "text" name ="mail"></td>
		</tr>
		</table>
	</div>
	<div class = "div2">
		<input type = "button" value = "가입" onclick="doCheck();">
		<input type = "button" value = "닫기" onclick="window.close();">
	</div>
</form>	
</body>
</html>