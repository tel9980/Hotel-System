package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;
@Repository
@SuppressWarnings("all")
public class NowRegisterDaoImpl implements NowRegisterDao{
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select roomid,cusname,cussex,custel,idcardtype,idcard,roomtype," +
				"date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime,date_format(endtime,'%Y-%m-%d %h:%i:%S') as endtime,cash from nowregister", null);
	}

	public List<Map<String, Object>> showLimit(int pageNo, int pageSize, Map map) {
		//排序参数
		String str = "";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order")+" ";
		}
		String sql = "select roomid,cusname,cussex,custel,idcardtype,idcard,roomtype," +
				"date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime,cash,roomprice,days,roompricesum from nowregister "+pmap(map)+str+" limit ?,?";
		//System.out.println(sql);
		Object[] params={(pageNo-1)*pageSize,pageSize};
		return BaseDao.selectMap(sql, params);
	}

	public List<Map<String, Object>> getCount(Map map) {
		String sql = "select count(*) as cnt from nowregister"+pmap(map);
		return BaseDao.selectMap(sql, null);
	}
	private String pmap(Map map){
		String str = " where 1=1 ";
		if(map.get("roomid")!=null&&!map.get("roomid").equals("")){
			str += " and roomid = "+map.get("roomid");
		}
		if(map.get("cusname")!=null&&!map.get("cusname").equals("")){
			str += " and cusname like '%"+map.get("cusname")+"%'";
		}
		if(map.get("idcard")!=null&&!map.get("idcard").equals("")){
			str += " and idcard like '%"+map.get("idcard")+"%'";
		}
		return str;
	}

	public int add(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into nowregister (roomid,cusname,cussex,custel,idcardtype,idcard,roomtype,begintime,cash,roomprice,days,roompricesum) values (?,?,?,?,?,?,?,now(),?,?,?,?)",
				new Object[]{map.get("roomid"),map.get("cusname"),map.get("cussex"),map.get("custel"),map.get("idcardtype"),map.get("idcard"),map.get("roomtype"),map.get("cash"),map.get("roomprice"),map.get("days"),map.get("roompricesum")});
	}

	public List<Map<String, Object>> getListByRoomId(int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select roomid,cusname,cussex,custel,idcardtype,idcard,roomtype," +
	"date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime,cash,roomprice,days,roompricesum,to_days(begintime) as day1,to_days(now()) as day2 from nowregister where roomid=?", new Object[]{roomid});
	}

	public int del(int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from nowregister where roomid=?", new Object[]{roomid});
	}

	public int update(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update nowregister set roomid=?,roomtype=?,roomprice=?,roompricesum=? where idcard=? ", new Object[]{map.get("changeroomid"),map.get("changeroomtype"),map.get("changeroomprice"),map.get("roompricesum"),map.get("idcard")});
	}

	public int updatedays(int days, int roomid,int roompricesum) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update nowregister set days=?,roompricesum=? where roomid=?",new Object[]{days,roompricesum,roomid});
	}

}
