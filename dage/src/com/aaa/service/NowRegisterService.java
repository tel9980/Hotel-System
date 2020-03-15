package com.aaa.service;

import java.util.List;
import java.util.Map;
@SuppressWarnings("all")
public interface NowRegisterService {
	/**
	 * 显示所有
	 * @return
	 */
	List<Map<String,Object>> showAll();
	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	List<Map<String,Object>> showLimit(Map map);
	/**
	 *  获取数据库总条数
	 * @param map
	 * @return
	 */
	int getCount(Map map);
	/**
	 * 添加客户入住信息
	 * @param map
	 * @return
	 */
	int add(Map map);
	/**
	 * 通过roomid 获取当前入住客户的信息
	 * @param roomid
	 * @return
	 */
	List<Map<String,Object>> getListByRoomId(int roomid);
	/**
	 * 通过roomid删除当前入住客户的信息
	 * @param roomid
	 * @return
	 */
	int del(int roomid);
	/**
	 * 换房调用方法   通过身份证号修改表内房间号
	 * @param idcard
	 * @return
	 */
	int update(Map map);
	/**
	 * 续住调用方法   通过roomid 修改预入住天数
	 * @param days
	 * @param roomid
	 * @return
	 */
	int updatedays(int days,int roomid,int roompricesum);
}
