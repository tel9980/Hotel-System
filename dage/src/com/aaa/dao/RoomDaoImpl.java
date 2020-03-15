package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;



@Repository
@SuppressWarnings("all")
public class RoomDaoImpl implements RoomDao {

	public List<Map<String, Object>> showAll() {
		String sql = "select distinct r.roomid,r.roomtype,r.roomstate,g.begintime,g.days,to_days(g.begintime) as day1,to_days(now()) as day2 from room r left join nowregister g on r.roomid=g.roomid order by roomid ";
		return BaseDao.selectMap(sql, null);
	}

	public List<Map<String, Object>> showOne(int roomid) {
		String sql = "select * from room where roomid=?";
		return BaseDao.selectMap(sql, new Object[]{roomid});
	}


	public int del(int roomid) {
		// TODO Auto-generated method stub
		String sql = "delete from room where roomid=?";
		int i = BaseDao.insertAndUpdateAndDelete(sql,  new Object[]{roomid});
		return i;
				
	}

	
	public int update(Map map) {
		// TODO Auto-generated method stub
		String sql = "update room set roomtype=?,roomstate=?,roomprice=?,roomcash=?,roommanage=?,managephone=?,roompicpath=?,roompicname=?,other=? where roomid=?" ;
		Object[] params={map.get("roomtype"),map.get("roomstate"),map.get("roomprice"),map.get("roomcash"),map.get("roommanage"),map.get("managephone"),map.get("roompicpath"),map.get("roompicname"),map.get("other"),map.get("roomid")};
		int i = BaseDao.insertAndUpdateAndDelete(sql, params);
		return i;
	}

	
	public List<Map<String, Object>> showLimit(int pageNo,int pageSize,Map map) {
			//排序参数
			String str = "";
			if(map.get("sort")!=null){
				str=" order by "+map.get("sort")+" "+map.get("order")+" ";
			}
			String sql = "select roomid,roomtype,roomstate,roomprice,roomcash,roommanage,managephone,roompicpath,roompicname,other from room "+pmap(map)+str+" limit ?,?";
			//System.out.println(sql);
			Object[] params={(pageNo-1)*pageSize,pageSize};
			return BaseDao.selectMap(sql, params);
	}

	
	public int add(Map map) {
		// TODO Auto-generated method stub
		String sql = "insert into room (roomid,roomtype,roomstate,roomprice,roomcash,roommanage,managephone,roompicpath,roompicname,other) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={map.get("roomid"),map.get("roomtype"),map.get("roomstate"),map.get("roomprice"),map.get("roomcash"),map.get("roommanage"),map.get("managephone"),map.get("roompicpath"),map.get("roompicname"),map.get("other")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	public List<Map<String, Object>> getcount(Map map) {
		// TODO Auto-generated method stub
		
		String sql = "select count(*) as cnt from room"+pmap(map);
		return BaseDao.selectMap(sql, null);
	}
	//查询参数
	private String pmap(Map map){
		String str = " where 1=1 ";
		if(map.get("roomid")!=null&&!map.get("roomid").equals("")){
			str += " and roomid = "+map.get("roomid");
		}
		if(map.get("roommanage")!=null&&!map.get("roommanage").equals("")){
			str += " and roommanage like '%"+map.get("roommanage")+"%'";
		}
		return str;
	}
	/**
	 * 更改房间的
	 */
	public int updateState(String state, int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update room set roomstate=? where roomid=?", new Object[]{state,roomid});
	}
	/**
	 * 获取空闲房间的信息
	 */
	public List<Map<String, Object>> getFreeRoom() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select * from room where roomstate='空闲'", null);
	}

	public List<Map<String, Object>> getCounts(String roomstate, String roomtype) {
		// TODO Auto-generated method stub
		String str = " where 1=1 ";
		if(roomstate!=null&&!"".equals(roomstate)){
			str += " and roomstate = '"+roomstate+"'";
		}
		if(roomtype!=null&&!"".equals(roomtype)){
			str += " and roomtype = '"+roomtype+"'";
		}	
		return BaseDao.selectMap("select count(*) as cnt from room " +str, null);
	}
	
}


