package com.community.beans;

public class CommentDTO {
	
	// 각각 담을 데이터 객체
	private int Cno;			// 댓글  No
	private int Cqno;			// PK, 게시글 번호
	private String Ccomment;	// 댓글 내용
	private String CregDate;	// 댓글 등록 날짜
	private String Cid;			// FK
	
	// 기본생성자, 매개변수 생성자
	public CommentDTO() {}

	public CommentDTO(int cno, int cqno, String ccomment, String cid) {
		super();
		Cno = cno;
		Cqno = cqno;
		Ccomment = ccomment;
		Cid = cid;
	}

	
	// getter, setter
	public int getCno() {
		return Cno;
	}
	public void setCno(int cno) {
		Cno = cno;
	}

	public int getCqno() {
		return Cqno;
	}
	public void setCqno(int cqno) {
		Cqno = cqno;
	}

	public String getCcomment() {
		return Ccomment;
	}
	public void setCcomment(String ccomment) {
		Ccomment = ccomment;
	}

	public String getCregDate() {
		return CregDate;
	}
	public void setCregDate(String cregDate) {
		CregDate = cregDate;
	}

	public String getCid() {
		return Cid;
	}
	public void setCid(String cid) {
		Cid = cid;
	}
	
	
} // end CommentDTO