package com.aaa.dao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.TreeNode;

/***
 *@className:PowerDao.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:19:51
 *@version:
 */
@SuppressWarnings("all")
public interface PowerDao {

	/**
	 * 获取权限数据
	 * @return
	 */
	List<TreeNode> getList();
	/**
	 * 获取权限数据(获取登陆人的角色对应所有权限)
	 * @return
	 */
	List<TreeNode> getPowerList();
	
	/**
	 * 获取权限数据(所有的，但要每个节点根据判断，带上checked:true)
	 * @return
	 */
	List<TreeNode> getCheckedList(String deptno);
	/**
	 * 添加节点
	 * @param map
	 * @return
	 */
	int add(Map map);
	/**
	 * 根据Id查询
	 * @param id
	 * @return
	 */
	List<Map<String,Object>> getListById(int id);
	/**
	 * 修改节点
	 * @param map
	 * @return
	 */
	int update(Map map);
	/**
	 * 删除节点
	 * @param id
	 * @return
	 */
	int del(int id);
	/**
	 * 删除关联表id
	 * @param id
	 * @return
	 */
	int del2(int id);
	 /**
	  * 保存角色权限关联
	  * @param roleId
	  * @param powerId
	  * @return
	  */
	 int addRoleAndPowers(String deptno,String powerId);
	 /**
	  * 根据角色ID删除所有关联权限
	  * @param roleId
	  * @return
	  */
	 int deletePowersByRoleId(String deptno);
}
