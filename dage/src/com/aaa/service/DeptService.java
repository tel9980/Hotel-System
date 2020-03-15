/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;


/***
 *@className:DeptService.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-9-17下午3:13:23
 *@version:
 */
@SuppressWarnings("all")
public interface DeptService {

	/**
	 * 获取部门列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	
	/**
	 * 获取分页数据
	 * @param map 其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);
	
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	int getPageCount(Map map);
	/**
	 * 部门添加
	 * @param map
	 * @return
	 */
	int deptAdd(Map map);
	/**
	 * 部门编辑
	 * @param map
	 * @return
	 */
	int deptUpd(Map map);
	/**
	 * 部门删除
	 * @param map
	 * @return
	 */
	int deptDel(Map map);

	/**
	 * 根据部门编号查询部门信息
	 * @param deptno
	 * @return
	 *//*
	List<Map<String, Object>> showOne(String deptno);*/

}
