package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.BookingroomDao;

/***
 *@className:BookingroomServiceImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-17上午11:39:46
 *@version:
 */
@Service//将自动注册到Spring容器
@SuppressWarnings("all")
public class BookingroomServiceImpl implements BookingroomService {
	//依赖注入
	@Autowired
	private BookingroomDao bookingroomDao;
	/**
	 * 查询线上订单信息
	 */
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return bookingroomDao.getList();
	}
	/**
	 * 获取分页数据
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		//获取分页要素，判断如果为空，赋予默认值
		int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		//计算开始值
		int start = (pageNo-1)*pageSize;
		return bookingroomDao.getPage(start, pageSize, map);
	}
	/**
	 * 获取分页数据的总数量
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> pageCount = bookingroomDao.getPageCount(map);
		//判断集合，如果不为空，返回总数量
		if (pageCount!=null&&pageCount.size()>0) {
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}
		return 0;
	}
	/**
	 * 更改线上订单状态
	 */
	public int bookingroomUpd(Map map) {
		// TODO Auto-generated method stub
		return bookingroomDao.bookingroomUpd(map);
	}
	/**
	 * 根据房间状态和房间类型选择房号
	 */
	public List<Map<String, Object>> checkRoomId(Map map) {
		// TODO Auto-generated method stub
		return bookingroomDao.checkRoomId(map);
	}
	public List<Map<String, Object>> showOne(int roomid) {
		// TODO Auto-generated method stub
		return bookingroomDao.showOne(roomid);
	}
	public List<Map<String, Object>> showOredr(String orderid) {
		// TODO Auto-generated method stub
		return bookingroomDao.showOredr(orderid);
	}
	
	
}
