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
public class AuditStoreDaoImpl implements AuditStoreDao {

	/**
	 * 往分页查询里拼接
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		String str1=" where 1=1 ";
		//拼接state
		Object state=map.get("state");
		if(state!=null&&!"".equals(state)){
			str1+= " and state like '%"+state+"%'";
		}
		return str1;
	}
	
	/**
	 * 分页查询
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}else{
			str = " order by state desc ";
		}
		
		return BaseDao.selectMap("select ordernum,goodsname,goodtype,innum,empname,date_format(submittime,'%Y-%m-%d %h:%i:%S') as submittime,date_format(disposetime,'%Y-%m-%d %h:%i:%S') as disposetime,state,inprice,suplieer,suptel,rejecttext,handname from purchasestore "+setParams(map)+str+" limit "+start+","+rows ,null);
	}

	public List<Map<String, Object>> getPageCount(Map map) {
		return BaseDao.selectMap("select count(*) as cnt from purchasestore "+setParams(map), null);
	}
	/**
	 * 驳回仓库采购申请
	 */
	public int rejectApply(Map map) {
		// TODO Auto-generated method stub
		Date parse =null;
		try {
			Object disposetime = map.get("disposetime");
			if(disposetime!=null&&!"".equals(disposetime)){
			parse = new SimpleDateFormat("MM/dd/yyyy hh:ii:SS").parse((String)disposetime);
			}		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return BaseDao.insertAndUpdateAndDelete("update purchasestore set state='已驳回',rejecttext=?,disposetime=?,handname=? where ordernum=? ", 
				new Object[]{map.get("rejecttext"),map.get("disposetime")==null||"".equals(map.get("disposetime"))?new Date():parse,map.get("handname1"),map.get("ordernum")});
	}
	/**
	 * 通过仓库采购申请
	 */
	public int passApply(Map map) {
		// TODO Auto-generated method stub
		Date parse =null;
		try {
			Object disposetime = map.get("disposetime");
			if(disposetime!=null&&!"".equals(disposetime)){
			parse = new SimpleDateFormat("MM/dd/yyyy hh:ii:SS").parse((String)disposetime);
			}		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return BaseDao.insertAndUpdateAndDelete("update purchasestore set state='已审核',disposetime=?,handname=? where ordernum=? ", 
				new Object[]{map.get("disposetime")==null||"".equals(map.get("disposetime"))?new Date():parse,map.get("handname"),map.get("ordernum")});
	}
		

}
