package com.kim.beans;

public class PurchaseDTO {
	private int pcid;
	private String pcuid;
	private int ptotalprice;
	private String pcregdate;
	private int pcstatus;
	private String pcaddress;
	private int pcaddressnum;
	private String pccontent;
	private int pccardnum;
	private int pid;
	private int pclpcnt;
	private String pcaddress2;

	public PurchaseDTO() {
		super();
	}

	public PurchaseDTO(int pcid, String pcuid, int ptotalprice, int pcstatus, String pcaddress,
			int pcaddressnum, String pccontent, int pccardnum,int pid, int pclpcnt,String pcaddress2) {
		super();
		this.pcid = pcid;
		this.pcuid = pcuid;
		this.ptotalprice = ptotalprice;
		this.pcstatus = pcstatus;
		this.pcaddress = pcaddress;
		this.pcaddressnum = pcaddressnum;
		this.pccontent = pccontent;
		this.pccardnum = pccardnum;
		this.pid = pid;
		this.pclpcnt = pclpcnt;
		this.pcaddress2=pcaddress2;

	}

	public String getPcaddress2() {
		return pcaddress2;
	}

	public void setPcaddress2(String pcaddress2) {
		this.pcaddress2 = pcaddress2;
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

	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	public String getPcuid() {
		return pcuid;
	}

	public void setPcuid(String pcuid) {
		this.pcuid = pcuid;
	}

	public int getPtotalprice() {
		return ptotalprice;
	}

	public void setPtotalprice(int ptotalprice) {
		this.ptotalprice = ptotalprice;
	}

	public String getPcregdate() {
		return pcregdate;
	}

	public void setPcregdate(String pcregdate) {
		this.pcregdate = pcregdate;
	}

	public int getPcstatus() {
		return pcstatus;
	}

	public void setPcstatus(int pcstatus) {
		this.pcstatus = pcstatus;
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

	public String getPccontent() {
		return pccontent;
	}

	public void setPccontent(String pccontent) {
		this.pccontent = pccontent;
	}

	public int getPccardnum() {
		return pccardnum;
	}

	public void setPccardnum(int pccardnum) {
		this.pccardnum = pccardnum;
	}

}
