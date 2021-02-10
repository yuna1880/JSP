package com.community.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.community.common.*;

public class ReportDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
	public ReportDAO() {
		
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
	
	
	// 신고 접수
	public int insert(String rid, int rtype, int rqno) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_REPOT_INSERT);
			pstmt.setString(1, rid);
			pstmt.setInt(2, rtype);
			pstmt.setInt(3, rqno);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
		
	} // end insert()
	
	
	// 신고된 내역 모두 보기, 전체 SELECT
	//Report DAO
	public ReportDTO [] select() throws SQLException {
		ReportDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_REPOT_ADMIN_SELECT_ALL);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		
		return arr;
	} // end select()
	
	// ResultSet --> DTO 배열로 리턴
	public ReportDTO[] createArray(ResultSet rs) throws SQLException {
		ReportDTO[] arr = null;  // DTO 배열
		
		ArrayList<ReportDTO> list = new ArrayList<ReportDTO>();
		
		while(rs.next()) {
			int rno = rs.getInt("Rno");
			String rid = rs.getString("Rmember_id");
			int rtype = rs.getInt("Rtype");
			int rqno = rs.getInt("Rqno");
			
			ReportDTO dto = new ReportDTO(rno, rid, rtype, rqno);
			list.add(dto);
			
		} // end while
		
		int size = list.size();
		
		if(size == 0) return null;
		
		arr = new ReportDTO[size];
		list.toArray(arr);  // List -> 배열		
		return arr;
	}
	
	
	// 페이징 관련 ------------------------------------
	// 몇 번째 form부터 몇 개 rows들 SELECT
	public ReportDTO[] selectFromRow(int from, int rows) throws SQLException {
		ReportDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(CommunityD.SQL_REPOR_SELECT_FROM_ROW);
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
			pstmt = conn.prepareStatement(CommunityD.SQL_REPORT_SELECT_ADMIN_ALL);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end countAll()
	//---------------------------------------------


} //end ReportDAO()