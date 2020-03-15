/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.PersonDao;
import com.aaa.entity.Person;



/***
 *@className:PersonServiceImpl.java
 *@discripton:
 *@author:CZP
 *@createTime:2018-10-11上午11:38:42
 *@version:
 */
@Service
public class PersonServiceImpl implements PersonService {
	
	@Autowired
	private PersonDao personDao;
	/* 
	 * 根据用户名和密码查询用户
	 * (non-Javadoc)
	 * @see com.aaa.mvc.service.PersonService#selectsqlByNameAndPassword(com.aaa.mvc.entity.Person)
	 */
	public List<Map<String, Object>> selectsqlByNameAndPassword(Person person) {
		// TODO Auto-generated method stub
		return personDao.selectsqlByNameAndPassword(person);
	}

	/* 
	 * 添加用户
	 * (non-Javadoc)
	 * @see com.aaa.mvc.service.PersonService#insert(com.aaa.mvc.entity.Person)
	 */
	public void insert(Person person) {
		// TODO Auto-generated method stub
		personDao.insert(person);
	}

	/*
	 * 更新用户信息(用户提交订单)
	 *  (non-Javadoc)
	 * @see com.aaa.mvc.service.PersonService#update(com.aaa.mvc.entity.Person)
	 */
	public int update(Person person) {
		// TODO Auto-generated method stub
		return personDao.update(person);
	}

	/* 
	 * 根据手机号查询用户
	 * (non-Javadoc)
	 * @see com.aaa.mvc.service.PersonService#selectsqlById(int)
	 */
	public List<Map<String, Object>> selectsqlByAccount(String account) {
		// TODO Auto-generated method stub
		return personDao.selectsqlByAccount(account);
	}

	/* 
	 * 根据id用户申请取消订单
	 * (non-Javadoc)
	 * @see com.aaa.mvc.service.PersonService#deleteByOrderid(int)
	 */
	public int updateByOrderid(String orderid) {
		// TODO Auto-generated method stub
		return personDao.updateByOrderid(orderid);
	}

	/* 
	 * 查询房间类型
	 * (non-Javadoc)
	 * @see com.aaa.service.PersonService#selectRoom()
	 */
	public List<Map<String, Object>> selectRoom() {
		// TODO Auto-generated method stub
		return personDao.selectRoom();
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.PersonService#selectsqlByName(com.aaa.entity.Person)
	 */
	public List<Map<String, Object>> selectsqlByName(Person person) {
		// TODO Auto-generated method stub
		return personDao.selectsqlByName(person);
	}

}
