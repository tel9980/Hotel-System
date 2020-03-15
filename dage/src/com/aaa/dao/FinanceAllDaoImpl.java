/**
 * 
 */
package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:FinanceAllDaoImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-20下午2:25:10
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class FinanceAllDaoImpl implements FinanceAllDao {

	/* (non-Javadoc)
	 * @see com.aaa.dao.FinanceAllDao#getFinanceAccount(java.util.Map)
	 */
	/**
	 *  按年月 获取所有收入支出数据 
	 */
	public List<Map<String, Object>> getFinanceAccount(Map map) {
		// TODO Auto-generated method stub
		
		return BaseDao.selectMap("select  DATE_FORMAT(time,'%Y-%m-%d') time,ifnull(sum(case when a.1=1 then total end),0) as income,ifnull(sum(case when a.1=2 then total end),0) as outcome from "
		+" (select (pricesum+usesum) as total,1 ,time from tb_room union all "
		+" select innum*inprice  as total,2,submittime  from purchasestore where state='已采购') a  where DATE_FORMAT(a.time,'%Y')=? and DATE_FORMAT(a.time,'%m')=?  group by DATE_FORMAT(time,'%Y-%m-%d')",new Object[]{map.get("year"),map.get("month")} );
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.FinanceAllDao#getFinanceAll(java.util.Map)
	 */
	/**
	 * 获取 收入支出总数据
	 */
	public List<Map<String, Object>> getFinanceAll(int start,int rows,Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		String str1=" having 1=1 ";
		Object id = map.get("orderid");
		if(id!=null&&!"".equals(id)){
			str1+=" and orderid="+id;
		}
		Object roomid = map.get("roomid");
		if(roomid!=null&&!"".equals(roomid)){
			str1+=" and roomid like '%"+roomid+"%'";
		}
		return BaseDao.selectMap("select  DATE_FORMAT(time,'%Y-%m-%d') time,ifnull(sum(case when a.1=1 then total end),0) as income,ifnull(sum(case when a.1=2 then total end),0) as outcome from "
				+" (select (pricesum+usesum) as total,1 ,time from tb_room union all "
				+" select innum*inprice  as total,2,submittime  from purchasestore where state='已采购') a   group by DATE_FORMAT(time,'%Y-%m-%d')"+str1+str+" limit "+start+","+rows,null);
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.FinanceAllDao#getFinanceAllCount(java.util.Map)
	 */
	/**
	 * 获取数据 总条数
	 */
	public List<Map<String, Object>> getFinanceAllCount(Map map) {
		// TODO Auto-generated method stub
		String str1=" where 1=1 ";
		Object id = map.get("orderid");
		if(id!=null&&!"".equals(id)){
			str1+=" and orderid="+id;
		}
		Object roomid = map.get("roomid");
		if(roomid!=null&&!"".equals(roomid)){
			str1+=" and roomid like '%"+roomid+"%'";
		}
		return BaseDao.selectMap("select Count( DISTINCT DATE_FORMAT(time,'%Y-%m-%d')) as cnt from tb_room  "+str1, null);
	}

}
