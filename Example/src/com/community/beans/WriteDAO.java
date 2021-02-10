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

public class WriteDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery()
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public WriteDAO() {
		
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
	
	
	// write.jsp, writeOk.jsp
	// 새 글 작성 <-- DTO
	public int insert(WriteDTO dto) throws SQLException {
		String title = dto.getTitle();
		String content = dto.getContent();
		String keyword = dto.getKeyword();
		String qid = dto.getQid();
		
		int cnt = this.insert(title, content, keyword, qid);
		return cnt;
	}
	
	// 새 글 작성 <-- 제목, 내용, 키워드 
	public int insert(String title, String content, String keyword, String qid) throws SQLException {
		int cnt = 0;
		
		try {			
			// title, content, keyword
			pstmt = conn.prepareStatement(CommunityD.SQL_WRITE_INSERT);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, keyword);
			pstmt.setString(4, qid);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();			
		}

		return cnt;
	}

	// write에서 view단으로 넘어가기 위해  no 추출이 필요
	// 모두 검색 -> no만 추출해서 length를 구하고  length - 1 의 값을 추출하기
	public Integer[] QnoSelect() throws SQLException {
		Integer[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createQno(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end QnoSelect()
	
	// 전체 no를 추출하기 위해
	// ResultSet --> Integer 배열로 리턴
	public Integer[] createQno(ResultSet rs) throws SQLException {
		Integer[] arr = null;  // DTO 배열
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		while(rs.next()) {
			int no = rs.getInt("Qno");
			list.add(no);
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new Integer[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	
	//--------------------------------------------------------
	
	
	// View 조회를 위해
	// ResultSet --> DTO 배열로 리턴
	public WriteDTO[] createArray(ResultSet rs) throws SQLException {
		WriteDTO [] arr = null;  // DTO 배열
		
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();
		
		while(rs.next()) {
			int no = rs.getInt("Qno");
			String title = rs.getString("Qtitle");
			String content = rs.getString("Qcontent");
			Date d = rs.getDate("Qregdate");
			Time t = rs.getTime("Qregdate");
			int clickCnt = rs.getInt("Qclickcnt");
			String keyword = rs.getString("Qkeyword");
			String qid = rs.getString("Qmember_id");
			
			String regDate = "";
			if(d != null){
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			WriteDTO dto = new WriteDTO(no, title, content, clickCnt, keyword, qid);
			dto.setRegDate(regDate);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new WriteDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}

	// 특정 no의 글 내용 읽기, 조회수 증가
	// click도 1 증가 해야 하고, 글 읽어와야 한다 --> 트랜잭션 처리
	public WriteDTO[] clickReadByQno(int no) throws SQLException{
		WriteDTO[] arr = null;
		
		try {
			// 트랜잭션 처리
			// Auto-commit 비활성화
			conn.setAutoCommit(false);
			
			// 쿼리들 수행
			pstmt = conn.prepareStatement(CommunityD.SQL_INC_QCLICKCNT);
			pstmt.setInt(1, no);
			
			// 작용한 열의 개수(갱신 카운트로 간주되는)를 나타내는 정수
			pstmt.executeUpdate();
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(CommunityD.SQL_SELECT_BY_QNO);
			pstmt.setInt(1, no);
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
	} // end readByQno()
	
	
	//--------------------------------------------------------

	
	// list.jsp
	// 전체 SELECT
	public WriteDTO [] select() throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end select()
	
	// 페이징 관련 ------------------------------------
	// 몇 번째 form부터 몇 개 rows들 SELECT
	public WriteDTO[] selectFromRow(int from, int rows) throws SQLException {
		WriteDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_SELECT_FROM_ROW);
			pstmt.setInt(1, from);
			pstmt.setInt(2, from + rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		}
		finally {
			close();
		} // end try
		
		return null;
	} // end selectFromRow()
	
	// 전체 글의 개수
	public int countAll() throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end countAll()
	//---------------------------------------------
	
	
	// update.jsp
	// 특정 no의 글만 SELECT(조회수 증가 없음)
	public WriteDTO[] onlySelectByQno(int no) throws SQLException {
		WriteDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_SELECT_BY_QNO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	// 특정 uid 의 글 수정 (제목, 내용)
	public int update(String title, String content, String keyword, int no) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_WRITE_UPDATE);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, no);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}		
		
		return cnt;
	} // end update()
	
	
	//---------------------------------------------
	
	
	// DeleteOk.jsp
	// 특정 Qno 글 삭제하기
		public int deleteByQno(int no) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(CommunityD.SQL_DELETE_BY_QNO);
				pstmt.setInt(1, no);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}		
			return cnt;
		} // end deleteByQno()

} // end DAO