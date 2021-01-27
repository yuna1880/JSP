<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//한글처리를 위한 설정??????????
	//request.setCharacterEncoding("UTF-8");
	URLEncoder.encode("UTF-8");
	//파라미터 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

<h2> 여기는 [ ex01_includee3_param.jsp ] 페이지 입니다.</h2>
<h2> 이름 : <%=name %></h2>
<h2> 나이 : <%=age %></h2>