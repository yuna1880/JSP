package com.kim.beans;

public class OrderDTO {
	private String pimage;
	private String pname;
	private String pbrand;
	private String pcaddress;
	private int pcaddressnum;
	private int ptotalprice;
	private String pccontent;
	private int pid;
	private int pclpcnt;
	private String pcregdate;
	private int pcstatus;
	private String pcuid;
	private String pcaddress2;

	public OrderDTO() {
		super();
	}

	public OrderDTO(String pimage, String pname, String pbrand, String pcaddress, int pcaddressnum, int ptotalprice,
			String pccontent,int pid ,int pclpcnt, int pcstatus, String pcuid,String pcaddress2) {
		super();
		this.pimage = pimage;
		this.pname = pname;
		this.pbrand = pbrand;
		this.pcaddress = pcaddress;
		this.pcaddressnum = pcaddressnum;
		this.ptotalprice = ptotalprice;
		this.pccontent = pccontent;
		this.pid=pid;
		this.pclpcnt = pclpcnt;
		this.pcstatus=pcstatus;
		this.pcuid=pcuid;
		this.pcaddress2=pcaddress2;

	}
	
	public String getPcaddress2() {
		return pcaddress2;
	}

	public void setPcaddress2(String pcaddress2) {
		this.pcaddress2 = pcaddress2;
	}

	public String getPcuid() {
		return pcuid;
	}

	public void setPcuid(String pcuid) {
		this.pcuid = pcuid;
	}

	public int getPcstatus() {
		return pcstatus;
	}

	public void setPcstatus(int pcstatus) {
		this.pcstatus = pcstatus;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPbrand() {
		return pbrand;
	}

	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}

	public String getPcaddress() {
		return pcaddress;
	}

	public void setPcaddress(String pcaddress) {
		this.pcaddress = pcaddress;
	}

	public int getPcaddressnum() {
		return pcaddressnum;
	}

	public void setPcaddressnum(int pcaddressnum) {
		this.pcaddressnum = pcaddressnum;
	}

	public int getPtotalprice() {
		return ptotalprice;
	}

	public void setPtotalprice(int ptotalprice) {
		this.ptotalprice = ptotalprice;
	}

	public String getPccontent() {
		return pccontent;
	}

	public void setPccontent(String pccontent) {
		this.pccontent = pccontent;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getPclpcnt() {
		return pclpcnt;
	}

	public void setPclpcnt(int pclpcnt) {
		this.pclpcnt = pclpcnt;
	}

	public String getPcregdate() {
		return pcregdate;
	}

	public void setPcregdate(String pcregdate) {
		this.pcregdate = pcregdate;
	}
	
	
	
}
