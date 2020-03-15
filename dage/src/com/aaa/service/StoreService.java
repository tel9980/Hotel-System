package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Store;

/***
 *@className:StoreService.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-9-29下午8:06:02
 *@version:
 */
@SuppressWarnings("all")
public interface StoreService {
	
	
	/**
	 * 查询商品
	 * @return
	 */
	List<Map<String, Object>> getList();
	
	/**
	 * 通过商品id查询该商品信息
	 * @param goodsid
	 * @return
	 */
	List<Map<String,Object>> getListById(Integer goodsid);
	/**
	 * 通过商品查询信息
	 * @param goodsid
	 * @return
	 */
	List<Map<String,Object>> getListByName(String goodsname);
	/**
	 * 增加商品
	 * @return
	 */
	int addStore(Map map);
	
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
	int updateStore(Map map);
	/**
	 * 商品单个出库
	 * @param store
	 * @return
	 */
	int outPutStore(Map map);
	/**
	 * 出库批量
	 * @param store
	 * @return
	 */
	int updateAllStore(Store store);
	/**
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);

	int getPageCount(Map map);
	
	 List<Map<String, Object>> getRoomUse();
	 
	 int inputStore(Store store);
}
