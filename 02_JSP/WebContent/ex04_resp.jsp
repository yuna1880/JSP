<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 전달받은 데이터(파라미터)를 화면 출력.
    // JSP에서 제공하는 내장객체 request사용 파라미터 값 추출.
    String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(응답) 전달받은 값 출력</title>
</head>
<body>
	<h2>(응답) 전달받은 값 출력</h2>
	<h3> 아이디 : <%=id %></h3>
	<h3> 아이디 : <%=pw %></h3>
</body>
</html>

