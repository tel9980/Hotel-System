package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomChangeDao;

@Service
@SuppressWarnings("all")
public class RoomChangeServiceImpl implements RoomChangeService {
	@Autowired 
	private RoomChangeDao roomChangeDao;
	
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return roomChangeDao.showAll();
	}
	public List<Map<String, Object>> showLimit(Map map) {
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return roomChangeDao.showLimit(pageNo, pageSize,map);
	}
	public int getCount(Map map) {
		
		List<Map<String, Object>> list = roomChangeDao.getCount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}
	public int add(Map map) {
		// TODO Auto-generated method stub
		return roomChangeDao.add(map);
	}
}
