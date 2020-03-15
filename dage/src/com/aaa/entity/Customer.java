package com.aaa.entity;

public class Customer {
	private String cusname;
	private String idcardtype;
	private String cussex;
	private String custel;
	public String getCussex() {
		return cussex;
	}
	public void setCussex(String cussex) {
		this.cussex = cussex;
	}
	public String getCustel() {
		return custel;
	}
	public void setCustel(String custel) {
		this.custel = custel;
	}
	private String idcard;
	public String getCusname() {
		return cusname;
	}
	public void setCusname(String cusname) {
		this.cusname = cusname;
	}
	public String getIdcardtype() {
		return idcardtype;
	}
	public void setIdcardtype(String idcardtype) {
		this.idcardtype = idcardtype;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
}
