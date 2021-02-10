package com.community.beans;

public class WriteDTO {
	
	// 각각 담을 데이터 객체
	private int no;			// 게시글 No, PK
	private String title; 	// 게시글 제목 글자수 : 7 ~ 20자
	private String content;	// 게시글 안의 내용물 : 제한 없음
	private String regDate;	// 날짜
	private int clickCnt;	// 클릭수
	private String keyword;	// 키워드
	private String qid;		// 작성자, FK
	
	
	// 기본생성자, 매개변수 생성자
	public WriteDTO() {}

	public WriteDTO(int no, String title, String content, int clickCnt, String keyword, String qid) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.clickCnt = clickCnt;
		this.keyword = keyword;
		this.qid = qid;
	}
	
	
	// getter, setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getClickCnt() {
		return clickCnt;
	}
	public void setClickCnt(int clickCnt) {
		this.clickCnt = clickCnt;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	
	
} // end DTO