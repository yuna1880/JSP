<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산하기</title>
</head>
<body>
	<h2>계산</h2>
	<p>[ <%=session.getAttribute("username") %>] 님 계산할 목록</p>
	<h2>계산할 품목</h2>
	<%-- ul,li 사용해서 장바구니 목록 출력! (실습)
			장바구니 없으면 : <p>계산할 품목이 없습니다 </p>
			장바구니 있으면 : ul,li 태그로 목록을 화면 출력
	--%>
<%
ArrayList<String> list = (ArrayList<String>) session.getAttribute("product_list");
	if (list == null || list.isEmpty()) { //장바구니 없을때
%>
<p>계산할 품목이 없습니다!! </p>	
<%	
	} else { //장바구니 있을때 장바구니 내역 출력!
		for (String str : list) {
			out.println("<ul>");
			out.println("<li>" + str + "</li>");
			out.println("</ul>");
		}
%>		
	<p><a href="ex03_logout.jsp">로그아웃</a>><p>
<%
}
%>		
</body>
</html>