<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB데이터 수정 
		정상 수정 처리 : onelist.jsp (수정된 것 확인 가능하도록!)
		예외 발생 : 예외 메시지 표시 후 상세페이지 이동처리.
		
		update!
--%>
<% 
	//0. 한글 처리 잊지말기 !!
	request.setCharacterEncoding("UTF-8");
	
	//1. 파라미터 값 추출해서 VO 객체에 저장.
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo"/>	
<%
	System.out.println("guestbookVO : " + vo);
	System.out.println("page vo : " + pageContext.getAttribute("vo"));
	
	//2.sqlsession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);

	//3. 매퍼(mapper)의 SQL 사용해서 DB에 입력처리.
	try {
		// 사용할 sql문 , vo 
	ss.update("GuestBook.update", vo);
	
	//4. 페이지 이동처리 (onelist.jsp) - 정상 입력된 경우!
%>
<script>
	alert("수정 완료되었습니다. \n 확인해주세요.");
	location.href="onelist.jsp?idx=<%=vo.getIdx() %>";
</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	//4. 페이지 이동처리 (onelist.jsp) - 예외 발생시.
%>
<script>		
		alert("[예외발생] 입력 처리 중 예외가 발생했습니다. \n" + "담당자에게 연락하세요.\n"
				+ "이전 페이지로 이동합니다.");
		history.back();
</script>
<%
	} finally {
		ss.close();
	}
%>












