package com.aaa.dao;

import java.util.List;
import java.util.Map;

/***
 *@className:StoreLossDao.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午6:58:31
 *@version:
 */
@SuppressWarnings("all")
public interface StoreLossDao {
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
}

