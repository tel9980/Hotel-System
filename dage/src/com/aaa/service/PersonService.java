/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Person;



/***
*@className:PersonService.java
*@discripton:
*@author:CZP
*@createTime:2018-10-11上午11:34:43
*@version:
*/
public interface PersonService {
	/**
	 * 根据用户名和密码查询用户
	 * @param person
	 * @return
	 */
	List<Map<String,Object>> selectsqlByNameAndPassword(Person person);
	/**
	 * 根据用户名查询用户
	 * @param person
	 * @return
	 */
	List<Map<String,Object>> selectsqlByName(Person person);
	/**
	 * 添加用户
	 * @param person
	 */
	void insert(Person person);
	/**
	 * 更新用户信息(提交订单)
	 * @param person
	 */
	int update(Person person);
	/**
	 * 根据手机号查询用户
	 * @param id
	 * @return
	 */
	List<Map<String,Object>> selectsqlByAccount(String account);
	
	/**
	 * 根据id 用户申请取消订单
	 * @param id
	 * @return
	 */
	int updateByOrderid(String id);
	/**
	 * 查询房间类型
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> selectRoom();
}
