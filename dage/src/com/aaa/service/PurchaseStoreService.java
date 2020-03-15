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
public interface PurchaseStoreService {
	/**
	 * 查询商品列表
	 * @return
	 */
	List<Map<String,Object>> getList();
	
	/**
	 * 通过商品id查询该商品信息
	 * @param goodsid
	 * @return
	 */
	List<Map<String,Object>> getListById(Integer goodsid);
	
	/**
	 * 增加商品
	 * @return
	 */
	int addStore(Store store);
	
	/**
	 * 通过商品id删除商品
	 * @param goodsid
	 * @return
	 */
	int delStoreById(Integer goodsid);
	
	/**
	 * 通过商品id更新商品信息
	 * @param goodsid
	 * @return
	 */
	int updateStore(Store store);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);

	int getPageCount(Map map);
	/**
	 * 获取财务 支出详细数据
	 */
	List<Map<String,Object>> getFinance(Map map);
}
