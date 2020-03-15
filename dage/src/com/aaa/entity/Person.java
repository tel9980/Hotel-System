/**
 * 
 */
package com.aaa.entity;

import java.util.Date;

/***
 *@className:Person.java
 *@discripton:
 *@author:CZP
 *@createTime:2018-9-12下午3:12:07
 *@version:
 */
@SuppressWarnings("all")
public class Person {
	
	private Integer userid;
	private String account;
	private String password;
	private String cusName;
	private String cusidcard;
	private String roomtype;
	private String beginTime;
	private Integer days;
	private String idcardtype;
	private String cusex;
	private Integer cusnumber;
	private Integer roompricesum;
	private String remarks;

	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getRoompricesum() {
		return roompricesum;
	}
	public void setRoompricesum(Integer roompricesum) {
		this.roompricesum = roompricesum;
	}
	public Integer getCusnumber() {
		return cusnumber;
	}
	public void setCusnumber(Integer cusnumber) {
		this.cusnumber = cusnumber;
	}
	public String getIdcardtype() {
		return idcardtype;
	}
	public void setIdcardtype(String idcardtype) {
		this.idcardtype = idcardtype;
	}
	public String getCusex() {
		return cusex;
	}
	public void setCusex(String cusex) {
		this.cusex = cusex;
	}

	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getCusidcard() {
		return cusidcard;
	}
	public void setCusidcard(String cusidcard) {
		this.cusidcard = cusidcard;
	}
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	


	
}
