package com.aaa.dao;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;
import com.mysql.fabric.xmlrpc.base.Data;
@Repository
@SuppressWarnings("all")
public class RoomLossDaoImpl implements RoomLossDao{
	public List<Map<String, Object>> showAll() {
		String sql = "select roomid,goodsid,goodsname,losstime,lossnum,addtime,addempid from roomloss";
		return BaseDao.selectMap(sql, null);
	}

	public List<Map<String, Object>> showOne(int roomid) {
		String sql = "select roomid,goodsid,goodsname,losstime,lossnum,addtime,addempid from roomloss where roomid=?";
		return BaseDao.selectMap(sql, new Object[]{roomid});
	}

	
	public List<Map<String, Object>> showLimit(int pageNo,int pageSize,Map map) {
			//排序参数
			String str = "";
			if(map.get("sort")!=null){
				str=" order by "+map.get("sort")+" "+map.get("order")+" ";
			}
			String sql = "select roomid,goodsid,goodsname,date_format(losstime,'%Y-%m-%d %h:%i:%S') as losstime,lossnum,date_format(addtime,'%Y-%m-%d %h:%i:%S') as addtime,addempid from roomloss "+pmap(map)+str+" limit ?,?";
			//System.out.println(sql);
			Object[] params={(pageNo-1)*pageSize,pageSize};
			return BaseDao.selectMap(sql, params);
	}

	
	public int add(Map map) {
		// TODO Auto-generated method stub

		String sql = "insert into roomloss (roomid,goodsid,goodsname,losstime,lossnum) values (?,?,?,now(),?)";
		Object[] params={map.get("roomid"),map.get("goodsid"),map.get("goods"),map.get("num")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	public List<Map<String, Object>> getcount(Map map) {
		// TODO Auto-generated method stub
		
		String sql = "select count(*) as cnt from roomloss"+pmap(map);
		return BaseDao.selectMap(sql, null);
	}
	//查询参数
	private String pmap(Map map){
		String str = " where 1=1 ";
		if(map.get("roomid")!=null&&!map.get("roomid").equals("")){
			str += " and roomid = "+map.get("roomid");
		}
		if(map.get("goodsid")!=null&&!map.get("goodsid").equals("")){
			str += " and goodsid like '%"+map.get("goodsid")+"%'";
		}
		return str;
	}

	public int update(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update roomloss set addtime=now(),addempid=? where roomid=?", new Object[]{map.get("addempid"),map.get("roomid")});
	}
}
