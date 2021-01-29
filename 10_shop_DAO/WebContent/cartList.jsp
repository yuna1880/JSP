<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니 (cart)에 있는 제품목록 화면에 표시 --%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
<%
	//카트에서 목록 꺼내기
	List<ShopVO> list = cart.getList();

%>

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
				<td colspan="6"> : Cart </td>
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
<%
		if (list == null || list.size() < 1 ) { %>
			<tr>
				<td colspan="6">장바구니가 비었습니다.</td>
			</tr>
<%	
		} else {
			for (ShopVO vo : list) { %>
			<tr>
				<td><%=vo.getP_num() %></td>
				<td><%=vo.getP_name() %></td>
				<td>정가 : <%=vo.getP_price() %> 원 <hr>
					<span class="red">세일가격 : <%=vo.getP_saleprice() %></span>
				</td>
				<td>
					<form action="editQuant.jsp" method="get">
						<input type="number" name="su" size="3" 
											value="<%=vo.getQuant() %>">
						<input type="submit" value="수정">
						<input type="hidden" name="p_num" value="<%=vo.getP_num() %>">
					</form>
				</td>
				<td><%=vo.getTotalprice() %></td>
				<td>
					<%--  삭제 : product number를 전달해준다. (문자열 처리 잊지 말기!!) --%>
					<input type="button" value="삭제" onclick=
								'delProduct("<%=vo.getP_num() %>")'>
				</td>
			</tr>
<%				
			}
		}
%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">총 결제금액 : <%=cart.getTotal() %> 원 입니다.</td>
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