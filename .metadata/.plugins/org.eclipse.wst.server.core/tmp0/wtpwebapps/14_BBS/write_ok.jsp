<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//파일저장위치
	String path = "D:/MYSTUDY/temp";
	
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 VO에 저장 후 DB에 입력 처리 (DB연동 작업) 
	BBSVO bvo = new BBSVO();
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	// 접속한 ip번호 얻어오기
	bvo.setIp(request.getRemoteAddr());
	// 첨부파일
	if (mr.getFile("file_name") != null) {
		bvo.setFile_name(mr.getFilesystemName("file_name"));
		bvo.setOri_name(mr.getOriginalFileName("file_name"));
	} else {
		bvo.setFile_name("");
		bvo.setOri_name("");
	}
	
	// DB에 입력 (저장) 처리
	DAO.insert(bvo);
	
	// 화면 전환 (목록페이지 이동)
	response.sendRedirect("list.jsp");
%>