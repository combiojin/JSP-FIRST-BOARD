<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="791757726383-etcgs6hn5pjnv67bphtm8jh5bl5r24vd.apps.googleusercontent.com">
<title>Custom Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function moveclose() {
		window.opener.top.location.href="singup.jsp"
		window.close();
	}
</script>
<style type="text/css">
input {
	border: 0;
	border-bottom: 1px solid black;
	text-align: center;
}

table {
	margin: auto;
}

h3 {
	text-align: center;
}

.div2 input {
	float: right;
}

.div3 {
	float: left;
}

.API {
	text-align: center;
	width: 150px;
	margin: auto;
}
.idsave {
	text-align: center;
	margin: 5px;
}
.login {
	border-radius: 50px; 
	margin: 10px;
	background: white;
	color: black;
	border: none;
	}
.login:hover{
	background-color: black;
	color: white;
}
.singup {
	border-radius: 50px; 
	margin: 10px;
	background: white;
	color: black;
	border: none;
}
.singup:hover{
	background-color: black;
	color: white;
}
.close {
	text-align: center;
}
.close1{
	border-radius: 50px; 
	margin: 10px;
	background: white;
	color: black;
	border: none;
}
.close1:hover{
	background-color: black;
	color: white;
}
</style>
<%
	Cookie[] cks = request.getCookies();
	String id = "";
	String ck = "";
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("idsave")) {
				id = cks[i].getValue();
				if (!id.equals("")) {
					ck = "checked";
				}
			}
		}
	}
%>
</head>
<body>
	<form action="joinProc.jsp">
		<div>
			<table>
				<tr>
					<td><h3>아이디</h3></td>
				</tr>
				<tr>
					<td><input type="text" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<td><h3>비밀번호</h3></td>
				</tr>
				<tr>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
		</div>
		<div class="idsave">
			<span>아이디 저장</span>
			<input type="checkbox" name="idsave" value="true" <%=ck%>><br>
			<input class="login" type="submit" value = "로그인">
			<input class="singup" type="button" value = "회원가입" onclick ="moveclose();">
			
		</div>
		<div class="close">
			<input class="close1" type="button" value = "닫기" onclick="window.close();">
			<h5>소셜 간편로그인</h5>
		</div>	
		<div class="div2"></div>
	</form>

	<!-- 카카오 로그인 API -->
	<div class="API">
		<div class="div3">
			<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
				src="image/kakao_login_btn_small.png" />
			</a>
			<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('9dd3e52028e7814866f3cc155e34a875');
				function loginWithKakao() {
					// 로그인 창을 띄웁니다.
					Kakao.Auth.login({
						success : function(authObj) {
							alert(JSON.stringify(authObj));
						},
						fail : function(err) {
							alert(JSON.stringify(err));
						}
					});
				};
				//]]>
			</script>
		</div>

		<!--  구글 로그인 API -->
		<div class="g-signin2" data-width="75" data-height="29"
			data-onsuccess="onSignIn" data-theme="dark"></div>
		<script>
			function onSignIn(googleUser) {
				// Useful data for your client-side scripts:
				var profile = googleUser.getBasicProfile();
				console.log("ID: " + profile.getId()); // Don't send this directly to your server!
				console.log('Full Name: ' + profile.getName());
				console.log('Given Name: ' + profile.getGivenName());
				console.log('Family Name: ' + profile.getFamilyName());
				console.log("Image URL: " + profile.getImageUrl());
				console.log("Email: " + profile.getEmail());
				// The ID token you need to pass to your backend:
				var id_token = googleUser.getAuthResponse().id_token;
				console.log("ID Token: " + id_token);
			}
		</script>
	</div>
</body>
</html>