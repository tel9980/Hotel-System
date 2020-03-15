/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.FinanceAllDao;

/***
 *@className:FinanceAllServiceImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-20下午2:43:08
 *@version:
 */
@Service
@SuppressWarnings("all")
public class FinanceAllServiceImpl implements FinanceAllService {

	@Autowired
	private FinanceAllDao financeAllDao;
	/* (non-Javadoc)
	 * @see com.aaa.controller.FinanceAllService#getEChartsData(java.util.Map)
	 */
	/**
	 * 获取收入支出统计数据
	 */
	public List<Map<String, Object>> getEChartsData(Map map) {
		// TODO Auto-generated method stub

	return financeAllDao.getFinanceAccount(map);
		
	}
	/* (non-Javadoc)
	 * @see com.aaa.controller.FinanceAllService#getPage(java.util.Map)
	 */
	/**
	 * 获取财务总数据 
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?20:Integer.valueOf(map.get("rows")+"");
		int start=(pageNo-1)*pageSize;
		return financeAllDao.getFinanceAll(start, pageSize, map);
	}
	/* (non-Javadoc)
	 * @see com.aaa.controller.FinanceAllService#getPageCount(java.util.Map)
	 */
	/**
	 * 获取收入支出 数据总条数
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		 List<Map<String,Object>> pageCount=financeAllDao.getFinanceAllCount(map);
		 if(pageCount!=null&&pageCount.size()>0){
			 return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		 }
		return 0 ;
	}

}
