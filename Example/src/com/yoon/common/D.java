package com.yoon.common;

public class D {

	public static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static String UID = "team5";
	public static String UPW = "team5";

	public static String SQL_WRITE_SELECT = // 모든물건가져오기
			"SELECT * FROM product";

	// public static String SQL_WRITE_SELECT_BY_UID = // 카테고리별로 물건 가져오기
	// "SELECT * FROM product WHERE pcode=?";

	public static String SQL_PQLIST_SELECT_ALL_TODO = // 관리자모드에서 모든 문의내역 확인
			"SELECT p.PBRAND ,p.PNAME ,q.PQCONTENT ,q.PQANSWER " + "FROM PRODUCT p JOIN PQUESTION q "
					+ "ON p.PID =q.PQID" + ";";
	public static String SQL_PQLIST_SELECT_BY_UID_TODO = // 자신의 문의내역만 확인
			"SELECT p.PBRAND ,p.PNAME ,q.PQCONTENT ,q.PQANSWER " + "FROM PRODUCT p JOIN PQUESTION "
					+ "ON p.PID =q.PQID " + "WHERE q.PQUID ='?';";
	public static String SQL_PQLIST_SELECT_ALL = // 모든물건가져오기
			"SELECT p.PBRAND ,p.PNAME ,q.PQid,q.PQpid,q.PQuid,q.PQregdate,q.PQcontent,q.PQANSWER FROM PRODUCT p INNER JOIN PQUESTION q ON p.PID =q.PQID";
	public static String SQL_PQLIST_SELECT_BY_PID = // 모든물건가져오기
			"SELECT p.PBRAND ,p.PNAME ,q.PQid,q.PQpid,q.PQuid,q.PQregdate,q.PQcontent,q.PQANSWER FROM PRODUCT p INNER JOIN PQUESTION q ON p.PID =q.PQPID WHERE p.pid = ?";

	public static String SQL_PQLIST_SELECT_BY_UID = // 모든물건가져오기
			"SELECT p.PBRAND ,p.PNAME ,q.PQid,q.PQpid,q.PQuid,q.PQregdate,q.PQcontent,q.PQANSWER FROM PRODUCT p INNER JOIN PQUESTION q ON p.PID =q.PQPID WHERE q.pquid = ?";

	public static String SQL_PQLIST_UPDATE = "UPDATE PQUESTION SET PQANSWER =? WHERE PQID =?";

	public static final String SQL_INSERT_QUESTION = "INSERT INTO PQUESTION VALUES (pquestion_seq.nextval,?,?,sysdate,?,?)";
	public static final String SQL_DELEDTE_QUESTION = "DELETE FROM PQUESTION WHERE pqid = ?";

	public static final String SQL_WRITE_SELECT_BY_UID = "SELECT * FROM product WHERE pid = ?";

	// 특정 글 (wr_uid)의 첨부파일 1개 INSERT
	public static final String SQL_FILE_INSERT = "INSERT INTO PIMAGE VALUES (pfile_seq.nextval,?,?,?)";
	public static final String SQL_FILE_SELECT_BY_PID = "SELECT * FROM PIMAGE WHERE PFPID =?";

	// 특정 글 (wr_uid)의 첨부파일들 SELECT
	public static final String SQL_FILE_SELECT = "SELECT pfuid, bf_source, bf_file FROM Pimage "
			+ "WHERE wr_uid = ? " + "ORDER BY pfuid DESC";

	// 특정 첨부파일 (pfuid) SELECT
	public static final String SQL_FILE_SELECT_BY_UID = "SELECT pfuid, bf_source, bf_file FROM Pimage "
			+ "WHERE pfuid = ?";

	// 특정 첨부파일 (pfuid) DELETE
	public static final String SQL_FILE_DELETE_BY_UID = "DELETE FROM Pimage WHERE pfuid = ?";

	// 특정 글의 (wr_uid) 의 첨부파일 DELETE
	public static final String SQL_FILE_DELETE_BY_WRUID = "DELETE FROM Pimage WHERE wr_uid = ?";


	public static final String SQL_DELEDTE_PRODUCT = "DELETE FROM PRODUCT WHERE pid = ?";
	public static String SQL_UPDATE_PRODUCT = "UPDATE PRODUCT SET pname=?,pprice=?,pbrand=? WHERE PID =?";

}
