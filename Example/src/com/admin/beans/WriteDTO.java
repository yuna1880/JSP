package com.admin.beans; 

import java.sql.Timestamp;

// DTO : Data Trasfer Object
//    데이터를 담아 나르기 위한 객체

// 게시글DTO, 회원DTO, ... 필요한 데이터 객체들 만큼 정의
// Bean 객체

public class WriteDTO {
	
	private String MEMBER_ID;   //wr_subject
	private String MEMBER_PW;   //wr_content
	private String MEMBER_NAME;  // wr_name
	
	private String MEMBER_EMAIL;   // wr_regdate
	private Timestamp MEMBER_JOIN_DATE;
	
	// 개발시..
	// 다음 3가지 네이밍은 일치시켜주는 것이 좋다 .
	// 클래스 필드명 = DB 필드명  = form 의 name명
	public WriteDTO() {
		super();
	}
	
	
    
	

	public WriteDTO(String mEMBER_ID, String mEMBER_PW, String mEMBER_NAME, String mEMBER_EMAIL,
			Timestamp mEMBER_JOIN_DATE) {
		super();
		MEMBER_ID = mEMBER_ID;
		MEMBER_PW = mEMBER_PW;
		MEMBER_NAME = mEMBER_NAME;
		MEMBER_EMAIL = mEMBER_EMAIL;
		MEMBER_JOIN_DATE = mEMBER_JOIN_DATE;
	}






	// getter / setter
	
	
	// 테스트, 개발용으로 toString() 오버라이딩 하면 좋다.
	@Override
	public String toString() {
		return "WriteDTO] " + MEMBER_ID + " : " + MEMBER_PW + " : " 
				+ MEMBER_NAME + " : " + MEMBER_EMAIL ;
	}





	public String getMEMBER_ID() {
		return MEMBER_ID;
	}





	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}





	public String getMEMBER_PW() {
		return MEMBER_PW;
	}





	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}





	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}





	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}





	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}





	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}





	public Timestamp getMEMBER_JOIN_DATE() {
		return MEMBER_JOIN_DATE;
	}





	public void setMEMBER_JOIN_DATE(Timestamp mEMBER_JOIN_DATE) {
		MEMBER_JOIN_DATE = mEMBER_JOIN_DATE;
	}


} // end DTO

















