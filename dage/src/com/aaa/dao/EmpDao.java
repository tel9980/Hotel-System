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
public interface EmpDao {
	/**
	 * 获取员工列表
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
	 * 员工添加
	 * @param map
	 * @return
	 */
	int empAdd(Map map);
	/**
	 * 员工编辑
	 * @param map
	 * @return
	 */
	int empUpd(Map map);
	/**
	 * 员工删除
	 * @param map
	 * @return
	 */
	int empDel(Map map);
	List<Map<String,Object>> getEmpByEmptelAndPassword(Map map);
	/**
	 * 获取客房部员工信息
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getEmpByRoom();
	/**
	 * 获取仓管部员工信息
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getEmpByStore();
	/**
	 * 获取后勤部员工信息
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getEmpByServ();
	/**
	 * 根据员工编号查询员工信息
	 * @param empno
	 * @return
	 */
	List<Map<String, Object>> showOne(String empno);
}
