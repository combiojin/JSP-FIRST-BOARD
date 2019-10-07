<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		out.println("로그인에 성공하였습니다. 확인 버튼 클릭시 메인페이지로 이동합니다.");
		session.setAttribute("login", "sce");
		session.setAttribute("id", id);
%>
	<div>
		<button onclick="location.href='home.jsp';">확인</button>
	</div>
<%
	} else {
		out.println("아이디와 비밀번호를 확인하세요. 확인버튼 클릭시 로그인 화면으로 이동합니다.");
%>
	<div>
		<button onclick="location.href='join.jsp';">확인</button>
	</div>
<%		
	}
%>