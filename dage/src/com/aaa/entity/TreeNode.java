package com.aaa.entity;

import java.util.List;

/***
 *@className:TreeNode.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:11:54
 *@version:
 */
public class TreeNode {

	 private int id;
	 private String text;
	 private int parentId;
	 private String state;
	 private String iconCls;
	 private String url;
	 private String checked;
	 /**
	  * 带参构造
	  * @param id
	  * @param text
	  * @param parentId
	  * @param state
	  * @param iconCls
	  * @param url
	  */
	 public TreeNode(int id, String text, int parentId, String state,
			String iconCls, String url) {
		super();
		this.id = id;
		this.text = text;
		this.parentId = parentId;
		this.state = state;
		this.iconCls = iconCls;
		this.url = url;
	}
	 
	 
	public TreeNode(int id, String text, int parentId, String state,
			String iconCls, String url, String checked) {
		super();
		this.id = id;
		this.text = text;
		this.parentId = parentId;
		this.state = state;
		this.iconCls = iconCls;
		this.url = url;
		this.checked = checked;
	}


	public String getChecked() {
		return checked;
	}


	public void setChecked(String checked) {
		this.checked = checked;
	}


	public TreeNode() {
		super();
		// TODO Auto-generated constructor stub
	}


	private List<TreeNode> children;
	 
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	 
	 
	 
}
