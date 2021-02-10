package com.community.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.community.common.CommunityD;

public class CommentDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public CommentDAO() {
		
		try {
			Class.forName(CommunityD.DRIVER);
			conn = DriverManager.getConnection(CommunityD.URL, CommunityD.USERID, CommunityD.USERPW);
			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		
	} // 생성자

	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	
	//--------------------------------------------------------
	
	// 댓글 작성
	public int insert(int cQno, String content, String cid) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_INSERT);
			pstmt.setInt(1, cQno);
			pstmt.setString(2, content);
			pstmt.setString(3, cid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	} // end insert()
	
	// list.jsp
	// 게시글 별로 SELECT
	public CommentDTO[] select(int cQno) throws SQLException {
		CommentDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_SELECT_ALL);
			pstmt.setInt(1, cQno);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end select()
	
	// ResultSet --> DTO 배열로 리턴
	public CommentDTO[] createArray(ResultSet rs) throws SQLException {
		CommentDTO[] arr = null;  // DTO 배열
		
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		
		while(rs.next()) {
			int cNo = rs.getInt("Cno");
			int cQno = rs.getInt("Cqno");
			String content = rs.getString("Ccontent");
			Date d = rs.getDate("Cregdate");
			Time t = rs.getTime("Cregdate");
			String cId = rs.getString("Cmember_id");
			String regDate = "";
			
			if(d != null){
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			CommentDTO dto = new CommentDTO(cNo, cQno, content, cId);
			dto.setCregDate(regDate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) {return null;}
		
		arr = new CommentDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	// 댓글 삭제
	public int deleteComment(int Cno) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_DELETE);
			pstmt.setInt(1, Cno);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		return cnt;
	} // end deleteByQno()
	
	// 관리자 댓글 전체 검색
	public CommentDTO[] select() throws SQLException {
		CommentDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_SELECT_ADMIN_ALL);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	} // end select()
	
	// 페이징 관련 ------------------------------------
	// 몇 번째 form부터 몇 개 rows들 SELECT
	public CommentDTO[] selectFromRow(int from, int rows) throws SQLException {
		CommentDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_SELECT_FROM_ROW);
			pstmt.setInt(1, from);
			pstmt.setInt(2, from + rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return null;
	} // end selectFromRow()
	
	// 전체 글의 개수
	public int countAll() throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COMMENT_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end countAll()
	//---------------------------------------------

	
} // end DAO