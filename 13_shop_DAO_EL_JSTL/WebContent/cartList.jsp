<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 장바구니 (cart)에 있는 제품목록 화면에 표시 --%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
<!-- 카트에서 목록 꺼내기 -->
<%-- <c:set var="list" value="${cart.getList() }" ></c:set> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="css/menu.style.css" type="text/css">
<link rel="stylesheet" href="css/cart.style.css" type="text/css">

</head>
<body>
	<!-- 메뉴 파일 -->
	<%@ include file="common/menu.jspf" %>
	
	<%-- 카트내용 표시 --%>
	<table>
		<thead>
			<tr>
				<td colspan="6"> Current Cart </td>
			</tr>
			<tr>
				<th>Product Number</th>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Total Number</th>
				<th>Product Price</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>

		<%-- 데이터가 없으면 메세지 출력 --%>
		<c:if test="${empty cart.list }">
			<tr>
				<td colspan="6"><br><br>★ 장바구니가 비었습니다. 상품을 담아주세요.★<br><br><br></td>
			</tr>	
		</c:if>

		<%-- 데이터가 있으면  결과 화면 출력--%>
		<c:if test="${not empty cart.list }">
			<c:forEach var="vo" items="${cart.list }">
				<tr>
					<td>${vo.p_num }</td>
					<td>${vo.p_name }</td>
					<td>정가 : ${vo.p_name }<hr>
						<span>세일가격 : ${vo.p_saleprice }</span>
					</td>
					<td>
					<form action="editQuant.jsp" method="get">
						<input type="number" name="su" size="3" 
											value="${vo.quant }">
						<input type="submit" value="수정">
						<input type="hidden" name="p_num" value="${vo.p_num }">
					</form>
				</td>
				<td>${vo.totalprice }</td>
				<td>
					<input type="button" value="삭제" onclick=
								'delProduct("${vo.p_num }")'>
				</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">★ 총 결제금액 : ${cart.getTotal() } 원 입니다. ★</td>
			</tr>
		</tfoot>
	</table>
	
<script>
	function delProduct(pNum) {
		alert("pNum : -" + pNum + "-")
		location.href = "delProduct.jsp?p_num=" + pNum;
	}
</script>
</body>
</html>