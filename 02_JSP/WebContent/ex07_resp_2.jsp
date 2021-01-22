<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
//실습 : 주문한 내역에 따라 계산하고 결과를 표시
	int total;
	int leftMoney;
	String menu = "선택없음";
	//1. 주문확인 (파라미터 값 추출)
	int coffee = Integer.parseInt(request.getParameter("coffee"));
	int su = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	//2. 연산처리 (나)
	switch(coffee){
		case 1: coffee = 3000;
				menu = "아메리카노";
				break;
		case 2: coffee = 3500;
				menu = "카페모카";
				break;
		case 3: coffee = 2500;
				menu = "에스프레소";
				break;
		case 4: coffee = 4000;
				menu = "카페라떼";
				break;
	}
	//2. 연산처리 (선생님 버전)	
	/*
if ("1".equals(coffee)) {
		//System.out.println(coffee + " : 아메리카노, 3000원");
		menu = "아메리카노";
		coffee = 3000;
	} else if ("2".equals(coffee)) {
		menu = "카페모카";
		coffee = 3500;
	} else if ("3".equals(coffee)) {
		menu = "에스프레소";
		coffee = 2500;
	} else if ("4".equals(coffee)) {
		menu = "카페라떼";
		coffee = 4000;
	}*/

	//3. 결과출력 (구입금액, 잔액)
	total = coffee * su; //구입금액
	leftMoney = money - total; //잔액 = 입금액 - 구입총액
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 계산 결과</title>
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
<ul>
	<li>커피종류 : <%=menu %> </li>
	<li>단가 : <%=coffee %></li>
	<li>수량 : <%=su %></li>
	<li>구입금액 : <%=total %></li>
	<li>-------------------------</li>
	<li>입금액 : <%=money %></li>
	<li>잔액 : <%=leftMoney %></li>
</ul>	
</body>
</html>