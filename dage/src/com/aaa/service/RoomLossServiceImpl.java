package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomLossDao;
@Service
@SuppressWarnings("all")
public class RoomLossServiceImpl implements RoomLossService {
	@Autowired
	private RoomLossDao roomLossDao;
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return roomLossDao.showAll();
	}

	public List<Map<String, Object>> showLimit(Map map) {
		
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return roomLossDao.showLimit(pageNo, pageSize,map);
	}

	public int getCount(Map map) {
		
		List<Map<String, Object>> list = roomLossDao.getcount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}

	public int add(Map map) {
		// TODO Auto-generated method stub
		return roomLossDao.add(map);
	}

	public int update(Map map) {
		// TODO Auto-generated method stub
		return roomLossDao.update(map);
	}

}
