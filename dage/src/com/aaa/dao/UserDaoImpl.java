package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:UserDaoImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-10下午8:35:56
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class UserDaoImpl implements UserDao {
	/**
	 * 获取部门列表
	 * @return
	 */
	public List<Map<String,Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select userno,account,password,username,useridcard,usertimes,usercount,level,discount from user  ", null);
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
		return BaseDao.selectMap("select userno,account,password,username,useridcard,usertimes,usercount,level,discount from user "+setParams(map)+str+" limit "+start+","+rows, null);
	}
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		
		return BaseDao.selectMap("select count(*) as cnt from user "+setParams(map),null);
	}

	/**
	 *封装参数userno,userName,account,useridcard
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		//查询参数
		String str1=" where 1=1 ";
		//拼接userNo(含有搜索)
		Object userNo=map.get("userNo");
		if (userNo!=null&&!"".equals(userNo)) {
			str1+=" and userno like '%"+userNo+"%'";
		}
		//拼接userName(含有搜索)
		Object userName=map.get("userName");
		if (userName!=null&&!"".equals(userName)) {
			str1+=" and username like '%"+userName+"%'";
		}
		//拼接account
		Object account=map.get("account");
		if (account!=null&&!"".equals(account)) {
			str1+=" and account like '%"+account+"%'";
		}
		//拼接useridcard
		Object useridcard=map.get("useridcard");
		if (useridcard!=null&&!"".equals(useridcard)) {
			str1+=" and useridcard like '%"+useridcard+"%'";
		}
		return str1;
	}

	/**
	 * 用户增加
	 */
	public int userAdd(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into user(userno,account,password,username,useridcard,usercount,level,discount) values(CONCAT('AA',DATE_FORMAT(now(),'%Y%m%d'),lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?,?)", 
				new Object[]{map.get("account"),map.get("password"),map.get("username"),map.get("useridcard"),map.get("usercount"),map.get("level"),map.get("discount")});
	}

	/**
	 * 用户更新
	 */
	public int userUpd(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update user set account=?,password=?,username=?,useridcard=?,usertimes=?,usercount=?,level=?,discount=? where userno=? ", 
				new Object[]{map.get("account"),map.get("password"),map.get("username"),map.get("useridcard"),map.get("usertimes"),map.get("usercount"),map.get("level"),map.get("discount"),map.get("userno")});
	}

	/**
	 * 用户删除
	 */
	public int userDel(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from user where userno=?", new Object[]{map.get("userno")});
	}
	/**
	 * 根据用户编号查询用户信息
	 */
	public List<Map<String, Object>> showOne(String userno) {
		String sql = "select * from user where userno=?";
		return BaseDao.selectMap(sql, new Object[]{userno});
	}
}
