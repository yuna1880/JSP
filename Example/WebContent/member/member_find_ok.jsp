<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id=(String)request.getAttribute("id"); 
	String passwd=(String)request.getAttribute("passwd"); 
%>

<html lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<script>
function windowclose(){
	self.close();
}
</script>
</head>
<body>
<table style="width:450px; height:35px;">
	<tr><td align="left">
	<b>아이디/비밀번호 찾기</b>
	</td></tr>
</table>
	
<table style="width:440px;">
	<tr>
	<td>
	<div> 검색된 아이디/비밀번호입니다.</div>
	</td>
	</tr>
	<tr><td align="left">아이디 : <%=id %></td></tr>
	<tr><td align="left">비밀번호 : <%=passwd %></td></tr>
</table>

<table style="width:450px;">
	<tr>
		<td align="center">	
			<hr/><br><input type="button" value="닫기" onclick="windowclose()"/>
		</td>
	</tr>
</table>
</body>
</html>