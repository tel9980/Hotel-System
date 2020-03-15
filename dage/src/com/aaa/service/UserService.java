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
public interface UserService {

	/**
	 * 获取用户列表
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
