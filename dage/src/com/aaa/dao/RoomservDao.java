package com.aaa.dao;

import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
public interface RoomservDao {
	/**
	 * 获取房间维修记录列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows 每页显示数量
	 * @param map 其他参数
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
	 * 房间维修记录添加
	 * @param map
	 * @return
	 */
	int roomservAdd(Map map);
	/**
	 * 通过roomid更改房间状态
	 * @param state
	 * @param roomid
	 * @return
	 */
	 int updateState(String state,int roomid);
	 /**
	 * 维修编辑
	 * @param map
	 * @return
	 */
	int servUpd(Map map);
}
