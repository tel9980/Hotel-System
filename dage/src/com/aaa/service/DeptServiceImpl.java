/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.DeptDao;

/***
 *@className:DeptServiceImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-9-17下午3:14:45
 *@version:
 */
@Service
@SuppressWarnings("all")
public class DeptServiceImpl implements DeptService {

	//依赖注入
	@Autowired
	private DeptDao deptDao;
	
	/**
	 * 查询所有部门信息
	 */
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return deptDao.getList();
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
		return deptDao.getPage(start, pageSize, map);
	}
	/**
	 * 获取分页数据的总数量
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> pageCount = deptDao.getPageCount(map);
		//判断集合，如果不为空，返回总数量
		if (pageCount!=null&&pageCount.size()>0) {
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}
		return 0;
	}
	
	/**
	 * 部门添加
	 */
	public int deptAdd(Map map) {
		// TODO Auto-generated method stub
		return deptDao.deptAdd(map);
	}

	/**
	 * 部门更新
	 */
	public int deptUpd(Map map) {
		// TODO Auto-generated method stub
		return deptDao.deptUpd(map);
	}

	/**
	 * 部门删除
	 */
	public int deptDel(Map map) {
		// TODO Auto-generated method stub
		return deptDao.deptDel(map);
	}
	/**
	 * 根据部门编号查询用户信息
	 *//*
	public List<Map<String, Object>> showOne(String deptno) {
		// TODO Auto-generated method stub
		return deptDao.showOne(deptno);
	}*/
}
