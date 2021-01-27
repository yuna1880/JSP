<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- DB에서 전체 데이터 조회 (검색)해서 화면 출력 --%>
<%
	//DB 연동 프로그램 작성
	
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = ""
				+ "SELECT IDX, ID, PWD, NAME, AGE, "
				+ "NVL(ADDRESS,'주소없음') AS ADDRESS, REG, "
				+ "TO_CHAR(REG,'YYYY/MM/DD') REG2 "
				+ "FROM MEMBER "
				+ "ORDER BY IDX ";
		
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. SQL 실행
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표준 화면</title>
<link rel="stylesheet" href="includee/style.css" type="text/css">
<style>
 .table-fill {
 	
 }
 body {
  background-color: beige;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
.th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}

.th {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}
</style>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="includee/menu.jspf" %>
	<hr>
	<h1> 전체 데이터 검색 </h1>
	<table border class="table-fill">
		<thead>
			<tr>
				<th id="th">번호</th>
				<th id="th">아이디</th>
				<th id="th">패스워드</th>
				<th id="th">이름</th>
				<th id="th">나이</th>
				<th id="th">주소</th>
				<th id="th">날짜</th>
			</tr>
		</thead>
		<tbody>
<%
	while (rs.next()) {  %>
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
	}  %>
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






