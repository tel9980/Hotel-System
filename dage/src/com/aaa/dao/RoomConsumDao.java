/**
 * 
 */
package com.aaa.dao;

import java.util.List;
import java.util.Map;

/***
 *@className:RoomConsumDao.java
 *@Discriptron:房间消费记录Dao
 *@author:chenMin
 *@createTime:2018-10-12下午10:23:50
 *@version:
 */
@SuppressWarnings("all")
public interface RoomConsumDao {
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
	List<Map<String,Object>> getPage(int start,int rows,Map map);
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPageCount(Map map);
	/**
	 * 添加
	 * @param map
	 * @return
	 */
	int addConsum(Map map);
}
