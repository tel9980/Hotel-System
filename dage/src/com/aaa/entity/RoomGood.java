package com.aaa.entity;

import java.util.Date;

public class RoomGood {

	private int goodsid;
	private String goods;
	private int price;
	private int num;
	private Date optime;
	private String opemp;
	public int getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getOptime() {
		return optime;
	}
	public void setOptime(Date optime) {
		this.optime = optime;
	}
	public String getOpemp() {
		return opemp;
	}
	public void setOpemp(String opemp) {
		this.opemp = opemp;
	}
	
}
