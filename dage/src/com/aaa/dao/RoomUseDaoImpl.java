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
 *@className:UserDaoImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-9-27上午10:43:15
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class RoomUseDaoImpl implements RoomUseDao {

	/* (non-Javadoc)
	 * @see com.aaa.mvc.dao.UserDao#addUser(java.util.Map)
	 */
		/**
		 * 添加
		 */
	public int addUser(Map<String,Object> map) {
		// TODO Auto-generated method stub
		 try {
			Date time = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)map.get("time"));
			return BaseDao.insertAndUpdateAndDelete("insert into tb_room(orderid,roomid,pricesum,usesum,time) values(?,?,?,?,?)", new Object[]{map.get("orderid"),map.get("roomid"),map.get("pricesum"),map.get("usesum"),map.get("time")==null?null:time});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	

	/* (non-Javadoc)
	 * @see com.aaa.mvc.dao.UserDao#updateUser(java.util.Map)
	 */
	/**
	 * 更新
	 */
	public int updateUser(Map<String,Object> map) {
		// TODO Auto-generated method stub
		try {
			Date time = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)map.get("time"));
			return BaseDao.insertAndUpdateAndDelete("update tb_room set orderid=?,roomid=?,pricesum=?,usesum=?,time=? where id=?", new Object[]{map.get("roderid"),map.get("roomid"),map.get("pricesum"),map.get("usesum"),map.get("time")==null?null:time,map.get("id")});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	/* (non-Javadoc)
	 * @see com.aaa.mvc.dao.UserDao#delUser(java.util.Map)
	 */
	/**
	 * 删除
	 */
	public int delUser(int id ) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from tb_room where id=?", new Object[]{id});
	}

	

	

	/* (non-Javadoc)
	 * @see com.aaa.mvc.dao.UserDao#getPage(int, int, java.util.Map)
	 */
	/**
	 * 获取房间总消费 分页数据
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		String str1=" where 1=1 ";
		Object id = map.get("orderid");
		if(id!=null&&!"".equals(id)){
			str1+=" and orderid like '%"+id+"%'";
		} 
		Object roomid = map.get("roomid");
		if(roomid!=null&&!"".equals(roomid)){
			str1+=" and roomid like '%"+roomid+"%'";
		}
		
			
		/*Date time=null;
		try {
			time = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss ").parse((String)map.get("endtime"));
			if(time!=null&&!"".equals(time)){
				str1+=" and endtime like '%"+time+"%'";
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return BaseDao.selectMap("select id,orderid,roomid,pricesum,usesum,date_format(time,'%Y-%m-%d %h:%i:%S') as time from tb_room "+str1+str+" limit "+start+","+rows,null);
	}

	
	/* (non-Javadoc)
	 * @see com.aaa.mvc.dao.UserDao#getPageCount(java.util.Map)
	 */
	/**
	 * 获取分页数据总条数
	 */
	public List<Map<String,Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		String str1=" where 1=1 ";
		Object id = map.get("orderid");
		if(id!=null&&!"".equals(id)){
			str1+=" and orderid like '%"+id+"%'";
		}
		Object roomid = map.get("roomid");
		if(roomid!=null&&!"".equals(roomid)){
			str1+=" and roomid like '%"+roomid+"%'";
		}
		
		/*Date time=null;
		try {
			time = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)map.get("endtime"));
			if(time!=null&&!"".equals(time)){
				str1+=" and endtime like '%"+time+"%'";
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		return BaseDao.selectMap("select count(*) as cnt from tb_room "+str1, null);
	}
	/**
	 * 封装方法
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		String str1=" where 1=1 ";
		Object orderid = map.get("orderid");
		if(orderid!=null&&!"".equals(orderid)){
			str1+=" and orderid="+orderid;
		}
		Object roomid = map.get("roomid");
		if(roomid!=null&&!"".equals(roomid)){
			str1+=" and roomid like '%"+roomid+"%'";
		}
		return str1;
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



	/* (non-Javadoc)
	 * @see com.aaa.dao.RoomUseDao#getDayFinance(java.util.Map)
	 */
	/**
	 *获取每天的收入
	 */
	public List<Map<String, Object>> getDayFinance(Map map) {
		// TODO Auto-generated method stub
		String time = map.get("time")+"";
		String str="";
		//System.out.println(map.get("time"));
		if(time!=null&&!"".equals(time)){
			str="  time like '%"+time+"%'";
		}
		return BaseDao.selectMap("select id,orderid,roomid,pricesum,usesum,date_format(time,'%Y-%m-%d %h:%i:%S') as time from tb_room where "+str,null);
	}








	

}
