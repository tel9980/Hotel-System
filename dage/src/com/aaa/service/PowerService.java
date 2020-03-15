package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.TreeNode;

/***
 *@className:PowerService.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:31:24
 *@version:
 */
@SuppressWarnings("all")
public interface PowerService {

	/**
	 * 获取权限数据
	 * @return
	 */
	List<TreeNode> getList();
	/**
	 * 获取权限数据(所有的，但要每个节点根据判断，带上checked:true)
	 * @param roleId
	 * @return
	 */
	public List<TreeNode> getCheckedList(String roleId);
	
	/**
	 * 获取权限数据(获取登陆人的角色对应所有权限)
	 * @return
	 */
	List<TreeNode> getPowerList();
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
	 * 批量保存角色和权限
	 * @param map
	 * @return
	 */
	int saveRoleAndPower(Map map);

}
