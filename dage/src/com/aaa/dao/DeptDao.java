/**
 * 
 */
package com.aaa.dao;

import java.util.List;
import java.util.Map;


/***
 *@className:DeptDao.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-9-17下午2:11:43
 *@version:
 */
@SuppressWarnings("all")
public interface DeptDao {
	/**
	 * 获取部门列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows 每页显示数量
	 * @param map 其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(int start,int rows,Map map);
	
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getPageCount(Map map);
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
