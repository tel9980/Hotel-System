package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.StoreoutDao;
import com.aaa.entity.Store;



/***
 *@className:StoreoutServiceImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午1:17:30
 *@version:
 */
@Service
@SuppressWarnings("all")
public class StoreoutServiceImpl implements StoreoutService {

	@Autowired
	private StoreoutDao storeoutDao;
	
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return storeoutDao.getList();
	}

	
	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeoutDao.getListById(goodsid);
	}

	
	public int addStore(Map map) {
		// TODO Auto-generated method stub
		return storeoutDao.addStore(map);
	}

	
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeoutDao.delStoreById(goodsid);
	}

	
	public int updateStore(Map map) {
		// TODO Auto-generated method stub
		return storeoutDao.updateStore(map);
	}

	
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		//获取分页要素,判断是否为空,赋予默认值
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		//计算开始值
		int start=(pageNo-1)*pageSize;
		return storeoutDao.getPage(start, pageSize, map);
	}

	
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pageCount=storeoutDao.getPageCount(map);
		//判断集合,如果不为空,返回总数量
		if(pageCount!=null&&pageCount.size()>0){
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}else{
			return 0;
		}
	}


	public int addAllStore(Store store) {
		// TODO Auto-generated method stub
		return storeoutDao.addAllStore(store);
	}

}
