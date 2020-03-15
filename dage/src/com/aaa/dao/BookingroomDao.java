package com.aaa.dao;

import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public interface BookingroomDao {
	/**
	 * 获取线上订单列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	
	/**
	 * 获取分页数据
	 * @param start
	 * @param rows
	 * @param map
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
	 * 线上订单状态编辑
	 * @param map
	 * @return
	 */
	int bookingroomUpd(Map map);
	
	/**
	 * 根据房间状态和房间类型选择房号
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> checkRoomId(Map map);
	/**
	 * 根据预roomid去获取预订表内信息
	 * @param roomid
	 * @return
	 */
	List<Map<String, Object>> showOne(int roomid);
	/**
	 * 根据预orderid去获取预订表内预分配房间号
	 * @param roomid
	 * @return
	 */
	List<Map<String, Object>> showOredr(String orderid);
	/**
	 * 入住成功改变订单状态
	 * @param roomid
	 * @return
	 */
	int updateState(int roomid);
}
