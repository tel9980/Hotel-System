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
 *@className:PurchaseStoreDaoImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午8:24:25
 *@version:
 */
@SuppressWarnings("all")
@Repository
public class PurchaseStoreDaoImpl implements PurchaseStoreDao {

	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,innum,empname,submittime,state,inprice,suplieer,suptel from purchasestore where state='已审核'", null);
	}

	public List<Map<String, Object>> getListById(Integer sid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,innum,empname,submittime,state,inprice,suplieer,suptel from purchasestore where sid=?", new Object[]{sid});
	}

	/**
	 * 
	 * 增加商品采购信息`
	 */
	public int addStore(Store store) {
		// TODO Auto-generated method stub
		Date parse =null;
		try {
			Object submittime =store.getSubmittime();
			if(submittime!=null&&!"".equals(submittime)){
			parse = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse((String)submittime);		
			}
		} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		String str="待审核";
		Object param=(Object)str;
		Object[] params={store.getGoodsid(),store.getGoodsname(),store.getGoodtype(),store.getInnum(),store.getEmpid(),store.getInprice(),store.getSuplieer(),store.getSuptel(),store.getSubmittime()==null||"".equals(store.getSubmittime())?new Date():parse,param};
		return BaseDao.insertAndUpdateAndDelete("insert into purchasestore(ordernum,goodsid,goodsname,goodtype,innum,empname,inprice,suplieer,suptel,submittime,state) values(CONCAT('kh',DATE_FORMAT(now(),'%Y%m%d'),lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?,?,?,?,?)",params );
	}

	/**
	 * 删除页面数据,使数据库的信息不删除,但在页面不显示
	 */
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		String sql="update purchasestore set status=0 where goodsid=?";
		Object[] params={goodsid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	/**
	 * 
	 *采购时,更新采购单信息
	 */
	public int updateStore(Store store) {
		String str="已采购";
		Object param=(Object)str;
		String sql="update purchasestore set state=? where sid=?";
		Object[] params={param,store.getSid()};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	
	/**
	 * 
	 * 设置参数方法,条件查询
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		String str1=" where status=1 ";
		Object goodsName=map.get("goodsname");
		if(goodsName!=null&&!"".equals(goodsName)){
			str1+= " and goodsname like '%"+goodsName+"%'";
		}
		Object submitTime=map.get("submittime");
		Object submitTimetwo=map.get("submittimetwo");
		if(submitTime!=null&&!"".equals(submitTime)&&submitTimetwo!=null&&!"".equals(submitTimetwo)){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String submitTime1=null;
			String submitTime2 =null;
			try {
				 submitTime1 = simpleDateFormat1.format(simpleDateFormat.parse(submitTime.toString()));
				 submitTime2 = simpleDateFormat1.format(simpleDateFormat.parse(submitTimetwo+"")); 
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			str1+=" and  submitTime  between  '"+submitTime1+"' and '"+submitTime2+"' ";
		}
		return str1;
	}
	
	/**
	 * 查询分页数据
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		return BaseDao.selectMap("select sid,ordernum,goodsid,goodsname,goodtype,innum,empname,date_format(submittime,'%Y-%m-%d %h:%i:%S') as submittime,state,inprice,suplieer,suptel from purchasestore "+setParams(map)+str+" limit "+start+","+rows ,null);
	}
	/**
	 * 获得分页数据条数
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		return BaseDao.selectMap("select count(*) as cnt from purchasestore "+setParams(map), null);
	}
	/**
	 * 查询财务汇总支出详情数据
	 */

	/* (non-Javadoc)
	 * @see com.aaa.dao.PurchaseStoreDao#getStoreFinance(java.util.Map)
	 */
	public List<Map<String, Object>> getStoreFinance(Map map) {
		// TODO Auto-generated method stub
		String time = map.get("time")+"";
		String str1="";
		if(time!=null&&!"".equals(time)){
			str1+=" and submittime like '%"+time+"%'";
		}
		return BaseDao.selectMap("select ordernum,goodsid,goodsname,goodtype,innum,inprice,date_format(submittime,'%Y-%m-%d %h:%i:%S') as submittime,state,inprice,suplieer,suptel,handname from purchasestore where state='已采购'  "+str1,null );
	}

}
