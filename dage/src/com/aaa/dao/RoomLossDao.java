package com.aaa.dao;

import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface RoomLossDao {
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
	 int add(Map map);
	 /**
	  * 获取总条数
	  * @param map
	  * @return
	  */
	 List<Map<String,Object>> getcount(Map map);
	 /**
	  * 补货确认
	  * @param map
	  * @return
	  */
	 int update(Map map);

}
