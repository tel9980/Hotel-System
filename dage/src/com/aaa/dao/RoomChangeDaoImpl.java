package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

@Repository
@SuppressWarnings("all")
public class RoomChangeDaoImpl implements RoomChangeDao {
	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select oldroomid,changeroomid,cusname,cussex,custel,idcardtype,idcard,oldroomtype,oldroomprice," +
				"date_format(changetime,'%Y-%m-%d %h:%i:%S') as changetime,days,roompricesum,changeroomtype,changeroomprice,cash from roomchange", null);
	}

	public List<Map<String, Object>> showLimit(int pageNo, int pageSize, Map map) {
		//排序参数
		String str = "";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order")+" ";
		}
		String sql = "select oldroomid,changeroomid,cusname,cussex,custel,idcardtype,idcard,oldroomtype,oldroomprice," +
				"date_format(changetime,'%Y-%m-%d %h:%i:%S') as changetime,days,roompricesum,changeroomtype,changeroomprice,cash from roomchange"+pmap(map)+str+" limit ?,?";
		//System.out.println(sql);
		Object[] params={(pageNo-1)*pageSize,pageSize};
		return BaseDao.selectMap(sql, params);
	}

	public List<Map<String, Object>> getCount(Map map) {
		String sql = "select count(*) as cnt from roomchange"+pmap(map);
		return BaseDao.selectMap(sql, null);
	}
	private String pmap(Map map){
		String str = " where 1=1 ";
		if(map.get("oldroomid")!=null&&!map.get("oldroomid").equals("")){
			str += " and oldroomid = "+map.get("oldroomid");
		}
		if(map.get("idcard")!=null&&!map.get("idcard").equals("")){
			str += " and idcard = "+map.get("idcard");
		}
		if(map.get("cusname")!=null&&!map.get("cusname").equals("")){
			str += " and cusname like '%"+map.get("cusname")+"%'";
		}
		if(map.get("changeroomid")!=null&&!map.get("changeroomid").equals("")){
			str += " and changeroomid = "+map.get("changeroomid");
		}
		return str;
	}

	public int add(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into roomchange (oldroomid,changeroomid,cusname,cussex,custel,idcardtype,idcard,oldroomtype,oldroomprice,days,roompricesum,changeroomtype,changeroomprice,cash,changetime) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())",
				new Object[]{map.get("roomid"),map.get("changeroomid"),map.get("cusname"),map.get("cussex"),map.get("custel"),map.get("idcardtype"),map.get("idcard"),map.get("roomtype"),map.get("roomprice"),map.get("days"),map.get("roompricesum"),map.get("changeroomtype"),map.get("changeroomprice"),map.get("cash")});
	}
}
