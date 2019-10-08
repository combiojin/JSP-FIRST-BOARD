<%@page import="com.cambio.board.memberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.cambio.board.boardDBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.list {
		text-align: center;
		width: 100%;
	}
	table {
		text-align: center;
		margin: 20px auto;
	}
	td {
		width: 200px;
	}	

</style>
<%
	boardDBManager bdm = boardDBManager.getInstance();
	List list = bdm.doSelect();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="list">
		<h2>회원목록</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>E-MAIL</th>
			</tr>
<%
	for (int i = 0 ; i < list.size() ; i++) {
		memberDTO md = (memberDTO)list.get(i);
%>
			<tr>
				<td><%=md.getId() %></td>
				<td><%=md.getName() %></td>
				<td><%=md.getGender() %></td>
				<td><%=md.getAge() %></td>
				<td><%=md.getAre() %></td>
				<td><%=md.getPhone() %></td>
				<td><%=md.getMail() %></td>
			</tr>
<%
	}
%>
	</table>
	</div>

</body>
</html>