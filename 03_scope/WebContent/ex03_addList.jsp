<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 품목을 장바구니(list)에 담고 쇼핑페이지로 되돌아가기 --%>
<%
	//1. 전달받은 데이터 확인
	String product = request.getParameter("product");
	//2. 장바구니에 담기
	//세션에 있으면 사용하고, 없으면 리스트 추가.
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("product_list");
	if (list == null) {
		list = new ArrayList<String>(); // 맨처음 목록(장바구니) 만들기
		session.setAttribute("product_list", list); //최초 세션에 목록 저장
	}
	list.add(product); //목록 장바구니에 추가
	System.out.println("list : " + list);
%>
<script>
	//3. 페이지 전환
	alert("[<%=product%>] 추가되었습니다.");
	history.go(-1); //이전 페이지로 이동 - history.back();
</script>
