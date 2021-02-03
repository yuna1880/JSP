<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	List<String> list = new ArrayList<>();
	list.add("홍길동-1");
	list.add("홍길동-2");
	list.add("홍길동-3");
	list.add("홍길동-4");
	pageContext.setAttribute("alist", list);
%>
	<h2>forEach 데이터  표시</h2>
	<c:forEach var="name" items="${alist }">
		${name }&nbsp;&nbsp;
	</c:forEach>
	<hr><hr>
	
	<h2>forEach varStatus : 상태값 저장 객체</h2>
	<ol>
		<c:forEach var="name" items="${alist }"
			varStatus="status" begin="0" end="${alist.size()-1 }" step="1">
			<li>
				var 값 : ${name }<br>
				${status.current }<br> <%-- 현재 처리중 데이터 --%>
				${status.count}<br> <%-- 현재 처리중 데이터의 건수 --%>
				${status.index}<br> <%-- 현재 처리중인 인덱스 번호 --%>
				first : ${status.first }<br>  <%-- 첫번째 데이터인지 t/f --%>
				last : ${status.last }<br>  <%-- 마지막 데이터인지 t/f --%>
				
				begin : ${status.begin }<br> <%-- begin 설정값 --%>
				end : ${status.end }<br> <%-- end 설정값 --%>
				step : ${status.step }<br> <%-- step 설정값 --%>
				
				status : ${status }
				
			</li>
		</c:forEach>
	</ol>
</body>
</html>