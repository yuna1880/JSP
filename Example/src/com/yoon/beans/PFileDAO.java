package com.yoon.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yoon.common.D;

public class PFileDAO {

		Connection conn;
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		
		// DAO 객체가 생성될때 Connection 도 생성된다
		public PFileDAO(){
			try {
				Class.forName(D.DRIVER);
				conn = DriverManager.getConnection(D.URL, D.UID, D.UPW);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}// 생성자
		
		// DB 자원 반납 메소드, 만들어놓으면 편함..
		public void close() throws SQLException{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} // end close();
		
		
		//특정 글(wr_uid) 에 첨부파일들 추가 
		public int insert(int pid,
				List<String> orginalFileNames,
				List<String> fileSystemNames
				) throws SQLException {
			int cnt = 0;
			
			
			//첨부파일 정보 추가(저장)하기
			pstmt = conn.prepareStatement(D.SQL_FILE_INSERT);
			System.out.println(orginalFileNames.size());
			for (int i = 0; i < orginalFileNames.size(); i++) {
				pstmt.setString(1, orginalFileNames.get(i));
				pstmt.setString(2, fileSystemNames.get(i));
				pstmt.setInt(3, pid);
				cnt += pstmt.executeUpdate();
			}
			
			
			return 1;
		}
		public PFileDTO[] createArray(ResultSet rs) throws SQLException{
			PFileDTO arr[] = null;   // DTO 배열로 리턴할거다
			ArrayList<PFileDTO> list = new ArrayList<PFileDTO>();
			
			while(rs.next()){
				int uid = rs.getInt("pfuid");
				String source = rs.getString("pfsource");
				String file = rs.getString("pffile");

				PFileDTO dto = new PFileDTO(uid, source, file);
				list.add(dto);
			}//end while		
			
			arr = new PFileDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큰의 배열 생성
			list.toArray(arr); //리스트에 저장된 데이터를 배열 객체에 복사
			return arr;
		} // end createArray()

		// 특정 wr_uid 의 첨부파일(들) 정보 SELECT
		public PFileDTO[] selectFilesByPid(int pid) throws SQLException{

			PFileDTO arr[] = null;
			try{
				// 트랜잭션 처리
				pstmt = conn.prepareStatement(D.SQL_FILE_SELECT_BY_PID);
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
			}finally{
				close();
			} // end try		
			return arr;
		} // end selectFilesByWrUid()




	} // end DAO
