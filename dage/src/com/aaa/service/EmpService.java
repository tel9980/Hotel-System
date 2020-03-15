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
public interface EmpService {

	/**
	 * 获取员工列表
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
