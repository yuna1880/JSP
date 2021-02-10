<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("Pdelete");
%>


<%
	if (cnt == 0) {
%>
<script>
	alert("삭제실패!!");
	history.back(); //브라우저가 기억하는 직전 페이지 (입력중 페이지)
</script>
<%
	} else {
%>
<script>
alert("삭제성공!!");
	location.href = "aProductList.y";
	</script>
<%
	}
%>




