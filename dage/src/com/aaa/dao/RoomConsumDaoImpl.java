/**
 * 
 */
package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:RoomConsumDaoImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-12下午10:25:26
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class RoomConsumDaoImpl implements RoomConsumDao {


	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomConsumDao#addRoomConsum(java.util.Map)
	 */
	
	public int addRoomConsum(Map map) {
		// TODO Auto-generated method stub
		try {
			Date optime = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)map.get("optime"));
			return BaseDao.insertAndUpdateAndDelete("insert into RoomConsum(goods,price,num,optime,opemp) values(?,?,?,?,?) ", new Object[]{map.get("goods"),map.get("price"),map.get("num"),map.get("optime")==null?null:optime,map.get("opemp")});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomConsumDao#updateRoomConsum(java.util.Map)
	 */
	public int updateRoomConsum(Map<String, Object> map) {
		// TODO Auto-generated method stub
		try {
			Date optime = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)map.get("optime"));
			return BaseDao.insertAndUpdateAndDelete(" update RoomConsum set goods=?,price=?,num=?,optime=?,opemp=? where id=?", new Object[]{map.get("goods"),map.get("price"),map.get("num"),map.get("optime")==null?null:optime,map.get("opemp"),map.get("id")});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomConsumDao#delRoomConsum(int)
	 */
	public int delRoomConsum(int id) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from RoomConsum where id=?", new Object[]{id});
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomConsumDao#getPage(int, int, java.util.Map)
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select id,ordernum,roomid,goodsid,goods,price,num,date_format(optime,'%Y-%m-%d %h:%i:%S') as optime"+
",opemp from RoomConsum "+setParams(map)+str+" limit "+start+","+rows,null);
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomConsumDao#getPageCount(java.util.Map)
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select count(*) as cnt from RoomConsum "+setParams(map), null);
	}
	private String setParam(Map map,int type){
		String str=" where 1=1 ";
		Set keyset=map.keySet();
		if(!keyset.isEmpty()){
			for (Object key : keyset) {
				if(map.get(key)!=null&&!"".equals(map.get(key))&&type==1)
				  str += " and "+key+"="+map.get(key); 
				if(map.get(key)!=null&&!"".equals(map.get(key))&&type==2)
					str += " and "+key+" like '%"+map.get(key)+"%'"; 
			}
		}
		return str;
	}
	private String setParams(Map map){
		String str1=" where 1=1 ";
		Object id = map.get("id");
		if( id!=null&&!"".equals( id)){
			str1+=" and id="+ id;
		}
		Object num = map.get("num");
		if(num!=null&&!"".equals(num)){
			str1+=" and num like '%"+num+"%'";
		}
		return str1;
	}
	public int addConsum(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into RoomConsum(goods,roomid,price,num,optime,opemp,goodsid,ordernum) values(?,?,?,?,now(),?,?,CONCAT('ROOM',DATE_FORMAT(now(),'%Y%m%d'),"+map.get("roomid")+")) ", new Object[]{map.get("goods"),map.get("roomid"),map.get("price"),map.get("num"),map.get("opemp"),map.get("goodsid")});
	}
}