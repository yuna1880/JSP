package com.cons.beans;

public class comDTO {
	private int cno;
	private String cname;
	private String cadr;
	private String ctel;
	private String carea;
	private String ccategory;
	
	public comDTO(int cno, String cname, String cadr, String ctel, String carea, String ccategory) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.cadr = cadr;
		this.ctel = ctel;
		this.carea = carea;
		this.ccategory = ccategory;
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCadr() {
		return cadr;
	}
	public void setCadr(String cadr) {
		this.cadr = cadr;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCarea() {
		return carea;
	}
	public void setCarea(String carea) {
		this.carea = carea;
	}
	public String getCcategory() {
		return ccategory;
	}
	public void setCcategory(String ccategory) {
		this.ccategory = ccategory;
	}
	
	
	
}	// end main
