<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 파라미터 값 사용해서 DB데이터를 삭제 처리! 
	정상처리 후 : list.jsp로 이동
	예외발생시 : 현재페이지 (예외 메세지 보여주기)
	 (링크추가) + 상세보기, 목록보기 
--%>
<%
	//1. 전달받은 파라미터 값 확인 (추출)
	int sabun = Integer.parseInt(request.getParameter("idx"));
	int result = 0;
	
	result = delete(sabun);
		
	//3. 페이지 이동처리(list.jsp)
	if (result > 0) {

%>
<script>
		alert("[삭제성공] 삭제처리를 완료하고"
				+ "\n목록페이지로 이동합니다.");
		location.href = "list.jsp";
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 삭제 실패</title>
</head>
<body>
	<h1>사원 정보 삭제 실패</h1>
	<p>삭제 처리를 하지 못했습니다.<br>
	[상세보기 페이지로 이동] 클릭해서 다시 작업하세요.
	담당자(8282)에게 연락하세요.</p>
	<a href="detail.jsp?idx=<%=sabun %>">상세보기 페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>
<%! 
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	private int delete (int sabun) {
			
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		//사용할 SQL 쿼리 작성
		String sql = "DELETE FROM GUEST WHERE SABUN = ? ";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, sabun);

		//4. SQL 실행 executeUpdate()
		result = pstmt.executeUpdate();
		System.out.println(">> 삭제 처리건수 : " + result);	
		
	} catch (Exception e) {
		// result가  0일때 값이 없을때 음수값을 넣어준다.
		result = -999;
		e.printStackTrace();
	} finally {
		//6. 사용자원 반납(close)
		try{
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
	if(result == 0) { //SQL 정상실행 + 데이터 삭제 안됨
%>
	<script>
		alert("[삭제실패] 대상이 없어서 삭제하지 못했습니다."
				+ "\n목록페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%!
	} 
	return result;
} 
%>