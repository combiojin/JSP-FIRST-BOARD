<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function reload() {
		opener.parent.location.reload();
		window.close();
	}
</script>
<style>
	div button{
		width: 100px;
		height: 40px;
		border-radius: 50px;
		border: none;
		background-color: black;
		color: white;
	}
	div button:hover{
		background-color: white;
		color: black;
	}
	div {
		text-align: center;
	}
	h3 {
		text-align: center;
	}
</style>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	String checkvalue = request.getParameter("idsave");
	
	if(checkvalue != null) {
		//저장
		Cookie cookie = new Cookie("idsave", id);
		cookie.setMaxAge(1*60*60*24);
		response.addCookie(cookie);
	} else {
		Cookie cookie = new Cookie("idsave", "");
		cookie.setMaxAge(1*60*60*24);
		response.addCookie(cookie);
	}
	
	boardDBManager bdm = boardDBManager.getInstance();
	boolean result = bdm.checkLogin(id,pw);
	
	if( id == null )
		out.println("아이디를 입력하세요.");
	else if (pw == null)
		out.println("비밀번호를 입력하세요.");
	
	if(result == true ) {
		out.println("<h3>로그인에 성공하였습니다.<br> 확인 버튼 클릭시 메인페이지로 이동합니다.</h3><br>");
		session.setAttribute("login", "sce");
		session.setAttribute("id", id);
%>
	<div>
		<button onclick="reload();">확인</button>
	</div>
<%
	} else {
		out.println("<h3>아이디와 비밀번호를 확인하세요.<br> 확인버튼 클릭시 로그인 화면으로 이동합니다.</h3><br>");
%>
	<div>
		<button onclick="location.href='join.jsp';">확인</button>
	</div>
<%		
	}
%>