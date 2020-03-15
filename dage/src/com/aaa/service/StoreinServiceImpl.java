package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.StoreinDao;
import com.aaa.entity.Store;





/***
 *@className:StoreinServiceImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11上午9:42:41
 *@version:
 */
@Service
@SuppressWarnings("all")
public class StoreinServiceImpl implements StoreinService {

	@Autowired
	private StoreinDao storeinDao;
	
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return storeinDao.getList();
	}

	
	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeinDao.getListById(goodsid);
	}

	
	public int addStore(Store store) {
		// TODO Auto-generated method stub
		return storeinDao.addStore(store);
	}

	
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		return storeinDao.delStoreById(goodsid);
	}

	
	public int updateStore(Store store) {
		// TODO Auto-generated method stub
		return storeinDao.updateStore(store);
	}

	
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		//获取分页要素,判断是否为空,赋予默认值
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		//计算开始值
		int start=(pageNo-1)*pageSize;
		return storeinDao.getPage(start, pageSize, map);
	}

	
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pageCount=storeinDao.getPageCount(map);
		//判断集合,如果不为空,返回总数量
		if(pageCount!=null&&pageCount.size()>0){
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}else{
			return 0;
		}
	}

}
