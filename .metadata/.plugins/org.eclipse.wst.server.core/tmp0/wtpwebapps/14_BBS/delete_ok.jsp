<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 삭제요청한 데이터를 DB에서 삭제하고 목록페이지로 이동 
		- 삭제 실패 (댓글 있는 경우): 댓글이 있어서 삭제가 불가능!! ㅡㅡ!!
							-> 상세페이지(view.jsp)로 이동처리
		- 삭제 후 화면 전환 : 목록페이지(list.jsp)로 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("session bvo : " + session.getAttribute("bvo"));
	//전달받은 데이터 추출 : 세션에 있는 bvo
	String b_idx = ((BBSVO)session.getAttribute("bvo")).getB_idx();
	
	

	//DB 데이터 수정 요청
	try {
		DAO.delete(b_idx);
		//정상 처리되었을 때 -> 이동처리
		//response.sendRedirect("list.jsp?cPage=" + session.getAttribute("cPage"));
		 %>
			<script>
				alert("삭제가 완료되었습니다. 확인해주세요.");
				location.href="list.jsp?cPage=${cPage}"; //session에 저장된 scope 사용
			</script>
<%		
		
		} catch (Exception e) { %>
		<script>
			alert("[삭제 실패 ] \n 해당 게시글에 댓글이 있어 삭제가 불가능합니다.\n"
					+ "댓글을 삭제하거나, 담당자에게 문의하세요.");
			history.go(-2);
		</script>
<%		
	} finally {
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>

</body>
</html>