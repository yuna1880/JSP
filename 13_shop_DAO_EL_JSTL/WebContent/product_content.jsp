<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
<%
	//전달 받은 값 추출 (파라미터 값)
	String p_num = request.getParameter("p_num");
%>
	<%-- 액션태그 useBean scope 상의 id명 속성값이 있으면 사용하고 
			없으면 클래스 속성 타입의 객체 생성 + scope 등록 !! --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.shopDAO" scope="session" />
<%
	//DAO 객체 (인스턴스) 사용해서 제품정보 조회 후 VO에 저장
	ShopVO vo = dao.selectOne(p_num);
	
	//EL,JSTL 사용을 위한 속성값 설정
	pageContext.setAttribute("VO", vo);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Information</title>
<link rel="stylesheet" href="css/menu.style.css" type="text/css">
<style>
	/* 상세보기창 스타일 */
	table {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #ddd; }
	.red { color: red; }
	img {
		align-content: center;
	}
	.title { width: 30%; }
	tfoot { text-align: center; height: 3em; }
</style>
</head>
<body>
	<!-- 메뉴 파일 -->
	<%@ include file="common/menu.jspf" %>
	<table border>
		<tbody>
			<tr>
				<th class="title">Product Category</th>
				<td>${VO.category }</td>
			</tr>
			<tr>
				<th>Product Number</th>
				<td>${VO.p_num}</td>
			</tr>
			<tr>
				<th>Product Name</th>
				<td>${VO.p_name }</td>
			</tr>
			<tr>
				<th>Product Company</th>
				<td>${VO.p_company }</td>
			</tr>
			<tr>
				<th>Product Price</th>
				<td>정가 : ${VO.p_price }
					<span class="red">(할인가격 : ${VO.getP_price() })</span>
				</td>
			</tr>
			<tr>
				<th>Product Information</th>
				<td>${VO.p_content }</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="images/${VO.p_image_l }" alt="제품이미지">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" class="center">
					<input type="button" value="장바구니에 담기"
						onclick="add()">
					<input type="button" value="장바구니 보기"
						onclick="javascript:location.href='cartList.jsp'">
							<!--  javascript 코드 이렇게 추가 가능하다. -->
				</td>
			</tr>
		</tfoot>
	</table>
<script>
	function add(){
		location.href = "addProduct.jsp?p_num=${VO.getP_num() }";
	}
</script>
</body>
</html>