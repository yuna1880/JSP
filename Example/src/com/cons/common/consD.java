package com.cons.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class consD {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	public static final String USERID = "team5"; // DB 접속 계정 정보
	public static final String USERPW = "team5";

	// 회사Info DB
	public static final String SQL_COM_SELECT = // 회사 INFO 읽어오기
			"SELECT * FROM Company";

	public static final String SQL_COM_SELECT_BY_UID = // 글 읽어 오기
			"SELECT * FROM Company WHERE Cno = ?";

	// consManager페이지 SQL문-----------------------------------------------------------------------------------------------------------------------------------------
	public static final String SQL_CONS_WRITE = // 상담 신청서 입력
			"INSERT INTO Consulting VALUES(cons_write_seq.nextval,?,?,?,?,?)";
	// WHERE CAREA = '?'

	// 상담신청 DB
	public static final String SQL_CONS_SELECT = // 회사 INFO 읽어오기
			"SELECT c2.*, c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO";

	// 상담신청수정 DB
	public static final String SQL_CONS_UPDATE = // 회사 INFO 읽어오기
			"UPDATE Consulting SET CSNAME = ?, CSAREA = ?, CSTEL =? WHERE CSNO = ?";
	
	// 상담신청삭제 DB
	public static final String SQL_CONS_DELETE = // 상담 신청서 삭제
			"DELETE FROM CONSULTING WHERE CSNO = ?";
	
	// consManager 검색부분 SQL문-----------------------------------------------------------------------------------------------------------------------------------------
	// 상담신청 순서로 검색
	public static final String SQL_CONS_CSNO_SELECT =
		"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c2.CSNO = ?";	

	// 상담신청한 유저 아이디로 검색
	public static final String SQL_CONS_CSUID_SELECT =
			"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c2.CSUID = ?";	

	// 상담신청한 유저 이름으로 검색
	public static final String SQL_CONS_CSNAME_SELECT =
			"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c2.CSNAME = ?";	

	// 상담신청 업체명 검색
	public static final String SQL_CONS_CNAME_SELECT =
			"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c1.CNAME = ?";	

	// 상담신청 전화번호 검색
	public static final String SQL_CONS_CTEL_SELECT =
			"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c2.CSTEL = ?";	

	// 상담신청 시공지역 검색
	public static final String SQL_CONS_CSAREA_SELECT =
			"SELECT c2.CSNO, c2.CSNAME, c2.CSUID, c1.CNO, c2.CSAREA , c2.CSTEL , c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO WHERE c2.CSAREA = ?";	

	
	// 페이징
	// 글 목록 전체 개수 가져오기
	public static final String SQL_COM_COUNT_ALL = 
			"SELECT count(*) FROM Company";
	
	// fromRow 부터 pageRows 만큼 SELECT
	// (몇번째) 부터 (몇개) 만큼
	public static final String SQL_COM_SELECT_FROM_ROW = 
			"SELECT * FROM " + 
			"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM Company ORDER BY CNO DESC) T) " + 
			"WHERE RNUM >= ? AND RNUM < ?";


} // end class
