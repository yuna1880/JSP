<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지 (main)</h1>
	<a href="sub.jsp">서브 페이지로 이동</a>
	<h2>메인 페이지 내용</h2>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<hr>
	<%-- 디렉티브 (지시어, directive) include : copy & paste 적용됨 --%>
	<%-- 단순히 포함되어서 사용되어지는 파일은 확장자 jspf 사용 --%>
	<%@ include file="01_declaration.jspf" %>
	<%@ include file="02_scriptlet.jspf" %>
	<%@ include file= "footer.jspf" %>
	
</body>
</html>