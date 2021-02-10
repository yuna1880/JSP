package com.cons.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.cons.common.consD;
import com.yoon.beans.ProductDTO;
import com.yoon.common.D;

public class comDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public comDAO() {

		try {
			Class.forName(consD.DRIVER);
			conn = DriverManager.getConnection(consD.URL, consD.USERID, consD.USERPW);
			System.out.println("comDAO 생성, 데이터 베이스 연결!");
		} catch (Exception e) {
			e.printStackTrace();
			// throw e;
		}

	} // 생성자

	// DB 자원 반납 메소드,
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close()

	// ResultSet --> DTO 배열로 리턴
	public comDTO[] createArray(ResultSet rs) throws SQLException {
		comDTO[] arr = null; // DTO 배열

		ArrayList<comDTO> list = new ArrayList<comDTO>();

		while (rs.next()) {
			int cno = rs.getInt("Cno");
			String cname = rs.getString("Cname");
			String cadr = rs.getString("Cadr");
			String ctel = rs.getString("Ctel");
			String carea = rs.getString("Carea");
			String ccategory = rs.getString("Ccategory");

			comDTO dto = new comDTO(cno, cname, cadr, ctel, carea, ccategory);
			list.add(dto);

		} // end while

		int size = list.size();

		if (size == 0)
			return null;

		arr = new comDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;
	}

	// 전체 SELECT
	public comDTO[] select() throws SQLException {
		comDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	} // end select()

	// 특정 uid 의 글 내용 읽기, 조회수 증가
	// viewCnt 도 1 증가 해야 하고, 글 읽어와야 한다 --> 트랜잭션 처리
	public comDTO[] readByUid(int uid) throws SQLException {
		int cnt = 0;
		comDTO[] arr = null;

		try {
			// 트랜잭션 처리
			// Auto-commit 비활성화
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT_BY_UID);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs);
			conn.commit();

		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}

		return arr;
	} // end readByUid()

	// 새글 작성 <-- 제목, 내용, 작성자
	public int insert(String csuid, String csname, int cno, String carea, String cstel) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_WRITE);
			pstmt.setString(1, csuid);
			pstmt.setString(2, csname);
			pstmt.setInt(3, cno);
			pstmt.setString(4, carea);
			pstmt.setString(5, cstel);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end insert()

	// 전체 글의 개수
	public int countAll() throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(consD.SQL_COM_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			close();
		} // end try
		
		return cnt;
	} // countAll()
	
	// 페이징 관련
	// 몇번째 from 부터 몇개 rows 를 SELECT
	public comDTO [] selectFromRow(int from, int rows) throws SQLException {
		comDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT_FROM_ROW);
			pstmt.setInt(1,  from);
			pstmt.setInt(2,  from + rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);			
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectFromRow()
	
	//----------------------------- 오늘의 집 메인 --------------------------------
	
	public comDTO[] selectRandom() throws SQLException {//main화면에 보여주기 위함
		comDTO[] arr = null;
		comDTO[] arrRan = new comDTO[6];
		try {
			pstmt = conn.prepareStatement(consD.SQL_COM_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		for (int i = 0; i < 6; i++) {
			arrRan[i]=arr[(int)(Math.random()*arr.length)];
		}
		
		return arrRan;
	} // end insert()
	
	
} // end comDAO
