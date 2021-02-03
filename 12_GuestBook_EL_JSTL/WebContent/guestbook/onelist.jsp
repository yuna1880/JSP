<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx)로 DB데이터 조회후 화면에 출력 --%>

<%
	//1. 전달받은 IDX 값 추출
	String idx = request.getParameter("idx");
	
	//2. DB연동 작업을 위한 sqlSession 객체 생성해서 DB연동작업
	SqlSession ss = DBService.getFactory().openSession();
	GuestbookVO vo = ss.selectOne("GuestBook.one", idx);
	ss.close(); //끝
	
	System.out.println("vo = " + vo);
	
	//3. 조회(검색)된 데이터 화면출력 (html 태그영역에 작성)
	// 검색 데이터 (vo)를 수정, 삭제, 처리시에도 사용하기 위한 설정.
	// session scope 에 등록 처리 (session 객체에 저장) 
	//(화면 이동시에도 값을 사용할 수 있게 하기 위함)
	session.setAttribute("guestbookVO", vo);
	
	//세션에 저장 여부 확인
	System.out.println("session guestbookVO : " + session.getAttribute("guestbookVO"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<link href="/12_GuestBook_EL_JSTL/css/guestbook.css" rel="stylesheet">
<script>
	function update_go(frm) {
		frm.action = "update.jsp"; //수정작업할 화면 
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp"; //삭제작업할 화면 
		frm.submit();
	}
</script>
</head>
<body>
	<div id="container">
		<h2 class="table-title"> GuestBook </h2>
		<hr>
		<p><a href="list.jsp"class="link-3"> ★ Back to the List - Click Here!★</a></p>
		<form method="post">
		<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>${guestbookVO.getName() }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${guestbookVO.subject }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${guestbookVO.getEmail() }</td>
			</tr>
			<tr>
				<td colspan="2">${guestbookVO.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<input type="button" value="수 정(수정 폼 이동)"
						onclick="update_go(this.form)">
					
					<input type="button" value="삭 제(삭제 폼 이동)"
						onclick="delete_go(this.form)">
				</td>
			</tr>
		</tfoot>
		</table>
		
		</form>
	</div>
</body>
</html>