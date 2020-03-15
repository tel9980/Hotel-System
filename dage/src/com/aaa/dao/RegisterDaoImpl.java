package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;
@Repository
@SuppressWarnings("all")
public class RegisterDaoImpl implements RegisterDao {

	public List<Map<String, Object>> showAll() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select roomid,cusname,cussex,custel,idcardtype,idcard,roomtype," +
				"date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime,date_format(endtime,'%Y-%m-%d %h:%i:%S') as endtime,cash from register", null);
	}

	public List<Map<String, Object>> showLimit(int pageNo, int pageSize, Map map) {
		//排序参数
		String str = "";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order")+" ";
		}
		String sql = "select ordernum,roomid,cusname,cussex,custel,idcardtype,idcard,roomtype," +
				"date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime,date_format(endtime,'%Y-%m-%d %h:%i:%S') as endtime,roomprice,days,roompricesum from register "+pmap(map)+str+" limit ?,?";
		//System.out.println(sql);
		Object[] params={(pageNo-1)*pageSize,pageSize};
		return BaseDao.selectMap(sql, params);
	}

	public List<Map<String, Object>> getCount(Map map) {
		String sql = "select count(*) as cnt from register"+pmap(map);
		return BaseDao.selectMap(sql, null);
	}
	private String pmap(Map map){
		String str = " where 1=1 ";
		if(map.get("roomid")!=null&&!map.get("roomid").equals("")){
			str += " and roomid = "+map.get("roomid");
		}
		if(map.get("idcard")!=null&&!map.get("idcard").equals("")){
			str += " and idcard = "+map.get("idcard");
		}
		if(map.get("cusname")!=null&&!map.get("cusname").equals("")){
			str += " and cusname like '%"+map.get("cusname")+"%'";
		}
		return str;
	}

	public int add(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into register (roomid,cusname,cussex,custel,idcardtype,idcard,roomtype,begintime,roomprice,days,roompricesum) values (?,?,?,?,?,?,?,now(),?,?,?)",
				new Object[]{map.get("roomid"),map.get("cusname"),map.get("cussex"),map.get("custel"),map.get("idcardtype"),map.get("idcard"),map.get("roomtype"),map.get("roomprice"),map.get("days"),map.get("roompricesum")});
	}
	public int addend(Map map) {
		// TODO Auto-generated method stub
		try {
			Date begintime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse((String)map.get("begintime"));
			return BaseDao.insertAndUpdateAndDelete("insert into register (ordernum,roomid,cusname,cussex,custel,idcardtype,idcard,roomtype,begintime,roomprice,days,roompricesum,endtime) values (CONCAT('ROOM',DATE_FORMAT(now(),'%Y%m%d'),"+map.get("roomid")+"),?,?,?,?,?,?,?,?,?,?,?,now())",
					new Object[]{map.get("roomid"),map.get("cusname"),map.get("cussex"),map.get("custel"),map.get("idcardtype"),map.get("idcard"),map.get("roomtype"),begintime,map.get("roomprice"),map.get("indays"),map.get("roompricesum")});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;		
	}

}
