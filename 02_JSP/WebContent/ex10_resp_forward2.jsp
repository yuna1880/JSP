<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 값 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 응답 페이지</title>
</head>
<body>
	<h1>[ ex10_resp_forward2.jsp ]</h1>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
</body>
</html>