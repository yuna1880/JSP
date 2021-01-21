<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
//자바코드 작성 공간
//1. 전달받은 파라미터 추출
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
int kor = Integer.parseInt(request.getParameter("kor"));
int eng = Integer.parseInt(request.getParameter("eng"));
int math = Integer.parseInt(request.getParameter("math"));
//2. 총점, 평균 연산처리
int sum = kor + eng + math;
double avg = Math.round(sum * 100 / 3.0) / 100.0;
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 결과 - ex06_respose.jsp</title>
<style>
	table{ border-collapse : collapse; }
	th,td { width: 100px; border: 1px solid gray; padding: 10px; }
	th{ background-color: pink; }
</style>
</head>
<body>
	<h3>응답할 페이지 형식</h3>
	<h3>성적처리 결과 - JSP 응답</h3>
	<table border>
		<tr>
			<th>이름</th>
			<th><%=name %></th>
		</tr>
		<tr>
			<th>국어</th>
			<th><%=kor %></th>
		</tr>
		<tr>
			<th>영어</th>
			<th><%=eng %></th>
		</tr>
		<tr>
			<th>수학</th>
			<th><%=math %></th>
		</tr>
		<tr>
			<th>총점</th>
			<th><%=sum %></th>
		</tr>
		<tr>
			<th>평균</th>
			<th><%=avg %></th>
		</tr>
	</table>
</body>
</html>