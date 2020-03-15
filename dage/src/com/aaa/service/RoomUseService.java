/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;



/***
 *@className:UserService.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-9-27上午10:46:21
 *@version:
 */
@SuppressWarnings("all")
public interface RoomUseService {
	/**
	 * 添加
	 * @param map
	 * @return
	 */
	int addUser(Map<String,Object> map);
	/**
	 * 更新
	 * @param map
	 * @return
	 */
	int updateUser(Map<String,Object> map);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	int delUser(int id);
	/**
	 * 获取分页数据方法
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);
	/**
	 * 获取分页数据总数量
	 * @param map
	 * @return
	 */
	int getPageCount(Map map);
	/**
	 * 获取每天收入数据
	 */
	List<Map<String,Object>> getDayFinance(Map map);
}
