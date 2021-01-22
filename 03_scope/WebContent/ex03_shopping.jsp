<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 값 확인
	String name = request.getParameter("name");
	//페이지 전환시에도 계속 이름을 사용하기 위해서 session scope에 등록.
	session.setAttribute("username", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
	<h2>상품선택</h2>
	<hr>
	[<%=session.getAttribute("username") %>] 님 로그인 상태입니다.
	<hr>
	<form action="ex03_addList.jsp">
		<select name="product">
			<option selected disabled>::선택하세요</option>
			<option value="수박">수박</option>
			<option value="사과">사과</option>
			<option value="딸기">딸기</option>
			<option value="참외">참외</option>
			<option value="망고">망고</option>
		</select>
		<input type="submit" value="추가">
	</form>
	<p><a href="ex03_list_calc.jsp">계산하기</a></p>
	<p><a href="ex03_logout.jsp">로그아웃</a></p>
</body>
</html>