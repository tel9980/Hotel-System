package com.aaa.dao;

import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface RoomChangeDao {
	/**
	 * 查询所有
	 * @return
	 */
	List<Map<String,Object>> showAll();
	/**
	 * 分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> showLimit(int pageNo,int pageSize,Map map);
	/**
	 * 获取数据库总条数
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getCount(Map map);
	/**
	 * 添加客户换房信息
	 * @param map
	 * @return
	 */
	int add(Map map);
}
