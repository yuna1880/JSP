<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호에 해당하는 품목을 장바구니에서 
		삭제처리 후 장바구니 페이지 이동 --%>
		
	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>

<% 
	//1. 전달받은 제품번호 확인
	String pNum = request.getParameter("p_num");
	
	//2. 카트에서 제품 삭제처리
	cart.delProduct(pNum);
	
	//3. 카트 페이지로 돌아가기 (cartList.jsp)
	response.sendRedirect("cartList.jsp");
	
%>