/**
 * 
 */
package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomUseDao;



/***
 *@className:UserServiceImpl.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-9-27上午10:47:11
 *@version:
 */
@Service
@SuppressWarnings("all")
public class RoomUseServiceImpl implements RoomUseService {
	@Autowired
	private RoomUseDao userdao;
	
	/* (non-Javadoc)
	 * @see com.aaa.mvc.service.UserService#addUser(java.util.Map)
	 */
	/**
	 * 添加
	 */
	public int addUser(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return userdao.addUser(map);
	}
	
	/* (non-Javadoc)
	 * @see com.aaa.mvc.service.UserService#updateUser(java.util.Map)
	 */
	/**
	 * 更新
	 */
	public int updateUser(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return userdao.updateUser(map);
	}
	/* (non-Javadoc)
	 * @see com.aaa.mvc.service.UserService#delUser(java.util.Map)
	 */
	/**
	 * 删除
	 */
	public int delUser(int id) {
		// TODO Auto-generated method stub
		return userdao.delUser(id);
	}
	
	
	/* (non-Javadoc)
	 * @see com.aaa.mvc.service.UserService#getPage(java.util.Map)
	 */
	/**
	 * 获取房间总消费 分页数据
	 */
	public List<Map<String, Object>> getPage(Map map) {
		// TODO Auto-generated method stub
		int pageNo=map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
		int pageSize=map.get("rows")==null?20:Integer.valueOf(map.get("rows")+"");
		int start=(pageNo-1)*pageSize;
		return userdao.getPage(start, pageSize, map);
	}
	/* (non-Javadoc)
	 * @see com.aaa.mvc.service.UserService#getPageCount(java.util.Map)
	 */
	/**
	 * 获取分页总条数
	 */
	public int getPageCount(Map map) {
		// TODO Auto-generated method stub
		 List<Map<String,Object>> pageCount=userdao.getPageCount(map);
		 if(pageCount!=null&&pageCount.size()>0){
			 return Integer.valueOf(pageCount.get(0).get("cnt")+"");
		 }
		return 0 ;
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.RoomUseService#getDayFinance(java.util.Map)
	 */
	/**
	 * 获取每天财务数据
	 */
	public List<Map<String, Object>> getDayFinance(Map map) {
		// TODO Auto-generated method stub
		return userdao.getDayFinance(map);
	}

}
