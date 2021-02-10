<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login 페이지</title>
</head>
<body>

   
	<% if(session.getAttribute("userid") != null){ %>					
		<h2>로그인 상태입니다 </h2>
		<form action="logout.jsp">
			<input type="submit" value="로그아웃"><br>
		</form>
	<% } else { %>
		<h2>로그인 상태가 아닙니다</h2>
		<form action="loginOk.jsp">
			id: <input type="text" name="userid"><br>
			pw: <input type="password" name="pw"><br>
			<input type="submit" value="로그인"><br>
		</form>		
	<%}%>

</body>
</html>



