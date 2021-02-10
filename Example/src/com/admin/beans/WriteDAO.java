package com.admin.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.admin.common.D;



// DAO : Data Access Object
//   DB 에 접속하여 트랜잭션을 수행하는 객체

// 다루는 데이터 소스의 종류에 따라 DAO는 여러개 정의 사용 가능

public class WriteDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public WriteDAO() {
		
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
		} catch(Exception e) {
			e.printStackTrace();
			// throw e;
		}		
		
	} // 생성자

	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	// 새글 작성 <-- DTO
//	public int insert(WriteDTO dto) throws SQLException {
//		String subject = dto.getSubject();
//		String content = dto.getContent();
//		String name = dto.getName();
//		
//		int cnt = this.insert(subject, content, name);
//		return cnt;
//	}
	
	// 새글 작성 <-- 제목, 내용, 작성자 
	public int insert(String subject, String content, String name) throws SQLException {
		int cnt = 0;
		
		try {			
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, name);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();			
		}

		return cnt;
	}
	
	// ResultSet --> DTO 배열로 리턴
	public WriteDTO [] createArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			
			String Id = rs.getString("MEMBER_ID");
			String Pw = rs.getString("MEMBER_PW");
			String Name = rs.getString("MEMBER_NAME");
			String Email = rs.getString("MEMBER_EMAIL1");
			Timestamp Date = rs.getTimestamp("MEMBER_JOIN_DATE");
			
			
			
			
			WriteDTO dto = new WriteDTO(Id, Pw, Name, Email, Date);
			
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new WriteDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	// 전체 SELECT
	public WriteDTO [] select() throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBER_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end select()
	
	// 특정 uid 의 글 내용 읽기, 조회수 증가
	// viewCnt 도 1 증가 해야 하고, 글 읽어와야 한다 --> 트랜잭션 처리
	public WriteDTO [] readByUid(String uid) throws SQLException{
		WriteDTO [] arr = null;
		
		try {
			// 트랜잭션 처리
			// Auto-commit 비활성화
			conn.setAutoCommit(false);
			
			// 쿼리들 수행
			/*
			 * pstmt = conn.prepareStatement(D.SQL_WRITE_INC_VIEWCNT); pstmt.setInt(1, uid);
			 * cnt = pstmt.executeUpdate();
			 */
			
			//pstmt.close();
			
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			conn.commit();
			
		} catch(SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}
		
		return arr;
	} // end readByUid()
	
	
	// 특정 uid 의 글 만 SELECT (조회수 증가 없슴!)
	public WriteDTO [] selectByUid(int MEMBER_ID) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, MEMBER_ID);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	
	// 특정 uid 의 글 수정 (제목, 내용)
	public int update(int uid, String subject, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, uid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		
		return cnt;
	} // end update()
	
	// 특정 uid 글 삭제하기
	public int deleteByUid(String uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_UID);
			pstmt.setString(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		return cnt;
	} // end deleteByUid()
	
	// 페이징 관련 ------------------------------------
		// 몇 번째 form부터 몇 개 rows들 SELECT
		public WriteDTO[] selectFromRow(int from, int rows) throws SQLException {
			WriteDTO[] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_MEMBER_COUNT_ALL);
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
				pstmt = conn.prepareStatement(D.SQL_MEMBER_COUNT_ALL);
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			} finally {
				close();
			} // end try
			
			return cnt;
		} // end countAll()
	
	
	
	
	
	
} // end DAO










