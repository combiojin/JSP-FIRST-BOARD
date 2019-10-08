<%@page import="com.cambio.board.memberDTO"%>
<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type ="text/css">
	h2{
	text-align: center;
	}
	h3{
		text-align: center;
	}
	input{
		width: 100px;
		height: 40px;
		border-radius: 50px;
		border: none;
		background-color: black;
		color: white;
			}
	input:hover{
		background-color: white;
		color: black;
	}
	div {
		text-align: center;
	}
</style>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String are = request.getParameter("are");
	String phone = request.getParameter("phone");
	String mail = request.getParameter("mail");
%>

<%
	memberDTO md = new memberDTO();
	md.setId(id);
	md.setPw(pw);
	md.setName(name);
	md.setGender(gender);
	md.setAge(age);
	md.setAre(are);
	md.setPhone(phone);
	md.setMail(mail);
	
	boardDBManager dbm = boardDBManager.getInstance();
	
	boolean result = dbm.doinsert( md );
	if(result) {
		out.println("<h2>회원가입에 성공하였습니다.</h2>");
%>
		<h2 ><%= id %>님 환영합니다.</h2>
		<h2>가입정보</h2>
		<h3>아이디 : <%= id %></h3>
		<h3>이름 : <%= name %></h3>
		<div>
		<input type ="button" value ="닫기" onclick="window.close()">
		</div>
<%
	} else {
		out.println("<h2>회원가입에 실패하였습니다. <br>관리자에게 문의하세요.</h2><br>");
%>
		<div>
		<h3>관리자 E-MAILE : yoba7788@naver.com</h3>
		<input type ="button" value ="닫기" onclick="window.close()">
		</div>
<%		
	}
%>