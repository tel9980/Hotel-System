/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.StayOverDao;

/***
 *@className:StayOverServiceImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-16下午6:57:21
 *@version:
 */
@Service
@SuppressWarnings("all")
public class StayOverServiceImpl implements StayOverService {

	@Autowired
	private StayOverDao stayOverDao;
	/* (non-Javadoc)
	 * @see com.aaa.service.StoreStockService#addStoreStock(java.util.Map)
	 */
	public int addStayOver(Map map) {
		// TODO Auto-generated method stub
		return stayOverDao.addStayOver(map);
	}

	

	/* (non-Javadoc)
	 * @see com.aaa.service.StoreStockService#delStoreStock(int)
	 */
	public int delStayOver(int id) {
		// TODO Auto-generated method stub
		return stayOverDao.delStayOver(id);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.StoreStockService#getPage(int, int, java.util.Map)
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?20:Integer.valueOf(map.get("rows")+"");
		int start=(pageNo-1)*pageSize;
		return stayOverDao.getPage(start, pageSize, map);
	}
	/* (non-Javadoc)
	 * @see com.aaa.service.StoreStockService#getPageCount(java.util.Map)
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		 List<Map<String,Object>> pageCount=stayOverDao.getPageCount(map);
		 if(pageCount!=null&&pageCount.size()>0){
			 return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		 }
		return 0 ;
	}

	
}
