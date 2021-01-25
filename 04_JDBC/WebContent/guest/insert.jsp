<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 이용해서 DB에 입력처리
	정상입력 : list.jsp 페이지로 이동
	예외발생 : 현재 페이지 보여주기
--%>
<%
	//1. 파라미터 값 추출
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = 0;
	int result = 0;
	try {
		pay = Integer.parseInt(request.getParameter("pay"));
		//2. 파라미터 값이 정상이면 DB입력처리
		result = insert(sabun, name, pay);
	} catch (NumberFormatException e) {
		System.out.println(">> 급여항목에 잘못된 값이 입력되었습니다.");
	}
	//3. 페이지 이동처리(list.jsp)
	if (result > 0) {
		response.sendRedirect("list.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록 실패</title>
</head>
<body>
	<h1>사원 등록 실패</h1>
	<p>입력처리를 하지 못했습니다.<br>
	[입력페이지로 이동] 클릭해서 다시 작업하세요.
	담당자(8282)에게 연락하세요.</p>
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>

<%!
	//선언부(declaration) : 클래스의 필드영역에 추가되는 코드
	//(실습) JDBC 프로그램을 사용해서 입력처리 : 리턴값은 insert 문장결과
	private int insert(int sabun, String name, int pay) {
		//JDBC 프로그램을 위한 변수 선언
		final String DRIVER = "oracle.jdbc.OracleDriver";
		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		final String USER = "mystudy";
		final String PASSWORD = "mystudypw";
		
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
			String sql = ""
				+ "INSERT INTO GUEST "
				+ "(SABUN, NAME, NALJA, PAY) "  
				+ "VALUES (?,?,SYSDATE,?) ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			pstmt.setInt(3, pay);

			//4. SQL 실행 executeUpdate()
			result = pstmt.executeUpdate();
			System.out.println(">> 등록 처리건수 : " + result);	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//6. 사용자원 반납(close)
			try{
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {}
		}
		return result;
	}
%>
























