package com.aaa.service;

import java.util.List;
import java.util.Map;


@SuppressWarnings("all")
public interface RoomservService {
	/**
	 * 获取房间维护记录列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	
	/**
	 * 获取分页数据
	 * @param map 其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);
	
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	int getPageCount(Map map);
	/**
	 * 房间维护记录添加
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
