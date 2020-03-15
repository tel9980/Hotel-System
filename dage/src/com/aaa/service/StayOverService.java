/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

/***
 *@className:StayOverService.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-16下午6:55:48
 *@version:
 */
@SuppressWarnings("all")
public interface StayOverService {
	int addStayOver(Map map);
	int delStayOver(int id);
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows	每页显示数量
	 * @param map	其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	int getPageCount(Map map);
}
