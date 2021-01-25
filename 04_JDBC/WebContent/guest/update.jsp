<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 파라미터를 사용해서 DB 데이터 수정 처리 
		수정할 데이터 : 성명, 날짜(sysdate), 금액
		정상처리 후 : list.jsp 로 이동.
		예외 발생시 : 현재페이지 (오류메세지) 보여주기.
		 (링크추가) + 상세보기, 목록보기, 링크 제공
--%>
<%
	//POST 요청 데이터에 대한 한글 처리를 위한 설정
	request.setCharacterEncoding("UTF-8");
	//1. 파라미터 값 추출
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int result = 0;
	
	try { 
		int pay = Integer.parseInt(request.getParameter("pay"));
		
		result = update(sabun, name, pay);
	} catch (NumberFormatException e) { //금액에 문자 넣을시 예외처리
%>
<script>
	alert("[ 금액에 숫자가 아닌 문자가 입력되었습니다. \n"
			+" 확인 후 다시 입력하세요! ]");
	history.back();
</script>
<%	
	}
	//3. 수정 완료 후 페이지 이동처리(list.jsp)
	if (result > 0) {
%>
<script>
		alert("[수정성공] 수정처리를 완료하고"
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
<title>사원 정보 수정 실패</title>
</head>
<body>
	<h1>사원 정보 수정 실패</h1>
	<p>수정처리를 하지 못했습니다.<br>
	[수정 페이지로 이동] 클릭해서 다시 작업하세요.
	담당자(8282)에게 연락하세요.</p>
	<a href="editForm.jsp">수정 페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>

<%! 
	private int update (int sabun, String name, int pay) {
	
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
			+ "UPDATE GUEST "
			+ "SET "
			+ " NAME = ? "
			+ " ,NALJA = SYSDATE "
			+ " ,PAY = ? "
			+ " WHERE SABUN = ? ";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setInt(2, pay);
		pstmt.setInt(3, sabun);

		//4. SQL 실행 executeUpdate()
		result = pstmt.executeUpdate();
		System.out.println(">> 수정 처리건수 : " + result);	
		
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