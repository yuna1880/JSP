package com.cons.beans;

public class consDTO {
	private int csno;
	private String csuid;
	private String csname;
	private int cno;
	private String csarea;
	private String cstel;
	private String cname;
	
	public consDTO(int csno, String csuid, String csname, int cno, String csarea, String cstel, String cname) {
		super();
		this.csno = csno;
		this.csuid = csuid;
		this.csname = csname;
		this.cno = cno;
		this.csarea = csarea;
		this.cstel = cstel;
		this.cname = cname;
	}
	public int getCsno() {
		return csno;
	}
	public void setCsno(int csno) {
		this.csno = csno;
	}
	public String getCsuid() {
		return csuid;
	}
	public void setCsuid(String csuid) {
		this.csuid = csuid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCsarea() {
		return csarea;
	}
	public void setCsarea(String csarea) {
		this.csarea = csarea;
	}
	public String getCstel() {
		return cstel;
	}
	public void setCstel(String cstel) {
		this.cstel = cstel;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
	
}
