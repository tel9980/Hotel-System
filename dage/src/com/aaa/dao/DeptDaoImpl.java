package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:DeptDaoImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-5下午6:30:39
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class DeptDaoImpl implements DeptDao {
	/**
	 * 获取部门列表
	 * @return
	 */
	public List<Map<String,Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select deptno,deptname,deptlim,deptstate from dept", null);
	}
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows 每页显示数量
	 * @param map 其他参数
	 * @return
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		//排序参数
		String str = "";
		if (map.get("sort")!=null) {
			str = " order by " + map.get("sort") + " " + map.get("order");
		}
		return BaseDao.selectMap("select deptno,deptname,deptlim,deptstate from dept  where deptstate like '使用中' "+setParams(map)+str+" limit "+start+","+rows, null);
	}
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		
		return BaseDao.selectMap("select count(*) as cnt from dept  where deptstate like '使用中' "+setParams(map),null);
	}

	/**
	 *封装参数deptNo和deptName
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		//查询参数
		String str1="";
		Object deptNo= map.get("deptNo");
		//拼接deptNo(含搜索)
		if (map.get("deptNo")!=null&&!"".equals(deptNo)) {
			str1+= " and deptno like '%"+deptNo+"%' ";
		}
		//拼接deptName(含有搜索)
		Object deptName=map.get("deptName");
		//拼接stuId
		if (deptName!=null&&!"".equals(deptName)) {
			str1+=" and deptname like '%"+deptName+"%'";
		}
		return str1;
	}

	/**
	 * 部门增加
	 */
	public int deptAdd(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into dept(deptno,deptname,deptlim,deptstate) values(CONCAT('D',DATE_FORMAT(now(),'%Y%m'),lpad(floor(rand()*10000),4,0)),?,?,?)", 
				new Object[]{map.get("deptname"),map.get("deptlim"),map.get("deptstate")});
	}

	/**
	 * 部门更新
	 */
	public int deptUpd(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update dept set deptname=?,deptlim=?,deptstate=? where deptno=? ", 
				new Object[]{map.get("deptname"),map.get("deptlim"),map.get("deptstate"),map.get("deptno")});
	}

	/**
	 * 部门删除(没用)
	 */
	public int deptDel(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from dept where deptno=?", new Object[]{map.get("deptno")});
	}

}
