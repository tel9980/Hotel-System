package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.entity.Store;
import com.aaa.util.BaseDao;



/***
 *@className:StoreoutDaoImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11上午11:36:23
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class StoreoutDaoImpl implements StoreoutDao {

	
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,empname,outtime from storeout" ,null);
	}

	
	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,empname,outtime from storeout where goodsid=?" , new Object[]{goodsid});
	}

	
	public int addStore(Map map) {
		Date parse =null;
		try {
			Object outtime = map.get("outtime");
			if(outtime!=null&&!"".equals(outtime)){
			parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)outtime);
			
			}
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="insert into storeout(outnumber,goodsid,goodsname,goodtype,goodsnum,empname,outtime) values(CONCAT('kh',DATE_FORMAT(now(),'%Y%m'),lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?)";
		Object[] params={map.get("goodsid"),map.get("goodsname"),map.get("goodtype"),map.get("goodsnum"),map.get("empid"),map.get("outtime")==null||"".equals(map.get("outtime"))?new Date():parse};
		
		return BaseDao.insertAndUpdateAndDelete(sql,params);
	}

	
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		String sql="update storeout set status=0 where goodsid=?";
		Object[] params={goodsid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	
	public int updateStore(Map map) {
		String sql="update storein set goodsname=?,goodtype=?,goodsnum=?,empname=?,outtime=? where goodsid=?";
		Object[] params={map.get("goodsname"),map.get("goodtype"),map.get("goodsnum"),map.get("empname"),map.get("outtime")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	private String setParams(Map map){
		String str1=" where status=1 ";
		if(map.get("goodsid")!=null&&!"".equals(map.get("goodsid"))){
			str1+=" and goodsid ="+map.get("goodsid");
		}
		Object goodsname=map.get("goodsname");
		if(goodsname!=null&&!"".equals(goodsname)){
			str1+= " and goodsname like '%"+goodsname+"%'";
		}
		Object outTime=map.get("outtime");
		Object outTimetwo=map.get("outtimetwo");
		if(outTime!=null&&!"".equals(outTime)&&outTimetwo!=null&&!"".equals(outTimetwo)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String outTime1=null;
			String outTime2 =null;
			try {
				 outTime1 = simpleDateFormat1.format(simpleDateFormat.parse(outTime.toString()));
				 outTime2 =   simpleDateFormat1.format(simpleDateFormat.parse(outTimetwo+"")); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			str1+=" and  outtime  between  '"+outTime1+"' and '"+outTime2+"' ";
			
		}
		return str1;
	}
	
	
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select sid,outnumber,goodsid,goodsname,goodtype,goodsnum,empname,date_format(outtime,'%Y-%m-%d %h:%i:%S') as outtime from storeout "+setParams(map)+str+" limit "+start+","+rows ,null);
	}

	public List<Map<String, Object>> getPageCount(Map map) {
		
		return BaseDao.selectMap("select count(*) as cnt from storeout "+setParams(map), null);
	}


	public int addAllStore(Store store) {
		Date parse =null;
		try {
			Object outtime =store.getOuttime();
			if(outtime!=null&&!"".equals(outtime)){
			parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)outtime);
			
			}
			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql="insert into storeout(outnumber,goodsid,goodsname,goodtype,goodsnum,empname,outtime) values(CONCAT('kh',DATE_FORMAT(now(),'%Y%m'),lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?)";
		Object[] params={store.getGoodsid(),store.getGoodsname(),store.getGoodtype(),store.getInnum(),store.getEmpid(),store.getOuttime()==null||"".equals(store.getOuttime())?new Date():parse};
		
		return BaseDao.insertAndUpdateAndDelete(sql,params);
	}

}


