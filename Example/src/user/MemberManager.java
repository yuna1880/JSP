package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MemberManager {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private DataSource ds;

	

	//데이터베이스 연결

	public MemberManager() {

		try{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("jdbc/OracleDB");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	

	//id 체크

	public boolean checkId(String id){

		boolean b = false;

		try {

			String sql = "select MEMBER_id from MEMBER where MEMBER_id like ?";

			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			b=rs.next();

		} catch (Exception e) {

			System.out.println("checkId err : " + e);

		} finally {

			try {

				if(rs!=null)rs.close();

				if(pstmt!=null)pstmt.close();

				if(conn!=null)conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

		return b;

	}


//우편번호 탐색 : 동 이름으로 우편번호 탐색

	public ArrayList<ZipcodeBean> zipcodeRead(String area3){

		ArrayList<ZipcodeBean> list = new ArrayList<ZipcodeBean>();

		try {

			String sql = "select * from zipcode where area3 like ?";

			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%"+area3+"%");

			rs = pstmt.executeQuery();

			while(rs.next()){

				ZipcodeBean bean = new ZipcodeBean();

				bean.setZipcode(rs.getString("zipcode"));

				bean.setArea1(rs.getString("area1"));

				bean.setArea2(rs.getString("area2"));

				bean.setArea3(rs.getString("area3"));

				bean.setArea4(rs.getString("area4"));

				list.add(bean);

			}

			 

			

		} catch (Exception e) {

			System.out.println("zipcodeRead err : " + e);

		} finally {

			try {

				if(rs!=null)rs.close();

				if(pstmt!=null)pstmt.close();

				if(conn!=null)conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

		return list;

	}
	//회원가입

	public boolean insertMember(MemberBean mb) throws SQLException{
			String sql=null;
			boolean result = false;

			try {

				conn = ds.getConnection();
				sql="insert into member values "+
					"(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mb.getMEMBER_ID());
				pstmt.setString(2, mb.getMEMBER_PW());
				pstmt.setString(3, mb.getMEMBER_NAME());
				pstmt.setInt(4, mb.getMEMBER_JUMIN1());
				pstmt.setInt(5, mb.getMEMBER_JUMIN2());
				pstmt.setString(6, mb.getMEMBER_EMAIL());
				pstmt.setString(7, mb.getMEMBER_EMAIL_GET());
				pstmt.setString(8, mb.getMEMBER_MOBILE());
				pstmt.setString(9, mb.getMEMBER_PHONE());
				pstmt.setString(10, mb.getMEMBER_ZIPCODE());
				pstmt.setString(11, mb.getMEMBER_ADDR1());
				pstmt.setString(12, mb.getMEMBER_ADDR2());
				pstmt.setInt(13, mb.getMEMBER_ADMIN());
				pstmt.setTimestamp(14, mb.getMEMBER_JOIN_DATE());
				pstmt.executeUpdate();
				
				result = true;
			}catch(Exception e){
				e.printStackTrace();
			}	finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception ex) {}
			}
			
			return result;
		}

}