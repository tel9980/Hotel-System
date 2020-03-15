package com.aaa.dao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Store;

/***
 *@className:StoreDao.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-9-29下午7:36:12
 *@version:
 */
@SuppressWarnings("all")
public interface StoreDao {
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
	 * 商品批量出库
	 * @param store
	 * @return
	 */
	int updateAllStore(Store store);
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
	 
	 List<Map<String, Object>> getRoomUse();
	 /**
	  * 商品入库更新商品数目
	  * @param store
	  * @return
	  */
	 int inputStore(Store store);
}
