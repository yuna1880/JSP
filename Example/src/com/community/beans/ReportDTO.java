package com.community.beans;

public class ReportDTO {
	
	// 데이터를 담을 객체
	private int Rno;		// 신고번호  No, PK
	private String Rid;		// 신고 아이디, FK
	private int Rtype;		// 신고 유형
	private int Rqno;		// 게시글 번호, FK

	// 기본생성자, 매개변수 생성자
	public ReportDTO() {}

	public ReportDTO(int rno, String rid, int rtype, int rqno) {
		super();
		Rno = rno;
		Rid = rid;
		Rtype = rtype;
		Rqno = rqno;
	}

	
	// setter, getter
	public int getRno() {
		return Rno;
	}
	public void setRno(int rno) {
		Rno = rno;
	}

	public String getRid() {
		return Rid;
	}
	public void setRid(String rid) {
		Rid = rid;
	}

	public int getRtype() {
		return Rtype;
	}
	public void setRtype(int rtype) {
		Rtype = rtype;
	}

	public int getRqno() {
		return Rqno;
	}
	public void setRqno(int rqno) {
		Rqno = rqno;
	}
	
} // end class