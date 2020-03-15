package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Store;

/***
 *@className:StoreoutService.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午1:16:31
 *@version:
 */
@SuppressWarnings("all")
public interface StoreoutService {
	/**
	 * 查询商品列表
	 * 
	 * @return
	 */
	List<Map<String, Object>> getList();

	/**
	 * 通过商品id查询该商品信息
	 * 
	 * @param goodsid
	 * @return
	 */
	List<Map<String, Object>> getListById(Integer goodsid);

	/**
	 * 增加商品
	 * 
	 * @return
	 */
	int addStore(Map map);
	
	/**
	 * 批量添加出库商品
	 * @param store
	 * @return
	 */
	int addAllStore(Store store);
	/**
	 * 通过商品id删除商品
	 * 
	 * @param goodsid
	 * @return
	 */
	int delStoreById(Integer goodsid);

	/**
	 * 通过商品id更新商品信息
	 * 
	 * @param goodsid
	 * @return
	 */
	int updateStore(Map map);

	/**
	 * 获取分页数据
	 * 
	 * @param start
	 *            开始值
	 * @param rows
	 *            每页显示数量
	 * @param map
	 *            其他参数
	 * @return
	 */
	List<Map<String, Object>> getPage( Map map);

	/**
	 * 获取分页数总数量
	 * 
	 * @param map
	 * @return
	 */
	int getPageCount(Map map);
}
