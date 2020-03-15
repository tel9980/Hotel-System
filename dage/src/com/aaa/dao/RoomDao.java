package com.aaa.dao;

import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public interface RoomDao {
	/**
	 * 查询所有
	 * @return
	 */	 
	 List<Map<String,Object>> showAll();
	 /**
	  * 分页查询
	  * @param roomid
	  * @return
	  */
	 List<Map<String,Object>> showLimit(int pageNo,int pageSize,Map map);
	 /**
	  * 通过room查询
	  * @param roomid
	  * @return
	  */
	 List<Map<String,Object>> showOne(int roomid);
	 /**
	  * 通过room删除
	  * @param roomid
	  * @return
	  */
	 int del(int roomid);
	 /**
	  * 更新
	  * @param map
	  * @return
	  */ 
	 int update(Map map);
	 /**
	  * 添加
	  * @param map
	  * @return
	  */
	 int add(Map map);
	 /**
	  * 获取总条数
	  * @param map
	  * @return
	  */
	 List<Map<String,Object>> getcount(Map map);
	/**
	 * 通过roomid更改房间状态
	 * @param state
	 * @param roomid
	 * @return
	 */
	 int updateState(String state,int roomid);
	 /**
	  * 
	  * 获取当前空闲状态的房间
	  * @return
	  */
	 List<Map<String,Object>> getFreeRoom();
	 /**
	  * 
	  * 获取不同状态的不同房型的数量
	  * @return
	  */
	 List<Map<String,Object>> getCounts(String roomstate,String roomtype);
}
