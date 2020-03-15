package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;
@Repository
@SuppressWarnings("all")
public class RoomTypeDaoImpl implements RoomTypeDao {
	
	public int add(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into roomtype (roomtype,roomprice,cash,state) values(?,?,?,?)", new Object[]{map.get("roomtype"),map.get("roomprice"),map.get("cash"),map.get("state")});
	}

	public int del(int id) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from roomtype where id=?", new Object[]{id});
	}

	public int update(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update roomtype set roomtype=?,roomprice=?,cash=?,state=? where id=?", new Object[]{map.get("roomtype"),map.get("roomprice"),map.get("cash"),map.get("state"),map.get("id")});
	}

	public List<Map<String, Object>> show() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select id,roomtype,roomprice,cash,state from roomtype where state='使用中'", null);
	}

	public List<Map<String, Object>> showOne(String roomtype) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select id,roomtype,roomprice,cash,state from roomtype where roomtype=? and state='使用中'", new Object[]{roomtype});
	}


	public List<Map<String, Object>> showLimit(int pageNo,int pageSize,Map map) {
			//排序参数
			String str = "";
			if(map.get("sort")!=null){
				str=" order by "+map.get("sort")+" "+map.get("order")+" ";
			}
			String sql = "select id,roomtype,roomprice,cash,state from roomtype "+pmap(map)+str+" limit ?,?";
			//System.out.println(sql);
			Object[] params={(pageNo-1)*pageSize,pageSize};
			return BaseDao.selectMap(sql, params);
	}
	public List<Map<String, Object>> getcount(Map map) {
		// TODO Auto-generated method stub
		
		String sql = "select count(*) as cnt from roomtype"+pmap(map);
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

}
