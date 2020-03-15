package com.aaa.service;

import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface RoomTypeService {
	/**
	 * 增
	 * @param map
	 * @return
	 */
	int add(Map map);
	/**
	 * 删
	 * @param roomtype
	 * @return
	 */
	int del(int id);
	/**
	 * 改
	 * @param map
	 * @return
	 */
	int update(Map map);
	/**
	 * 查
	 * @return
	 */
	List<Map<String,Object>> show();
	/**
	 * 根据id获取对应房价
	 * @return
	 */
	List<Map<String,Object>> showOne(String roomtype);
	 /**
	  * 分页查询
	  * @param roomid
	  * @return
	  */
	 List<Map<String,Object>> showLimit(Map map);
	 /**
	  * 获取总条数
	  * @param map
	  * @return
	  */
	 int getcount(Map map);
}
