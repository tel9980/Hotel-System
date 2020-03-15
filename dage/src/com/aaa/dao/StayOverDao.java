/**
 * 
 */
package com.aaa.dao;

import java.util.List;
import java.util.Map;

/***
 *@className:StayOverDao.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-16下午6:52:29
 *@version:
 */
@SuppressWarnings("all")
public interface StayOverDao {

	int addStayOver(Map map);
	int delStayOver(int id);
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows	每页显示数量
	 * @param map	其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(int start,int rows,Map map);
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPageCount(Map map);
}
