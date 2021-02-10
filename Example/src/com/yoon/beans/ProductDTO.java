package com.yoon.beans;

public class ProductDTO {

	private int pid;
	private String pname;
	private String pprice;
	private String pbrand; 
	private String pimage;
	private int pcode;

	
	
	public ProductDTO() {
		super();
	}



	public ProductDTO(int pid, String pname, String pprice, String pbrand, String pimage, int pcode) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pbrand = pbrand;
		this.pimage = pimage;
		this.pcode = pcode;
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getPname() {
		return pname;
	}



	public void setPname(String pname) {
		this.pname = pname;
	}



	public String getPprice() {
		return pprice;
	}



	public void setPprice(String pprice) {
		this.pprice = pprice;
	}



	public String getPbrand() {
		return pbrand;
	}



	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}



	public String getPimage() {
		return pimage;
	}



	public void setPimage(String pimage) {
		this.pimage = pimage;
	}



	public int getPcode() {
		return pcode;
	}



	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	
	
	
}
