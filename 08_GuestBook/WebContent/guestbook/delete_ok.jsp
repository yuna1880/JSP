<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- (실습) 선택된 데이터 삭제 처리 (파라미터 pwd 값과 session 데이터 사용) 
		전달받은 파라미터 pwd와 session에 저장된 VO객체의 pwd값 비교
		일치하면 : 삭제 후 목록페이지로 이동(삭제 메세지 표시)
		불일치 : 이전페이지로 이동 (암호 불일치 메세지 표시)    	
    --%>
<%
	//입력한 pwd 가져오기
	String pwd1 = request.getParameter("pwd");
	System.out.println(pwd1);

	//원 pwd 가져오기
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	String pwd2 = vo.getPwd();
	//System.out.println(pwd2);

	if (!pwd1.equals(pwd2)) { //암호 불일치
%>
<script>
	alert("암호가 일치하지 않습니다. 확인 후 다시 시도해주세요.");
	history.back();
</script>
<%
		return;

	} else { //암호가 일치하는 경우!
		
		System.out.println("vo : " + vo);
		SqlSession ss = DBService.getFactory().openSession(true);

		try {
			//string -> integer (value of)
			int result = ss.delete("GuestBook.delete", Integer.valueOf(vo.getIdx()));
%>
<script>
	alert("삭제 완료되었습니다. \n 확인해주세요.");
	location.href = "list.jsp";
</script>
<%
		} catch (Exception e) {
			e.printStackTrace();
			// 예외 발생시?
%>
<script>
	alert("[예외발생] 입력 처리 중 예외가 발생했습니다. \n" + "담당자에게 연락하세요.\n" + "이전 페이지로 이동합니다.");
	history.back();
</script>
<%
		} finally {
			ss.close();
		}
	}
%>



