<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("update");
	int no = Integer.parseInt(request.getParameter("no"));
%>  

<% if(cnt == 0){ %>
	<script>
		alert('게시글 수정이 실패되었습니다.');
		history.back();
	</script>
<% } else { %>
	<script>
		alert('게시글 수정이 성공되었습니다.');
		location.href = "view.community?no=<%= no %>";
	</script>
<% } %>