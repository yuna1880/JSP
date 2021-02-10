package com.yoon.beans;

public class PFileDTO {

	private int uid;
	private String source;
	private String file;
	private boolean isImage;
	
	public PFileDTO() {
		super();
	}
	
	public PFileDTO(int uid, String source, String file) {
		super();
		this.uid = uid;
		this.source = source;
		this.file = file;
		this.isImage=isImage;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public boolean isImage() {
		return isImage;
	}
	public void setImage(boolean isImage) {
		this.isImage = isImage;
	} 

	
	
	
	
}
