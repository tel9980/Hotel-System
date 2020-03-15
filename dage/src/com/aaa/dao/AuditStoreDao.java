package com.aaa.dao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Store;


/***
 *@className:PurchaseStoreDao.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午8:21:32
 *@version:
 */
@SuppressWarnings("all")
public interface AuditStoreDao {
	
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows 每页显示数量
	 * @param map 其他参数
	 * @return
	 */
	List<Map<String,Object>> getPage(int start,int rows, Map map);
	
	
	/**
	 * 获取分页数总数量
	 * @param map
	 * @return
	 */
	 List<Map<String, Object>> getPageCount(Map map);
    /**
	 * 驳回仓库采购申请
	 * @param ordernum
	 * @return
	 */
	 int rejectApply(Map map);
	 /**
	  * 通过仓库采购申请
	  * @param ordernum
	  * @return
	  */
	 int passApply(Map map);
	 
}

