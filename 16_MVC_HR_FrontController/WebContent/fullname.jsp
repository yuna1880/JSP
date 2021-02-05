<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름검색</title>
</head>
<body>
	<h2>이름으로 검색</h2>
	<!-- get방식은 기존의 주소창 type=fullname 값이 사라진다  
		그러므로, hidden으로 값을 같이 보내준다.
	-->
	<form action="controller" method="get">
		이름 : <input type="text" name="fullname">
		<input type="submit" value="이름으로 검색">
		<input type="hidden" name="type" value="fullnameList">
	</form>
</body>
</html>