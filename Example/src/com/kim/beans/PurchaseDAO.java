package com.kim.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.kimcommon.D;

public class PurchaseDAO {

		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;   // SELECT 결과, executeQuery()
		
		// DAO 객체가 생성될때 Connection 도 생성된다.
		public PurchaseDAO() {
			
			try {
				Class.forName(D.DRIVER);
				conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
				System.out.println("PurchaseDAO 생성, 데이터 베이스 연결!");
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
		
		
		// 구매,결제 페이지 작성 <-- DTO
		public int insert(PurchaseDTO dto) throws SQLException {
			String pcuid=dto.getPcuid();
		
			
			int pcaddressnum=dto.getPcaddressnum();
			String pcaddress=dto.getPcaddress();
			int ptotalprice=dto.getPtotalprice();
			String pccontent=dto.getPccontent();
			int pccardnum=dto.getPccardnum();
			int pid=dto.getPid();
			int pclpcnt=dto.getPclpcnt();
			String pcaddress2=dto.getPcaddress2();
			

			int cnt = this.insert(pcuid,pcaddressnum,pcaddress,ptotalprice,pccontent,pccardnum,pid,pclpcnt,pcaddress2);
			return cnt;
		}
		
		// 구매,결제 페이지 작성 <-- 제목, 내용, 작성자 
		public int insert(String pcuid,int pcaddressnum,String pcaddress, int ptotalprice,String pccontent,int pccardnum,
			int pid ,int pclpnt,String pcaddress2) throws SQLException {
			int cnt = 0;
			
			try {			
				pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
				pstmt.setString(1, pcuid);
				pstmt.setInt(2, pcaddressnum);
				pstmt.setString(3, pcaddress);
				pstmt.setInt(4, ptotalprice);	
				pstmt.setString(5, pccontent);
				pstmt.setInt(6, pccardnum);
				pstmt.setInt(7,pid);
				pstmt.setInt(8,pclpnt);
				pstmt.setString(9,pcaddress2);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();			
			}

			return cnt;
		}
		
		// ResultSet --> DTO 배열로 리턴
		public PurchaseDTO [] createArray(ResultSet rs) throws SQLException {
			PurchaseDTO [] arr = null;  // DTO 배열
			
			ArrayList<PurchaseDTO> order = new ArrayList<PurchaseDTO>();
			
			while(rs.next()) {
				int pcid = rs.getInt("pcid");
				String pcuid = rs.getString("pcuid");
				int ptotalprice=rs.getInt("ptotalprice");
				int pcstatus=rs.getInt("pcstatus");
				String pcaddress = rs.getString("pcaddress");
				int pcaddressnum=rs.getInt("pcaddressnum");
				String pccontent = rs.getString("pccontent");
				int pccardnum =rs.getInt("pccardnum");
				int pclpid =rs.getInt("pclpid");
				int pclpcnt = rs.getInt("pclpcnt");
				String pcaddress2 = rs.getString("pcaddress2");
				
				Date d = rs.getDate("pcregdate");
				Time t = rs.getTime("pcregdate");
				
				String pcregdate = "";
				if(d != null){
					pcregdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
				PurchaseDTO dto = new PurchaseDTO(pcid, pcuid, ptotalprice, pcstatus, pcaddress,
						pcaddressnum,pccontent,pccardnum,pclpid,pclpcnt,pcaddress2);
				dto.setPcregdate(pcregdate);
				order.add(dto);
				
			} // end while
			
			int size = order.size();
			
			if(size == 0) return null;
			
			arr = new PurchaseDTO[size];
			order.toArray(arr);  // List -> 배열		
			return arr;
		}
		
				
}//end DAO
