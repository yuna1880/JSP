<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! //!!! 필드변수가 인스턴스 변수와는 다르게 작동한다.
	//! 선언부 / 필드영역에 작성되는 코드~!
	//필드변수, 메소드 선언시 사용
	int tot = 0; // 필드변수 선언
	private int sum(int a, int b){ //메소드 선언
		return a + b;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>declaration(선언부)</title>
</head>
<body>
	<h1>선언부(declaration)</h1>
	<h3>100 + 200 = 300</h3>
	
<%
	//service 메소드 안에 작성된다고 보면 된다.
	int a = 100;
	int b = 200;
	int sum = a + b;
%>
	<h3>100 + 200 = <%=sum %></h3>
	<hr>
	
	<h2>선언부의 메소드 사용</h2>
	<h3>sum(a,b) : 100+200 = <%=sum(a,b) %></h3>
	<%
		tot=sum(a,b);
	%>
	<h3>tot출력 : 100 + 200 = <%=tot %></h3>
	
</body>
</html>