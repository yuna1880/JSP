<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %> 

<%	// Controller로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("report");
	int Rqno = (Integer)request.getAttribute("Rqno");
	
%>

<% if(cnt == 0) { %>
		<script>
			alert('신고 등록이 실패하였습니다.');
			history.back();	// 브라우저가 직전에 직전 페이지(입력중 페이지로)
		</script>
<% } else { %>
		<script>
			alert('신고 등록이 되었습니다.');
			location.href = "view.community?no=<%= Rqno %>";
		</script>
<% } %>