package com.aaa.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;
@Repository
@SuppressWarnings("all")
public class RoomAllDaoImpl implements RoomAllDao {

	public int add(Map map) {
		//CONCAT('ROOM',DATE_FORMAT(now(),'%Y%m%d'),"+map.get("roomid")+")
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into tb_room (orderid,roomid,pricesum,usesum,time) values (CONCAT('ROOM',DATE_FORMAT(now(),'%Y%m%d'),"+map.get("roomid")+"),?,?,?,now())",
				new Object[]{map.get("roomid"),map.get("pricesum"),map.get("usesum")});
	}

}
