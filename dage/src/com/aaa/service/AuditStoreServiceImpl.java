package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.AuditStoreDao;
import com.aaa.entity.Store;

/***
 *@className:AuditStoreServiceImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午8:56:43
 *@version:
 */
@SuppressWarnings("all")
@Service
public class AuditStoreServiceImpl implements AuditStoreService {

	@Autowired
	private AuditStoreDao auditStoreDao;

	/**
	 * 分页查询采购申请
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		//获取分页要素,判断是否为空,赋予默认值
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
		//计算开始值
		int start=(pageNo-1)*pageSize;
		return auditStoreDao.getPage(start, pageSize, map);
	}

	/**
	 * 获取总量
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> pageCount=auditStoreDao.getPageCount(map);
		//判断集合,如果不为空,返回总数量
		if(pageCount!=null&&pageCount.size()>0){
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}else{
		return 0;
		}
	}

	/**
	 * 驳回仓库采购申请
	 */
	public int rejectApply(Map map) {
		// TODO Auto-generated method stub
		return auditStoreDao.rejectApply(map);
	}

	/**
	 * 通过仓库采购申请
	 */
	public int passApply(Map map) {
		// TODO Auto-generated method stub
		return auditStoreDao.passApply(map);
	}

}
