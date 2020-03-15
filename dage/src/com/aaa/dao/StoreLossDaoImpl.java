package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:StoreLossDaoImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午6:59:54
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class StoreLossDaoImpl implements StoreLossDao {

	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return com.aaa.util.BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,inprice,empid,empname,losstime from storeloss", null);
	}

	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,inprice,empid,empname,losstime from storeloss where goodsid=?", new Object[]{goodsid});
	}

	
	public int addStore(Map map) {
		Date parse =null;
		try {
			Object losstime =map.get("losstime");
			if(losstime!=null&&!"".equals(losstime)){
			parse = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)losstime);
			}
		} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		Object[] params={map.get("goodsid"),map.get("goodsname"),map.get("goodtype"),map.get("goodsnum"),map.get("inprice"),map.get("losstime")==null||"".equals(map.get("losstime"))?new Date():parse,map.get("empname")};
		return BaseDao.insertAndUpdateAndDelete("insert into storeloss(goodsid,goodsname,goodtype,goodsnum,inprice,losstime,empname) values(?,?,?,?,?,?,?)",params );
	}


	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		String sql="update storeloss set status=0 where goodsid=?";
		Object[] params={goodsid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}


	public int updateStore(Map map) {
		Date parse =null;
		try {
			Object losstime =map.get("losstime");
			if(losstime!=null&&!"".equals(losstime)){
			parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)losstime);
			
			}
		} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		String sql="update storeloss set goodsname=?,goodtype=?,goodsnum=?,inprice=?,empname=?,losstime=? where goodsid=?";
		Object[] params={map.get("goodsname"),map.get("goodtype"),map.get("goodsnum"),map.get("inprice"),map.get("empname"),map.get("losstime")==null||"".equals(map.get("losstime"))?new Date():parse,map.get("goodsid")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	
	
	private String setParams(Map map){
		String str1=" where status=1 ";
		Object goodsName=map.get("goodsname");
		if(goodsName!=null&&!"".equals(goodsName)){
			str1+= " and goodsname like '%"+goodsName+"%'";
		}
		Object lossTime=map.get("losstime");
		Object lossTimetwo=map.get("losstimetwo");
		if(lossTime!=null&&!"".equals(lossTime)&&lossTimetwo!=null&&!"".equals(lossTimetwo)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String lossTime1=null;
			String lossTime2 =null;
			try {
				 lossTime1 = simpleDateFormat1.format(simpleDateFormat.parse(lossTime.toString()));
				 lossTime2 =   simpleDateFormat1.format(simpleDateFormat.parse(lossTimetwo+"")); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			str1+=" and  lossTime  between  '"+lossTime1+"' and '"+lossTime2+"' ";
			
		}
		return str1;
	}
	
	
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,goodsnum,inprice,date_format(losstime,'%Y-%m-%d %h:%i:%S') as losstime,empname from storeloss "+setParams(map)+str+" limit "+start+","+rows ,null);
	}

	public List<Map<String, Object>> getPageCount(Map map) {
		return BaseDao.selectMap("select count(*) as cnt from storeloss "+setParams(map), null);
	}

}
