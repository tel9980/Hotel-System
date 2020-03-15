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
 *@className:StoreinDaoImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11上午9:25:44
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class StoreinDaoImpl implements StoreinDao {
	
	
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,innum,empname,intime,inprice,suplieer,suptel,state from storein where state='待入库'" ,null);
	}


	public List<Map<String, Object>> getListById(Integer sid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,innum,empname,intime,inprice,suplieer,suptel,state from storein where sid=?" , new Object[]{sid});
	}

	
	public int addStore(Store store) {

		Date parse =null;
		try {
			Object intime = store.getIntime();
			if(intime!=null&&!"".equals(intime)){
			parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)intime);
			
			}
		} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		String str="待入库";
		Object param=(Object)str;
		String sql="insert into storein(ordernum,goodsid,goodsname,goodtype,innum,empname,intime,inprice,suplieer,suptel,state) values(CONCAT('kh',DATE_FORMAT(now(),'%Y%m'),lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?,?,?,?,?)";
		Object[] params={store.getGoodsid(),store.getGoodsname(),store.getGoodtype(),store.getInnum(),store.getEmpid(),store.getIntime()==null||"".equals(store.getIntime())?new Date():parse,store.getInprice(),store.getSuplieer(),store.getSuptel(),param};
		return BaseDao.insertAndUpdateAndDelete(sql,params);
		}
		
		
		
	
		
		

	
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		String sql="update storein  set status=0 where goodsid=?";
		Object[] params={goodsid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	
	public int updateStore(Store store) {
		String str="已入库";
		Object param=(Object)str;
		String sql="update storein set state=? where sid=?";
		Object[] params={param,store.getSid()};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	private String setParams(Map map){
		String str1=" where status=1 ";

		Object goodsName=map.get("goodsname");
		if(goodsName!=null&&!"".equals(goodsName)){
			str1+= " and goodsname like '%"+goodsName+"%'";
		}
		Object inTime=map.get("intime");
		Object inTimetwo=map.get("intimetwo");
		if(inTime!=null&&!"".equals(inTime)&&inTimetwo!=null&&!"".equals(inTimetwo)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			String inTime1=null;
			String inTime2 =null;
			try {
				 inTime1 = simpleDateFormat1.format(simpleDateFormat.parse(inTime.toString()));
				 inTime2 =   simpleDateFormat1.format(simpleDateFormat.parse(inTimetwo+"")); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			str1+=" and  intime  between  '"+inTime1+"' and '"+inTime2+"' ";
			
		}
		return str1;
	}
	
	
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select sid,ordernum,goodsid,goodsname,goodtype,innum,empname,date_format(intime,'%Y-%m-%d %h:%i:%S') as intime,inprice,suplieer,suptel,state from storein "+setParams(map)+str+" limit "+start+","+rows ,null);
	}

	public List<Map<String, Object>> getPageCount(Map map) {
		
		return BaseDao.selectMap("select count(*) as cnt from storein "+setParams(map), null);
	}
}
