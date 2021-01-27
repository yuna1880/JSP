<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 파라미터 값(ID)을 사용해서 DB데이터 삭제하고 화면 이동 
			정상처리 : selectAll.jsp
			예외발생 : error.jsp
--%>
<%
	//1. 전달받은 파라미터 값 확인 (추출)
	String id = request.getParameter("id");
	int result = 0;
	
	result = delete(id);
	
	//3. 페이지 이동처리(list.jsp)
	if (result > 0) {
%>
<script>
		alert("[삭제성공] 삭제처리를 완료하고"
				+ "\n목록페이지로 이동합니다.");
		location.href = "selectAll.jsp";
</script>
<%
} else {
	response.sendRedirect("error.jsp");
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

<%! 
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	private int delete (String id) {
			
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
		String sql = "DELETE FROM MEMBER WHERE ID = ? ";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);

		//4. SQL 실행 executeUpdate()
		result = pstmt.executeUpdate();
		System.out.println(">> 삭제 처리건수 : " + result);	
		
	} catch (Exception e) {
		// result가  0일때 값이 없을때 음수값을 넣어준다.
		//result = -999;
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
		location.href = "selectAll.jsp";
</script>
<%!
	} 
	return result;
} 
%>