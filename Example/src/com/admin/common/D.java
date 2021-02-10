package com.admin.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	public static final String USERID = "team5";  // DB 접속 계정 정보
	public static final String USERPW = "team5";
	
	public static final String SQL_MEMBER_SELECT = 
			"SELECT * FROM MEMBER order by MEMBER_JOIN_DATE desc"; 

	
	  public static final String SQL_WRITE_INSERT = "insert into member values  " +
	  
	 "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	 public static final String SQL_WRITE_INC_VIEWCNT = // 조회수 증가
	 "UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";
	  
	  //public static final String SQL_WRITE_SELECT_BY_UID = // 글 읽어 오기
//	  public static final String SQL_WRITE_SELECT_BY_UID = // 글 읽어 오기
////	  "select MEMBER_PW from member where MEMBER_ID=?;
//			  "delete from member where MEMBER_ID=?";
	 
	 public static final String SQL_WRITE_UPDATE =
	  "UPDATE test_write SET wr_subject = ?, wr_content = ? WHERE wr_uid = ?";
	 
	  public static final String SQL_WRITE_DELETE_BY_UID =
	  "DELETE FROM MEMBER WHERE MEMBER_ID = ?";
	
	
	 public static final String SQL_WRITE_SELECT_BY_UID = // 글 읽어 오기
			  "select MEMBER_ID , MEMBER_NAME, MEMBER_PW, MEMBER_EMAIL1, MEMBER_JOIN_DATE FROM MEMBER where MEMBER_ID = ?";

	 // 페이징 처리
	 public static final String SQL_MEMBER_COUNT_ALL = 
			 "SELECT count(*) FROM MEMBER";  // 전체 목록 개수 가져오기
	 
	// fromRow 부터 pageRows 만큼 SELECT
		// (몇번째) 부터 (몇개) 만큼
	 public static final String SQL_MEMBER_SELECT_FROM_ROW =
			 "SELECT * FROM " + 
						"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM test_write ORDER BY wr_uid DESC) T) " + 
						"WHERE RNUM >= ? AND RNUM < ?";
 
}





























