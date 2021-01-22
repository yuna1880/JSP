<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	//로그인 성공여부 확인
	String login_chk = (String)session.getAttribute("login_chk");
	if (login_chk == null) { //속성자체가 설정되지 않은 상태 또는 null값 설정 -> 기본페이지 보여줌
%>
	<h1>로그인</h1>
	<form action="ex02_loginProc.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="text" name="pwd"></p>
		<input type="submit" value="로그인">
	</form>
<%
	//로그인 성공여부 확인
	} else { //login_chk 설정값이 있는 경우
		if ("ok".equals(login_chk)) { //로그인 성공인 경우
			String id = (String) session.getAttribute("id");
			out.print("<h2>로그인 성공!!!" + id + "님 환영합니다~!</h2>");
		} else { //로그인 실패
			out.print("<h2>로그인 실패!!!</h2>");
			session.invalidate(); //실패시 세션 무효화 + 재요청처리하기
			response.sendRedirect("ex02_loginMessage.jsp");
		}
	}	
%>
</body>
</html>