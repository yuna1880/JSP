<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종응답(리다이렉트)</title>
</head>
<body>

<%
	//전달받은 파라미터 값 추출 (redirect1 에서 받은 값이 없어서 null로 출력된다.)
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<h1>[ ex10_resp_redirect2.jsp ]</h1>
	<h3>ID : <%=id %></h3>
	<h3>PW : <%=pwd %></h3>
</body>
</html>