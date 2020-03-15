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
public interface UserDao {
	/**
	 * 获取用户列表
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
	 * 用户添加
	 * @param map
	 * @return
	 */
	int userAdd(Map map);
	/**
	 * 用户编辑
	 * @param map
	 * @return
	 */
	int userUpd(Map map);
	/**
	 * 用户删除
	 * @param map
	 * @return
	 */
	int userDel(Map map);
	/**
	 * 根据用户编号查询数据
	 * @param roomid
	 * @return
	 */
	List<Map<String, Object>> showOne(String userno);
}
