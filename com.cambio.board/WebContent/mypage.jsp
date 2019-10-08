<%@page import="com.cambio.board.memberDTO"%>
<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String id = (String)session.getAttribute("id");
	if(id == null || id.equals("")){
		out.println("로그인 해야 접근가능한 메뉴 입니다.");    		
	} else {
	// ID를 가지고 가서 한행의 데이터를 가지고 온다.
		boardDBManager bdm = boardDBManager.getInstance();
		memberDTO md = bdm.doSelectRow(id);
		out.println(md);
%>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="mypageProc.jsp">
	
	</form>
</body>
</html>