<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%
//실습 : 주문한 내역에 따라 계산하고 결과를 표시
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	int total;
	int leftMoney;
	String name = "";
	
	int coffee = Integer.parseInt(request.getParameter("coffee"));
	switch(coffee){
		case 1: coffee = 3000;
				name = "아메리카노";
				break;
		case 2: coffee = 3500;
				name = "카페모카";
				break;
		case 3: coffee = 2500;
				name = "에스프레소";
				break;
		case 4: coffee = 4000;
				name = "카페라떼";
				break;
	}
	
	//2. 연산처리
	total = coffee * su;
	leftMoney = money - total;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>주문 계산 결과</h2>
	<%-- 
	
	커피종류  : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가*수량)
	-------------------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
	
	--%>
	
	<h3>커피종류 : <%=name %> </h3>
	<h3>단가 : <%=coffee %></h3>
	<h3>수량 : <%=su %></h3>
	<h3>구입금액 : <%=total %></h3>
	<h3>-------------------------</h3>
	<h3>입금액 : <%=money %> </h3>
	<h3>잔액 : <%=leftMoney %></h3>
	
</body>
</html>