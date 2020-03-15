/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

/***
 *@className:FinanceAllService.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-20下午2:41:49
 *@version:
 */
@SuppressWarnings("all")
public interface FinanceAllService {
	/**
	 * 统计收入和支出
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getEChartsData(Map map);
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

}
