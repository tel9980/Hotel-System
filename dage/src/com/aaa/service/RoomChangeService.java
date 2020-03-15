package com.aaa.service;

import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface RoomChangeService {
	/**
	 * 查询所有
	 * @return
	 */
	List<Map<String,Object>> showAll();
	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> showLimit(Map map);
	/**
	 * 获取数据库总条数
	 * @param map
	 * @return
	 */
	int getCount(Map map);
	/**
	 * 添加客户换房信息
	 * @param map
	 * @return
	 */
	int add(Map map);
}
