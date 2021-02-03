<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 제품번호, 수량 전달받아서 
	장바구니에 있는 데이터 수정 후 
	장바구니 보기 페이지로 이동. 
	- 카트 : 세션에 있는 cart 사용
	- 수량 변경 작업 -> cart에 있는 setQuant() 메소드 사용
	- 페이지 이동 : cartList.jsp
--%>

	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
	
<%
	//1. 제품번호, 수량 전달받기
	String pNum = request.getParameter("p_num");
	int su = Integer.parseInt(request.getParameter("su"));
	
	//2. 카트에서 수량 변경 작업
	cart.setQuant(pNum, su);
	//cart.setQuant2(pNum, su);
	
	//3. 페이지 이동
	response.sendRedirect("cartList.jsp");

%>
