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
	BBSVO bvo = new BBSVO();
	String hit = Integer.toString(DAO.updateHit(b_idx));
	
	bvo.setHit(hit);
	System.out.println(">view hit : " + bvo.getHit());
	
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
</head>
<body>

</body>
</html>