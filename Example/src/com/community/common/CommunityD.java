package com.community.common;

public class CommunityD {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	public static final String USERID = "team5"; // DB 접속 계정 정보
	public static final String USERPW = "team5";
	
	// 쿼리문 작성하기
	// Insert 쿼리문
	public static final String SQL_WRITE_INSERT = "INSERT INTO Question"
		+ "(Qno, Qtitle, Qcontent, Qkeyword, Qmember_id) "
		+ "VALUES(SEQ_question_Qno.nextval, ?, ?, ?, ?)";
	
	
	// View 화면에서 사용하는 쿼리문
	// no으로 데이터 조회하기(View에서도 사용하지면 update에서도 사용..!!, 기존 사용 내역 불러올때)
	public static final String SQL_SELECT_BY_QNO 
		= "SELECT * FROM Question WHERE Qno = ?";
	
	// click 수 증가
	public static final String SQL_INC_QCLICKCNT = "UPDATE Question SET "
			+ "Qclickcnt = Qclickcnt + 1 WHERE Qno = ?";

	
	// list.jsp
	// 전체 검색하기 (Insert문에서 사용 : Qno를 추출하기 위해) 
	public static final String SQL_WRITE_SELECT 
		= "SELECT * FROM Question ORDER BY Qno DESC";  
	
	// 페이징
	// 글 목록 전체 개수 가져오기
	public static final String SQL_COUNT_ALL = "SELECT count(*) FROM Question";
	
	// fromRow 부터 pageRows 만큼 SELECT
	// (몇번째) 부터 (몇개) 만큼
	public static final String SQL_SELECT_FROM_ROW =  "SELECT * FROM "
		+ "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM Question ORDER BY Qno DESC) T) "
		+ "WHERE RNUM >= ? AND RNUM < ?";
	
	
	/* Update.jsp */
	public static final String SQL_WRITE_UPDATE = "UPDATE Question " 
		+ "SET Qtitle = ?, Qcontent = ?, Qkeyword = ? WHERE Qno = ?";
	
	/* delete.jsp */
	public static final String SQL_DELETE_BY_QNO
		= "DELETE FROM Question WHERE Qno = ?";
	
	/* 댓글 삽입하기 */
	public static final String SQL_COMMENT_INSERT = "INSERT INTO QComment(Cno, Cqno, Ccontent, Cmember_id) "
		+ "VALUES(SEQ_QComment_Cno.nextval, ?, ?, ?)";
	
	/* 각각의 게시글에 맞는 댓글 전체 조회하기 */
	public static final String SQL_COMMENT_SELECT_ALL
		= "SELECT * FROM QComment WHERE Cqno=?";
	
	/* 댓글 삭제하기 */
	public static final String SQL_COMMENT_DELETE
		= "DELETE FROM QComment WHERE Cno = ?";
	
	/* 관리자가 볼 수 있는 댓글 전체 관리 보기 */
	public static final String SQL_COMMENT_SELECT_ADMIN_ALL
		= "SELECT * FROM QComment";
	
	/* 댓글 관리자 페이지 페이징 */
	public static final String SQL_COMMENT_COUNT_ALL
		= "SELECT count(*) FROM QComment";

	public static final String SQL_COMMENT_SELECT_FROM_ROW
		= "SELECT * FROM "
		+ "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM QComment ORDER BY Cno DESC) T) "
		+ "WHERE RNUM >= ? AND RNUM < ?";
	
	/* 신고 접수 */
	public static final String SQL_REPOT_INSERT
		= "INSERT INTO Qrepor(Rno, Rmember_id, Rtype, Rqno)"
		+ "VALUES(SEQ_Qrepor_Rno.nextval, ?, ?, ?)";
	
	/* 관리자가 볼 수 있는 신고 전체 리스트 보기 */
	public static final String SQL_REPOT_ADMIN_SELECT_ALL
		= "SELECT * FROM Qrepor";
	
	/* 신고하기 관리자 페이지 페이징 */
	public static final String SQL_REPORT_SELECT_ADMIN_ALL
		= "SELECT count(*) FROM Qrepor";

	public static final String SQL_REPOR_SELECT_FROM_ROW = "SELECT * FROM " 
		+ "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM Qrepor ORDER BY Rno DESC) T) " 
		+ "WHERE RNUM >= ? AND RNUM < ?";
	
}