package com.aaa.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomAllDao;
@Service
@SuppressWarnings("all")
public class RoomAllServiceImpl implements RoomAllService {
	
	@Autowired
	private RoomAllDao roomAllDao;
	public int add(Map map) {
		// TODO Auto-generated method stub
		return roomAllDao.add(map);
	}

}
