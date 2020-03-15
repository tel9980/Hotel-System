package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomTypeDao;
@Service
@SuppressWarnings("all")
public class RoomTypeServiceImpl implements RoomTypeService {
	@Autowired
	private RoomTypeDao roomTypeDao;
	public int add(Map map) {
		// TODO Auto-generated method stub
		return roomTypeDao.add(map);
	}

	public int del(int id) {
		// TODO Auto-generated method stub
		return roomTypeDao.del(id);
	}

	public int update(Map map) {
		// TODO Auto-generated method stub
		return roomTypeDao.update(map);
	}

	public List<Map<String, Object>> show() {
		// TODO Auto-generated method stub
		return roomTypeDao.show();
	}

	public List<Map<String, Object>> showOne(String roomtype) {
		// TODO Auto-generated method stub
		return roomTypeDao.showOne(roomtype);
	}
	
	public List<Map<String, Object>> showLimit(Map map) {
		// TODO Auto-generated method stub
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return roomTypeDao.showLimit(pageNo, pageSize,map);
	}
	
	public int getcount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = roomTypeDao.getcount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}

}
