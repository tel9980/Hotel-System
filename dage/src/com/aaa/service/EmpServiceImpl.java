/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.EmpDao;

/***
 *@className:EmpServiceImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-9-17下午3:14:45
 *@version:
 */
@Service
@SuppressWarnings("all")
public class EmpServiceImpl implements EmpService {

	//依赖注入
	@Autowired
	private EmpDao empDao;
	
	/**
	 * 查询所有员工信息
	 */
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return empDao.getList();
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
		return empDao.getPage(start, pageSize, map);
	}
	/**
	 * 获取分页数据的总数量
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> pageCount = empDao.getPageCount(map);
		//判断集合，如果不为空，返回总数量
		if (pageCount!=null&&pageCount.size()>0) {
			return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		}
		return 0;
	}
	
	/**
	 * 员工添加
	 */
	public int empAdd(Map map) {
		// TODO Auto-generated method stub
		return empDao.empAdd(map);
	}

	/**
	 * 员工更新
	 */
	public int empUpd(Map map) {
		// TODO Auto-generated method stub
		return empDao.empUpd(map);
	}

	/**
	 * 员工删除
	 */
	public int empDel(Map map) {
		// TODO Auto-generated method stub
		return empDao.empDel(map);
	}
	/**
	 * 获取员工电话（账号）及密码
	 */
	public List<Map<String,Object>> getEmpByEmptelAndPassword(Map map) {
		// TODO Auto-generated method stub
		
		return empDao.getEmpByEmptelAndPassword(map);
	}
	/**
	 * 获取客房部员工信息
	 */
	public List<Map<String, Object>> getEmpByRoom() {
		// TODO Auto-generated method stub
		return empDao.getEmpByRoom();
	}
	/**
	 * 获取仓管部员工信息
	 */
	public List<Map<String, Object>> getEmpByStore() {
		// TODO Auto-generated method stub
		return empDao.getEmpByStore();
	}
	/**
	 * 获取后勤部员工信息
	 */
	public List<Map<String, Object>> getEmpByServ() {
		// TODO Auto-generated method stub
		return empDao.getEmpByServ();
	}
	/**
	 * 根据员工工号查询用户信息
	 */
	public List<Map<String, Object>> showOne(String empno) {
		// TODO Auto-generated method stub
		return empDao.showOne(empno);
	}
}
