package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.BookingroomDao;
import com.aaa.dao.NowRegisterDao;



@Service
@SuppressWarnings("all")
public class NowRegisterServiceImpl implements NowRegisterService {
	@Autowired
	private NowRegisterDao nowRegisterDao;
	@Autowired
	private BookingroomDao bookingroomDao;
	
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return nowRegisterDao.showAll();
	}
	public List<Map<String, Object>> showLimit(Map map) {
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return nowRegisterDao.showLimit(pageNo, pageSize,map);
	}
	public int getCount(Map map) {
		
		List<Map<String, Object>> list = nowRegisterDao.getCount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}
	public int add(Map map) {
		// TODO Auto-generated method stub
		bookingroomDao.updateState(Integer.valueOf(map.get("roomid")+""));
		return nowRegisterDao.add(map);
	}
	public List<Map<String, Object>> getListByRoomId(int roomid) {
		// TODO Auto-generated method stub
		return nowRegisterDao.getListByRoomId(roomid);
	}
	public int del(int roomid) {
		// TODO Auto-generated method stub
		return nowRegisterDao.del(roomid);
	}
	public int update(Map map) {
		// TODO Auto-generated method stub
		return nowRegisterDao.update(map);
	}
	public int updatedays(int days, int roomid,int roompricesum) {
		// TODO Auto-generated method stub
		return nowRegisterDao.updatedays(days,roomid,roompricesum);
	}
}
