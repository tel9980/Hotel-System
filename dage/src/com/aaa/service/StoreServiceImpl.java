package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.StoreDao;
import com.aaa.entity.Store;
import com.aaa.util.BaseDao;



/***
 *@className:StoreServiceImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-9-29下午8:07:26
 *@version:
 */
@Service
@SuppressWarnings("all")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao storeDao;

	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return storeDao.getList();
	}
	
	
	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeDao.getListById(goodsid);
	}

	
	public int addStore(Map map) {
		// TODO Auto-generated method stub
		return storeDao.addStore(map);
	}

	
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeDao.delStoreById(goodsid);
	}

	
	public int updateStore(Map map) {
		// TODO Auto-generated method stub
		return storeDao.updateStore(map);
	}

	public int outPutStore(Map map) {
		// TODO Auto-generated method stub
		return storeDao.outPutStore(map);
	}
	
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		//获取分页要素,判断是否为空,赋予默认值
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		//计算开始值
		int start=(pageNo-1)*pageSize;
		return storeDao.getPage(start, pageSize, map);
	}

	
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pageCount=storeDao.getPageCount(map);
		//判断集合,如果不为空,返回总数量
		if(pageCount!=null&&pageCount.size()>0){
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}else{
		return 0;
		}
	}

	public List<Map<String, Object>> getRoomUse() {
		// TODO Auto-generated method stub
		return storeDao.getRoomUse();
	}

	public int inputStore(Store store) {
		
		return storeDao.inputStore(store);
	}

	public int updateAllStore(Store store) {
		// TODO Auto-generated method stub
		return storeDao.updateAllStore(store);
	}

	public List<Map<String, Object>> getListByName(String goodsname) {
		// TODO Auto-generated method stub
		return storeDao.getListByName(goodsname);
	}


	

}
