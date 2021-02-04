<%@page import="com.bc.mybatis.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <%-- 전달받은 파라미터 값 사용 DB데이터 조회 후 화면 표시 
    	1. 게시글 조회수 1 증가
    	2. 게시글 (b_idx) 데이터 조회 후 화면 표시
    	3. 게시글 (b_idx)에 딸린 댓글이 있으면 화면표시 (없으면 게시글만!)
    --%>
<% 
	//파라미터 값 확인
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");

	//1.게시글 조회수 1 증가 (실습)
	//BBSVO vo = new BBSVO();
	//String hit = Integer.toString(DAO.updateHit(b_idx));	
	//vo.setHit(hit);
	//System.out.println(">view hit : " + vo.getHit());
	
	DAO.updateHit(Integer.parseInt(b_idx));

	//2. 게시글 (b_idx) 데이터 조회 //  후 화면 표시(나중에~)
	BBSVO bvo = DAO.selectOne(b_idx);
	System.out.println(">view bvo : " + bvo);
	
	// 3. 게시글 (b_idx)에 딸린 댓글이 있으면 화면표시 (검색, 찾기)
	List<CommVO> list = DAO.getCommList(b_idx);
	System.out.println(">view comm list : " + list);
	
	// EL, JSTL 사용을 위한 scope 상에 속성 등록하고 화면 표시
	session.setAttribute("bvo", bvo);
	session.setAttribute("cPage", cPage);
	pageContext.setAttribute("c_list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Content</title>
<link href="/14_BBS/css/board.css" rel="stylesheet">
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th, #bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
	#bbs .align-left { text-align: left; }
	
	.title { background-color: lightsteelblue; }
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/***** 페이지 표시 부분 스타일(시작) ****/
	.paging { 
		list-style: none;
		
	 }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid rgba(56, 56, 56, 0.986);;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid pink;
		padding: 3px 7px;
		background-color: pink;
	}
	.paging li a:hover {
		background-color: rgba(56, 56, 56, 0.986);
		color: white;
	}
	/***** 페이지 표시 부분 스타일(끝) ****/
</style>
<script>
	// 파라미터 값 (cPage 값을 함께 넘겨준다.)
	function modify_go() {
		document.frm.action = "modify.jsp";
		document.frm.submit();
	}
	function delete_go() {
		document.frm.action = "delete.jsp";
		document.frm.submit();
	}
	//목록은 이전에 봤던 목록페이지로 돌아가게 해준다. (cPage값으로 인식!)
	function list_go() {
		document.frm.action = "list.jsp";
		document.frm.submit();
	}
</script>
</head>
<body>
<div id="bbs">
<%-- 게시글 내용 표시 --%>
<form method="post" name="frm">
	<table>
		<caption>Details</caption>
	<tbody>
		<tr>
			<th>Title</th>
			<td>${bvo.subject }</td>
		</tr>
		<tr>
			<th>Writer</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>Attached-File</th>
			<td>
			<c:if test="${empty bvo.file_name }">
				<p>첨부파일 없음</p>
			</c:if>
			<c:if test="${not empty bvo.file_name }">
				<a href="download.jsp?name=${bvo.file_name }">${bvo.file_name }</a>
			</c:if>
			</td>
		</tr>
		<tr>
			<th>Content</th>
			<td>${bvo.content }</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="modify_go()">
					<input type="button" value="삭제" onclick="delete_go()">
					<input type="button" value="목록" onclick="list_go()">
					<input type="hidden" name="cPage" value="${cPage }">
				</td>
			</tr>
		</tfoot>
	</table>
</form>
<hr>
<%-- 게시글에 대한 댓글 작성 영역 --%>
<form action="ans_write_ok.jsp" method="post">
	<p>Name : <input type="text" name="writer" class="feedback-input">
	Password : <input type="password" name="pwd" class="feedback-input"></p>
	<p>Comment : <textarea name="content" rows="4" cols="55"></textarea>
	<input type="submit" value="Write Comment">
	<input type="hidden" name="b_idx" value="${bvo.b_idx }">
	</p>
</form>
<hr>
Comments
<hr>
<c:forEach var="commVO" items="${c_list }">
<div class="comment">
	<form action="ans_del.jsp" method="post">
		<p>Name : ${commVO.writer }&nbsp; Date : ${commVO.write_date }</p>
		<p>Comment : ${commVO.content }</p>
		<!-- 삭제요청시, 암호 -->
		<input type="submit" value="댓글삭제">
		<!-- 바람직한 방법은 아닙니다. c_idx + pwd -> 삭제용도 -->
		<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		<input type="hidden" name="pwd" value="${commVO.pwd }">
		<%-- 댓글 삭제 후 게시글 상세페이지로 이동시 b_idx--%>
		<input type="hidden" name="b_idx" value="${commVO.b_idx }">
	</form>
</div>
</c:forEach>

</div>
</body>
</html>

