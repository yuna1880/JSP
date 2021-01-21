<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 (scriptlet)</title>
</head>
<body>
	<h1>스크립트릿 (scriptlet)</h1>
	<h3>자바코드(실행문)을 작성하는 용도로 사용</h3>
	<%
	int a = 100;
	int b = 55;
	System.out.println(">>콘솔창에 출력");
	System.out.println("a+b : " + (a+b)); //콘솔창에 출력
	%>
	<%
	// JSP에서 제공하는 내장객체 OUT 사용
	// 서블릿 작성시 PrintWriter out = resp.getWriter();
	// 형태로 사용했던 out 객체라고 생각하면 된다.
	out.println("<hr>");
	out.println("<p>JSP에서 제공하는 out 객체를 통한 출력</p>");
	out.println("<h2>a + b : " + ( a + b ) + "</h2>");
	%>
</body>
</html>