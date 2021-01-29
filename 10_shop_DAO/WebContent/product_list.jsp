<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 품목코드(category) 사용해서 DB데이터 조회하고 화면표시 --%>
<%
	//전달받은 파라미터 값 확인 (추출)
	String category = request.getParameter("category");
	
	//DB데이터 조회
	//SqlSession ss = DBService.getFactory().openSession();
	//List<ShopVO> list =  ss.selectList("shop.list",category);
	
	//DAO 사용패턴
%>
	<%-- DAO 객체를 session scope 에 저장! (세션이 유지되는 동안 사용!) --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.shopDAO" scope="session" />
<%
	// catgegory 변수를 넘겨주면서 dao에 있는 함수 실행! list로 받는다.
	List<ShopVO> list = dao.list(category);
	System.out.println("list : " + list);
	for (ShopVO vo : list) {
		System.out.println("list vo : " + vo);
	}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link rel="stylesheet" href="css/menu.style.css" type="text/css">
<link rel="stylesheet" href="css/table.style.css" type="text/css">

</head>
<body>
	<!-- 메뉴 파일 -->
	<%@ include file="common/menu.jspf" %>

	<%--제품목록 표시 영역 --%>
	<table>
		<thead>
			<tr>
				<th width="15%">제품번호</th>
				<th width="10%">이미지</th>
				<th width="20%">제품명</th>
				<th width="20%">판매가격</th>
				<th>비고사항</th>
			</tr>
		</thead>
		<tbody>
<%-- 표 참고용~!
			<tr>
				<td>품번-11</td>
				<td>
					<img src="images/pds1.jpg" width="100px" height="95px">
				</td>
				<td>제품명</td>
				<td>할인가격 : ~~~<br>
					<span>(할인율 : 40%)</span>
				</td>
				<td>가격(원가)</td>
			</tr>
--%>
<%
	if (list.size() > 0) { //데이터가 있으면 화면 표시
		for (ShopVO vo : list) { %>
		
		<tr>
			<td><%=vo.getP_num() %></td>
			<td>
				<img src="images/<%=vo.getP_image_s() %>" width="100px" height="95px">
			</td>
			<td><a href="product_content.jsp?p_num=<%=vo.getP_num() %>"> <%=vo.getP_name() %> </a></td>
			<td>할인가격 : <%=vo.getP_saleprice() %><hr>
				<span class="red">(할인율 : <%=vo.getPercent() %> %)</span>
			</td>
			<td>시중 가격 : <%=vo.getP_price() %> 원</td>
		</tr>
<%
		}
	} else { //등록된 제품이 없을때
		out.print("<tr><td colspan='5'>");
		out.print("현재 등록된 제품이 없습니다.");
		out.print("</td></tr>");
	}
%>
		</tbody>
	</table>

</body>
</html>






