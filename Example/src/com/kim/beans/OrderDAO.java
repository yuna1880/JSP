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

public class OrderDAO {

		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;   // SELECT 결과, executeQuery()
		
		// DAO 객체가 생성될때 Connection 도 생성된다.
		public OrderDAO() {
			
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
		
		
		
		// ResultSet --> DTO 배열로 리턴
		public OrderDTO [] createArray(ResultSet rs) throws SQLException {
			OrderDTO [] arr = null;  // DTO 배열
			
			ArrayList<OrderDTO> order = new ArrayList<OrderDTO>();
			
			while(rs.next()) {
				String pimage =rs.getString("pimage");
				String pname = rs.getString("pname");
				String pbrand = rs.getString("pbrand");
				String pcaddress = rs.getString("pcaddress");
				int pcaddressnum=rs.getInt("pcaddressnum");
				int ptotalprice = rs.getInt("ptotalprice");
				String pccontent = rs.getString("pccontent");
				int pid= rs.getInt("pid");
				int pclpcnt = rs.getInt("pclpcnt");
				int pcstatus= rs.getInt("pcstatus");
				String pcuid = rs.getString("pcuid");
				String pcaddress2=rs.getString("pcaddress2");
				
				Date d = rs.getDate("pcregdate");
				Time t = rs.getTime("pcregdate");
				
				String pcregdate = "";
				if(d != null){
					pcregdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
				OrderDTO dto = new OrderDTO(pimage,pname,pbrand,pcaddress,pcaddressnum,
						ptotalprice,pccontent,pid,pclpcnt,pcstatus,pcuid,pcaddress2);
				dto.setPcregdate(pcregdate);
				order.add(dto);
				
			} // end while
			
			int size = order.size();
			
			if(size == 0) return null;
			
			arr = new OrderDTO[size];
			order.toArray(arr);  // List -> 배열		
			return arr;
		}
		
		// 전체 SELECT
		public OrderDTO [] select(String pcuid) throws SQLException {
			OrderDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_ORDER_SELECT);
				pstmt.setString(1, pcuid);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}		
			
			return arr;
		} // end select()
		
		// 관리자 SELECT
		public OrderDTO [] mSelect( ) throws SQLException {
			OrderDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_MORDER_SELECT);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}		
			
			return arr;
		} // end select()
		
		public OrderDTO [] mSort() throws SQLException {
			OrderDTO [] arrS = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_ORDER_SELECT_SORT);
				rs = pstmt.executeQuery();
				arrS = createArray(rs);
			} finally {
				close();
			}		
			
			return arrS;
		} // end select()
		
		
		
		
		
		// 특정 uid 글 삭제하기
		public int deleteByUid(int pid) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_UID);
				pstmt.setInt(1, pid);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}		
			return cnt;
		} // end deleteByUid()
		
		public int listCnt(int pcstatus) throws SQLException {
			OrderDTO[] cnt = null;
			try {
				pstmt = conn.prepareStatement(D.SQL_ORDER_SELECT_STATUS);
				pstmt.setInt(1, pcstatus);
				rs = pstmt.executeQuery();
				cnt = createArray(rs);
			} finally {
				close();
			}
			
			if(cnt==null) {
				return 0;
			}else {
				return cnt.length;
			}
			
		} // end listCnt()
		
		public int orderList(String pcuid, int pcstatus) throws SQLException {
			OrderDTO[] cnt = null;
			try {
				pstmt = conn.prepareStatement(D.SQL_ORDER_LIST);
				pstmt.setString(1, pcuid);
				pstmt.setInt(2, pcstatus);
				rs = pstmt.executeQuery();
				cnt = createArray(rs);
			} finally {
				close();
			}
			
			if(cnt==null) {
				return 0;
			}else {
				return cnt.length;
			}
			
		} // end listCnt()
		
		
		// 특정 uid 의 글 수정 (제목, 내용)
		public int update(int pid, String pccontent) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
				pstmt.setString(1, pccontent);
				pstmt.setInt(2, pid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}		
			
			return cnt;
		} // end update()
		
		public int cancel(int pid) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(D.SQL_STATUS_UPDATE);
//				pstmt.setInt(1, pcstatus);
				pstmt.setInt(1, pid);
				
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}		
			
			return cnt;
		} // end cancel()
			
		
		
		
		
}//end DAO
