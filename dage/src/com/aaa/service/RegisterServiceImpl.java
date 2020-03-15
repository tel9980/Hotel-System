package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RegisterDao;
@Service
@SuppressWarnings("all")
public class RegisterServiceImpl implements RegisterService {
	@Autowired
	private RegisterDao registerDao;
	
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return registerDao.showAll();
	}
	public List<Map<String, Object>> showLimit(Map map) {
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		return registerDao.showLimit(pageNo, pageSize,map);
	}
	public int getCount(Map map) {
		
		List<Map<String, Object>> list = registerDao.getCount(map);
		int count = Integer.valueOf(list.get(0).get("cnt")+"");
		return count;
	}
	public int add(Map map) {
		// TODO Auto-generated method stub
		return registerDao.add(map);
	}
	public int addend(Map map) {
		// TODO Auto-generated method stub
		return registerDao.addend(map);
	}

}
