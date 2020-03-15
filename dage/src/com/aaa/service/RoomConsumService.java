/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

/***
 *@className:RoomConsumService.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-12下午10:29:20
 *@version:
 */
@SuppressWarnings("all")
public interface RoomConsumService {
	int addRoomConsum(Map map);
	int updateRoomConsum(Map<String,Object> map);
	int delRoomConsum(int id);
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
	/**
	 * 添加
	 * @param map
	 * @return
	 */
	int addConsum(Map map);
}
