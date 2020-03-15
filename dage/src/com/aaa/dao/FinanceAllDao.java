/**
 * 
 */
package com.aaa.dao;

import java.util.List;
import java.util.Map;

/***
 *@className:FinanceAllDao.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-20下午2:22:19
 *@version:
 */
@SuppressWarnings("all")
public interface FinanceAllDao {
	/**
	 * 统计收入和支出
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getFinanceAccount(Map map);
	/**
	 * 获取财务汇数据
	 */
	List<Map<String,Object>> getFinanceAll(int start,int rows,Map map);
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getFinanceAllCount(Map map);
}
