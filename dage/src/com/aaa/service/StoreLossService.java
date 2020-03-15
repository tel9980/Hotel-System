package com.aaa.service;

import java.util.List;
import java.util.Map;

/***
 *@className:StoreLossService.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午7:19:10
 *@version:
 */
@SuppressWarnings("all")
public interface StoreLossService {
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
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> getPage(Map map);

	int getPageCount(Map map);
}
