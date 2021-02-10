package com.cons.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.cons.common.consD;

public class consDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, executeQuery()

	// DAO 객체가 생성될때 Connection 도 생성된다.
	public consDAO() {

		try {
			Class.forName(consD.DRIVER);
			conn = DriverManager.getConnection(consD.URL, consD.USERID, consD.USERPW);
			System.out.println("consDAO 생성, 데이터 베이스 연결!");
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
	public consDTO[] createArray(ResultSet rs) throws SQLException {
		consDTO[] arr = null; // DTO 배열
		ArrayList<consDTO> list = new ArrayList<consDTO>();

		while (rs.next()) {
			int csno = rs.getInt("CSno");
			String csuid = rs.getString("CSuid");
			String csname = rs.getString("CSname");
			int cno = rs.getInt("Cno");
			String csarea = rs.getString("CSarea");
			String cstel = rs.getString("CStel");
			String cname = rs.getString("Cname");

			consDTO dto = new consDTO(csno, csuid, csname, cno, csarea, cstel, cname);
			list.add(dto);

		} // end while

		int size = list.size();

		if (size == 0)
			return null;

		arr = new consDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;
	}

	// 전체 SELECT
	public consDTO[] select() throws SQLException {
		consDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	} // end select()

	// 특정 uid 의 글 수정 (제목, 내용)
	public int update(int csno, String CSname, String CSarea, String CStel) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_UPDATE);
			pstmt.setString(1, CSname);
			pstmt.setString(2, CSarea);
			pstmt.setString(3, CStel);
			pstmt.setInt(4, csno);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end update()

	// 특정 uid 글 삭제하기
	public int deleteByUid(int uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_DELETE);
			pstmt.setInt(1, uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end deleteByUid()

	// 특정 CSNO 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCsno(int csno) throws SQLException {
		consDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CSNO_SELECT);
			pstmt.setInt(1, csno);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CSUID 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCsuid(String csuid) throws SQLException {
		consDTO[] arr = null;
		System.out.println("selectByCsuid 들어옴");

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CSUID_SELECT);
			pstmt.setString(1, csuid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CSNAME 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCSNAME(String csname) throws SQLException {
		consDTO[] arr = null;
		System.out.println("selectByCSNAME 들어옴");

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CSNAME_SELECT);
			pstmt.setString(1, csname);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CNAME 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCNAME(String csname) throws SQLException {
		consDTO[] arr = null;
		System.out.println("selectByCsuid 들어옴");

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CNAME_SELECT);
			pstmt.setString(1, csname);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CTEL 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCTEL(String csuid) throws SQLException {
		consDTO[] arr = null;
		System.out.println("selectByCsuid 들어옴");

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CTEL_SELECT);
			pstmt.setString(1, csuid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CSAREA 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByCSAREA(String csuid) throws SQLException {
		consDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(consD.SQL_CONS_CSAREA_SELECT);
			pstmt.setString(1, csuid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);

		} finally {
			close();
		}
		return arr;
	}

	// 특정 CSAREA 의 글 만 SELECT (조회수 증가 없슴!)
	public consDTO[] selectByRows(int curPage, int cnt, int totalPage, int pageRows) throws SQLException {
		final String SQL_WRITE_SELECT_FROM_ROW = "SELECT * FROM "
				+ "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT c2.*, c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO ORDER BY CSNO DESC) T) "
				+ "WHERE RNUM >= ? AND RNUM < ? ORDER BY CSNO DESC";

		consDTO[] arr = null;

		int fromRow = (curPage - 1) * pageRows + 1; // 몇번째 row 부터?
		try {
			pstmt = conn.prepareStatement(SQL_WRITE_SELECT_FROM_ROW);
			pstmt.setInt(1, fromRow);
			pstmt.setInt(2, fromRow + pageRows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	public int cntAll() throws SQLException {
		int cnt = 0;
		// 글 목록 전체 개수 가져오기
		final String SQL_WRITE_COUNT_ALL = "SELECT count(*) FROM Consulting";

		try {
			// 트랜잭션 실행
			pstmt = conn.prepareStatement(SQL_WRITE_COUNT_ALL);
			rs = pstmt.executeQuery();

			if (rs.next())
				cnt = rs.getInt(1); // count(*), 전체 글의 개수

		} finally {
			close();
		}
		return cnt;
	}

} // end class
