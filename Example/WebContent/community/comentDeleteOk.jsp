<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.community.beans.*" %> 

<%	
	int cnt = (Integer)request.getAttribute("delete");
	int qno = (Integer)request.getAttribute("qno");
%>

<% if(cnt == 0) { %>
		<script>
			alert('댓글 삭제가 실패하였습니다.');
			history.back();
		</script>
<% } else { %>
		<script>
			alert('댓글 삭제가 성공하였습니다.');
			location.href = "view.community?no=<%= qno %>";
		</script>
<% } %>