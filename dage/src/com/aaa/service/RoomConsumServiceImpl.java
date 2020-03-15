/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomConsumDao;



/***
 *@className:RoomConsumServiceImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-12下午10:30:16
 *@version:
 */
@Service
@SuppressWarnings("all")
public class RoomConsumServiceImpl implements RoomConsumService {

	@Autowired
	private RoomConsumDao roomConsumDao;
	/* (non-Javadoc)
	 * @see com.aaa.service.RoomConsumService#addRoomConsum(java.util.Map)
	 */
	public int addRoomConsum(Map map) {
		// TODO Auto-generated method stub
		return roomConsumDao.addRoomConsum(map);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.RoomConsumService#updateRoomConsum(java.util.Map)
	 */
	public int updateRoomConsum(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return roomConsumDao.updateRoomConsum(map);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.RoomConsumService#delRoomConsum(int)
	 */
	public int delRoomConsum(int id) {
		// TODO Auto-generated method stub
		return roomConsumDao.delRoomConsum(id);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.RoomConsumService#getPage(int, int, java.util.Map)
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?20:Integer.valueOf(map.get("rows")+"");
		int start=(pageNo-1)*pageSize;
		return roomConsumDao.getPage(start, pageSize, map);
	}
	/* (non-Javadoc)
	 * @see com.aaa.service.RoomConsumService#getPageCount(java.util.Map)
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		 List<Map<String,Object>> pageCount=roomConsumDao.getPageCount(map);
		 if(pageCount!=null&&pageCount.size()>0){
			 return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		 }
		return 0 ;
	}

	public int addConsum(Map map) {
		// TODO Auto-generated method stub
		return roomConsumDao.addConsum(map);
	}


}
