<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리 설정
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째 페이지</title>
</head>
<body>
	<h1>두번째 페이지 #2</h1>
	전달받은 파라미터 값<br>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
</body>
</html>










