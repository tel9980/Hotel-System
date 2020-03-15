package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomDao;



@Service
@SuppressWarnings("all")
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDao roomDao;
	
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return roomDao.showAll();
	}
	
	public List<Map<String, Object>> showOne(int roomid) {
		// TODO Auto-generated method stub
		return roomDao.showOne(roomid);
	}
	
	public int del(int roomid) {
		// TODO Auto-generated method stub
		int i = roomDao.del(roomid);
		return i;
	}
	
	public int update(Map map) {
		// TODO Auto-generated method stub
		int i = roomDao.update(map);
		return i;
	}
	
	public List<Map<String, Object>> showLimit(Map map) {
		// TODO Auto-generated method stub
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return roomDao.showLimit(pageNo, pageSize,map);
	}
	
	public int add(Map map) {
		// TODO Auto-generated method stub
		return roomDao.add(map);
	}
	
	public int getcount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = roomDao.getcount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}
	/**
	 * 更改客房
	 */
	public int updateState(String state, int roomid) {
		// TODO Auto-generated method stub
		return roomDao.updateState(state, roomid);
	}

	public List<Map<String, Object>> getFreeRoom() {
		// TODO Auto-generated method stub
		return roomDao.getFreeRoom();
	}

	public int getCounts(String roomstate, String roomtype) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = roomDao.getCounts(roomstate, roomtype);
		int counts = Integer.valueOf(list.get(0).get("cnt")+"");
		return counts;
	}

	
}
