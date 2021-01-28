<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- DB에서 전체 데이터 조회 후 화면에 출력 --%>
<%
	// DB에서 전체 데이터 조회 후 화면에 출력
	// 1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();

	// 2. 매퍼의 sql 실행
	List<GuestbookVO> list = ss.selectList("GuestBook.all");
	ss.close();
	// 3. sql 실행 결과 화면에 출력
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록</title>
<link href="/08_GuestBook/css/guestbook.css" rel="stylesheet">

</head>
<body>
<div id = "container">
	<h2 class="table-title">GuestBook</h2>
	<hr>
	<nav id="nav-3">
	<p><a href="write.jsp" class="link-3"> ★ Write - Click Here!★</a></p>
	</nav>
	<table class="table-fill">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<%--
			<tr>
				<td class="center">1</td>
				<td>홍일동</td>
				<td>제목1</td>
				<td>2021-01-27</td>
			</tr> --%>
<%
	//3. SQL 실행 결과 화면에 출력
	if (list.size() > 0) {
		for (GuestbookVO vo : list) { %>
			<tr>
				<td class="center"><%=vo.getIdx() %></td>
				<td class="center"><%=vo.getName() %></td>
				<td class="center"><a href="onelist.jsp?idx=<%=vo.getIdx() %>" class ="text"> <%=vo.getSubject() %></a></td>
				<td class="center"><%=vo.getRegdate() %></td>
			</tr>
<%			
		}
	} else {
		out.print ("<tr>");
		out.print ("<td colspan='4'>★ 검색된 데이터가 없습니다. 다시 확인해주세요 ★</td>");
		out.print ("</tr>");
		
	}

%>					
		</tbody>
	</table>
</div>
</body>
</html>

