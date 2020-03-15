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
 *@className:StayDaoImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-16下午6:53:39
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class StayOverDaoImpl implements StayOverDao {

	/* (non-Javadoc)
	 * @see com.aaa.dao.StoreStockDao#addStoreStock(java.util.Map)
	 */
	
	public int addStayOver(Map map) {
		// TODO Auto-generated method stub
		try {
			
			Date begintime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse((String)map.get("begintime"));
			return BaseDao.insertAndUpdateAndDelete("insert into stayover (roomid,cusname,cussex,custel,idcardtype,idcard,roomtype,roomprice,staytime,staydays,stayroomprice,begintime) values(?,?,?,?,?,?,?,?,now(),?,?,?) ", new Object[]{map.get("roomid"),map.get("cusname"),map.get("cussex"),map.get("custel"),map.get("idcardtype"),map.get("idcard"),map.get("roomtype"),map.get("roomprice"),map.get("staydays"),map.get("stayroomprice"),
					map.get("begintime")!=null&&!"".equals(map.get("begintime"))?begintime:null});
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	

	/* (non-Javadoc)
	 * @see com.aaa.dao.StoreStockDao#delStoreStock(int)
	 */
	public int delStayOver(int id) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from stayover where number=?", new Object[]{id});
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.StoreStockDao#getPage(int, int, java.util.Map)
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select roomid,cusname,cussex,custel,idcardtype,idcard,roomtype,roomprice,date_format(staytime,'%Y-%m-%d %h:%i:%S') as staytime,staydays,stayroomprice,date_format(begintime,'%Y-%m-%d %h:%i:%S') as begintime"+
" from stayover "+setParams(map)+str+" limit "+start+","+rows,null);
	}

	/* (non-Javadoc)
	 * @see com.aaa.dao.StoreStockDao#getPageCount(java.util.Map)
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select count(*) as cnt from stayover "+setParams(map), null);
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
		Object id = map.get("roomid");
		if( id!=null&&!"".equals( id)){
			str1+=" and roomid="+ id;
		}
		Object cusname = map.get("cusname");
		if(cusname!=null&&!"".equals(cusname)){
			str1+=" and cusname like '%"+cusname+"%'";
		}
		return str1;
	}

}
