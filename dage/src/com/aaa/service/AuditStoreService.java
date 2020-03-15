package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Store;

/***
 *@className:PurchaseStoreService.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午8:55:42
 *@version:
 */
@SuppressWarnings("all")
public interface AuditStoreService {
	/**
	 * 分页查询申请列表
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);

	int getPageCount(Map map);

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
