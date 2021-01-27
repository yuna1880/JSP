<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 중 id 값을 사용 데이터 조회후 화면 표시 --%>

<%
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = ""
				+ "SELECT IDX, ID, PWD, NAME, AGE, "
				+ "NVL(ADDRESS,'주소없음') AS ADDRESS, " 
		        + "REG, TO_CHAR(REG,'YYYY/MM/DD') REG2 "
		        + "FROM MEMBER "
		        + "WHERE ID = ? ";
				
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		//4. SQL 실행
		rs = pstmt.executeQuery();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 검색 결과</title>
<link rel="stylesheet" href="includee/style.css" type="text/css">
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>
	<%@ include file="includee/menu.jspf" %>
	<hr>
	<h2> ID로 검색 결과 </h2>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<%-- 조회된 데이터 표시 (없으면 없다 / 있으면 데이터 표시) --%>
<%
	if (rs.next()) {  %>
			<tr>
				<td><%=rs.getInt("IDX") %></td>
				<td><%=rs.getString("ID") %></td>
				<td><%=rs.getString("PWD") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getInt("AGE") %></td>
				<td><%=rs.getString("ADDRESS") %></td>
				<%-- <td><%=rs.getDate("REG") %></td> --%>
				<%-- 문자열로 받아올때 ! --%>
				<td><%=rs.getString("REG2") %></td>
			</tr>
<%
	} else { %>
	<tr> 
	<td colspan="7"> ★ 아이디 (<%=id %>) 데이터가 없습니다. 
	다시 확인 후 입력해주세요 ★ </td>
	</tr>
<script>
	alert("[ 다시 확인 후 입력해주세요 ★  ]");
</script>
	<%

	} %>
		</tbody>
		</table>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//6. 사용자원 반납(close)
		try {
			if (rs != null) rs.close();
		} catch(SQLException e) {}	
		try {
			if (pstmt != null) pstmt.close();
		} catch(SQLException e) {}	
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}	
	}
%>