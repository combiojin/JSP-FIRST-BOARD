<%@page import="com.cambio.board.memberDTO"%>
<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		out.println("회원가입에 성공하였습니다.");
	} else {
		out.println("회원가입에 실패하였습니다. 관리자에게 문의하세요.");
	}
%>