<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 파라미터 값을 DB에 입력하고 화면 이동 
		      정상처리 : selectAll.jsp
		      예외발생 : error.jsp
--%>
<%
	//1. 파라미터 값 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	int age = 0;
	int result = 0;
	
	try {
		age = Integer.parseInt(request.getParameter("age"));
		//2. 파라미터 값이 정상이면 DB입력처리
		result = insert(id, pwd, name, age, address);
	} catch (NumberFormatException e) {
		System.out.println(">> 나이에 잘못된 값이 입력되었습니다.");
	}
	//3. 페이지 이동처리(list.jsp)
	if (result > 0) {
%>
<script>
	alert("[입력 성공] 입력 처리를 완료하고"
		+ "\n 전체 데이터 페이지로 이동합니다.");
	location.href = "selectAll.jsp";
</script>
<%
	} else {
		response.sendRedirect("error.jsp");
	}
%>

<%!
	//선언부(declaration) : 클래스의 필드영역에 추가되는 코드
	//(실습) JDBC 프로그램을 사용해서 입력처리 : 리턴값은 insert 문장결과
	private int insert(String id, String pwd, String name, int age, String address) {
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
				+ "INSERT INTO MEMBER "
				+ "(IDX, ID, PWD, NAME, AGE, ADDRESS, REG) "  
				+ " VALUES (MEMBER_SEQ.NEXTVAL,?,?,?,?,?,SYSDATE) ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setInt(4, age);
			pstmt.setString(5, address);

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


