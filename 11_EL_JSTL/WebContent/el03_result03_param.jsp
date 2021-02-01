<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 화면 출력 - EL 사용 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param</title>
</head>
<body>
<%-- EL 사용시 파라미터 값은  scope에 저장하지 않고 사용 
	EL 제공 객체 중 param, paramValues 사용
--%>
	<h2>EL사용해서 form데이터 표시(param, paramValues)</h2>
	<p>이름(\${param.name }) : ${param.name }</p>
	<p>나이(\${param.age }) : ${param.age }</p>
	<p>성별(\${param.gender }) : ${param.gender }</p>
	
	<p>취미(\${param.hobby }) : ${param.hobby }</p>
	
	<p>취미(\${paramValues.hobby }) : ${paramValues.hobby }</p>
	<p>취미데이터(\${paramValues.hobby[0]... }) :
		${paramValues.hobby[0] }
		${paramValues.hobby[1] }
		${paramValues.hobby[2] }
		${paramValues.hobby[3] }
	</p>
	
	
	
</body>
</html>