package com.yoon.beans;

import java.sql.Date;

public class PQuestionDTO {
	
	private String pbrand;
	private String pname;
	private int pqid;
	private int pqpid;
	private String pquid;
	private String pqregdate;
	private String pqcontent;
	private String pqanswer;
	
	
	public String getPbrand() {
		return pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public PQuestionDTO() {
		super();
	}

	public PQuestionDTO(String pbrand, String pname, int pqid, int pqpid, String pquid, String pqregdate,
			String pqcontent, String pqanswer) {
		super();
		this.pbrand = pbrand;
		this.pname = pname;
		this.pqid = pqid;
		this.pqpid = pqpid;
		this.pquid = pquid;
		this.pqregdate = pqregdate;
		this.pqcontent = pqcontent;
		this.pqanswer = pqanswer;
	}

	public int getPqid() {
		return pqid;
	}

	public void setPqid(int pqid) {
		this.pqid = pqid;
	}

	public int getPqpid() {
		return pqpid;
	}

	public void setPqpid(int pqpid) {
		this.pqpid = pqpid;
	}

	public String getPquid() {
		return pquid;
	}

	public void setPquid(String pquid) {
		this.pquid = pquid;
	}

	public String getPqregdate() {
		return pqregdate;
	}

	public void setPqregdate(String pqregdate) {
		this.pqregdate = pqregdate;
	}

	public String getPqcontent() {
		return pqcontent;
	}

	public void setPqcontent(String pqcontent) {
		this.pqcontent = pqcontent;
	}

	public String getPqanswer() {
		return pqanswer;
	}

	public void setPqanswer(String pqanswer) {
		this.pqanswer = pqanswer;
	}
	
	
	
}
