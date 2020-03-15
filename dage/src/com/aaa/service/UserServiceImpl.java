package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.UserDao;

/***
 *@className:UserServiceImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-10下午8:36:15
 *@version:
 */
@Service
@SuppressWarnings("all")
public class UserServiceImpl implements UserService {

	//依赖注入
		@Autowired
		private UserDao userDao;
		
		/**
		 * 查询所有用户信息
		 */
		public List<Map<String, Object>> getList() {
			// TODO Auto-generated method stub
			return userDao.getList();
		}	

		/**
		 * 获取分页数据
		 */
		public List<Map<String, Object>> getPage(Map map) {
			// TODO Auto-generated method stub
			//获取分页要素，判断如果为空，赋予默认值
			int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
			int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
			//计算开始值
			int start = (pageNo-1)*pageSize;
			return userDao.getPage(start, pageSize, map);
		}
		/**
		 * 获取分页数据的总数量
		 */
		public int getPageCount(Map map) {
			// TODO Auto-generated method stub
			List<Map<String, Object>> pageCount = userDao.getPageCount(map);
			//判断集合，如果不为空，返回总数量
			if (pageCount!=null&&pageCount.size()>0) {
				return Integer.valueOf(pageCount.get(0).get("cnt")+"");
			}
			return 0;
		}
		
		/**
		 * 用户添加
		 */
		public int userAdd(Map map) {
			// TODO Auto-generated method stub
			return userDao.userAdd(map);
		}

		/**
		 * 用户更新
		 */
		public int userUpd(Map map) {
			// TODO Auto-generated method stub
			return userDao.userUpd(map);
		}

		/**
		 * 用户删除
		 */
		public int userDel(Map map) {
			// TODO Auto-generated method stub
			return userDao.userDel(map);
		}
		/**
		 * 根据用户编号查询用户信息
		 */
		public List<Map<String, Object>> showOne(String userno) {
			// TODO Auto-generated method stub
			return userDao.showOne(userno);
		}

}
