<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내정보</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
System.out.println(id);
if(id==null){
	response.sendRedirect("../MemberLogin.me");
}
else{
%>
<a href="../MemberModifyAction_1.me">회원정보수정</a>
<%
}
%>
</body>
</html>