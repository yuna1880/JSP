<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%> <%-- JDBC 관련 import --%>    
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	int curPage = 1;   // 현재 페이지 (디폴트 1 page)
	
	// 현재 몇 페이지인지 parameter 받아오기 + 검증
	String pageParam = request.getParameter("page");
	if(pageParam != null && !pageParam.trim().equals("")){
		try{
			int p = Integer.parseInt(pageParam);
			if(p > 0)
				curPage = p;
		} catch(NumberFormatException e){
			
		}
	}
%>

<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	final String USERID = "team5";  // DB 접속 계정 정보
	final String USERPW = "team5";
%>

<%!
	// 쿼리문 준비
	//final String SQL_WRITE_SELECT = 
	//	"SELECT * FROM test_write ORDER BY wr_uid DESC";

	// 페이징
	// 글 목록 전체 개수 가져오기
	final String SQL_WRITE_COUNT_ALL = "SELECT count(*) FROM MEMBER";
	
	// fromRow 부터 pageRows 만큼 SELECT
	// (몇번째) 부터 (몇개) 만큼
	final String SQL_WRITE_SELECT_FROM_ROW =  "SELECT * FROM " + 
			"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM MEMBER ) T) " + 
			"WHERE RNUM >= ? AND RNUM < ?";
	
	// 페이징 관련 세팅 값들
	int writePages = 10;   // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
	int pageRows = 10;    // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
	int totalPage = 0;	 // 총 몇 '페이지' 분량인가?
%>
<%
	try{
		Class.forName(DRIVER);
		
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_COUNT_ALL);
		rs = pstmt.executeQuery();
		
		if(rs.next())
			cnt = rs.getInt(1);   // count(*), 전체 글의 개수
			
		rs.close();
		pstmt.close();
		
		totalPage = (int)Math.ceil(cnt / (double)pageRows); // 총 몇페이지 분량
		
		int fromRow = (curPage - 1) * pageRows + 1;  // 몇번째 row 부터?
				
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT_FROM_ROW);
		pstmt.setInt(1, fromRow);  
		pstmt.setInt(2, fromRow + pageRows);
		rs = pstmt.executeQuery();
		
		//out.println("쿼리 성공<br>");
%>	

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/SJ/memberlist.css" type="text/css">
<title>글 목록 <%= curPage %>페이지</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>


</head>
<body>	
		<hr>
		<h2>리스트 <%= curPage %>페이지</h2>
		<h4><%= cnt %>개</h4> <!-- 전체 글 개수 -->
		<table>
			<tr>
				<th>row</th> <!-- row 번호 -->
				<th>ID</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>email</th>
				<th>가입일</th>
			</tr>
<%
		while(rs.next()){
			out.println("<tr>");
			
			 int rnum = rs.getInt("rnum");  // rownum 받아오기 
			
			
			String ID = rs.getString("MEMBER_ID");
			String PW = rs.getString("MEMBER_PW");
			String NAME = rs.getString("MEMBER_NAME");
			String EMAIL = rs.getString("MEMBER_EMAIL1");
			Date d = rs.getDate("MEMBER_JOIN_DATE");
			Time t = rs.getTime("MEMBER_JOIN_DATE");
			
			 String regdate = "";
			if(d != null){
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
				+ new SimpleDateFormat("hh:mm:ss").format(t);
						
			} 
			
			out.println("<td>" + rnum + "</td>");  // rownum 찍어주기 
			
			out.println("<td><a href='view.ad?id=" + ID + "&page=" + curPage +"'>" + ID + "</a></td>"); 
			out.println("<td>" + PW + "</td>");
			out.println("<td>" + NAME + "</td>");
			out.println("<td>" + EMAIL + "</td>");
			out.println("<td>" + regdate + "</td>");
			
			
			out.println("</tr>");
		} // end while
%>			
		</table>
		<br>
		<!-- <button onclick="location.href='write.jsp'">신규등록</button> -->
<%	
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
	} finally {
		// 리소스 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>

<%-- 페이징 --%>
<jsp:include page="pagination.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
</jsp:include>



</body>
</html>















