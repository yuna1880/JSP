package com.yoon.beans;

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

import com.yoon.common.D;

public class PQuestionDAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, excuteQuery()

	public PQuestionDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.UID, D.UPW);
			System.out.println("PQuestionDAO생성");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();

	}

	public PQuestionDTO[] createArray(ResultSet rs) throws SQLException {
		PQuestionDTO[] arr = null; // DTO 배열

		ArrayList<PQuestionDTO> list = new ArrayList<PQuestionDTO>();

		while (rs.next()) {

	
			String pbrand = rs.getString("pbrand");
			String pname = rs.getString("pname");
			int pqid = rs.getInt("pqid");
			int pqpid = rs.getInt("pqpid");
			String pquid = rs.getString("pquid");
			Date d = rs.getDate("pqregdate");
			Time t = rs.getTime("pqregdate");

			String pqregdate = "";
			if (d != null) {
				pqregdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}

			String pqcontent = rs.getString("pqcontent");
			String pqanswer = rs.getString("pqanswer");

			PQuestionDTO dto = new PQuestionDTO(pbrand, pname, pqid, pqpid, pquid, pqregdate, pqcontent, pqanswer);

			list.add(dto);
		}
		int size = list.size();
		if (size == 0) {
			System.out.println("null");
			return null;
		}
		System.out.println(size);
		arr = new PQuestionDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;

	}

	// 전체 SELECT
	public PQuestionDTO[] select() throws SQLException {
		PQuestionDTO[] arr = null;

		try {
			System.out.println("try");
			pstmt = conn.prepareStatement(D.SQL_PQLIST_SELECT_ALL);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		
		} finally {
			close();
		}

		return arr;
	}
	
	public int pqupdate(int pqid, String pqanswer)throws SQLException{
		int cnt = 0;
		
		
		try {
			  pstmt=conn.prepareStatement(D.SQL_PQLIST_UPDATE);
			  pstmt.setString(1, pqanswer);
			  pstmt.setInt(2, pqid);
			  
			  cnt = pstmt.executeUpdate();
		  }finally {
			  close();
		  }
		
		return cnt;
	}
	public PQuestionDTO[] selectbypid(int pid) throws SQLException {
		PQuestionDTO[] arr = null;
		try {
			System.out.println("try");
			pstmt = conn.prepareStatement(D.SQL_PQLIST_SELECT_BY_PID);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			/* System.out.println(arr.length); */
		} finally {
			close();
		}

		return arr;
	}
	public PQuestionDTO[] selectbypquid(String pquid) throws SQLException {
		PQuestionDTO[] arr = null;
		try {
			System.out.println("try");
			pstmt = conn.prepareStatement(D.SQL_PQLIST_SELECT_BY_UID);
			pstmt.setString(1, pquid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			/* System.out.println(arr.length); */
		} finally {
			close();
		}
		
		return arr;
	}
	
	public int pqwrite(int pqpid, String pquid,String pqcontent,String pqanswer)throws SQLException{
		int cnt = 0;
		
		
		try {
			  pstmt=conn.prepareStatement(D.SQL_INSERT_QUESTION);
			  pstmt.setInt(1, pqpid);
			  pstmt.setString(2, pquid);
			  pstmt.setString(3, pqcontent);
			  pstmt.setString(4, pqanswer);
			  
			  cnt = pstmt.executeUpdate();
		  }finally {
			  close();
		  }
		
		return cnt;
	}public int pqdelete(int pqid)throws SQLException{
		int cnt = 0;
		
		
		try {
			  pstmt=conn.prepareStatement(D.SQL_DELEDTE_QUESTION);
			  pstmt.setInt(1, pqid);
			  cnt = pstmt.executeUpdate();
		  }finally {
			  close();
		  }
		
		return cnt;
	}
}
