package com.aaa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.entity.TreeNode;
import com.aaa.dao.PowerDao;

/***
 *@className:PowerServiceImpl.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:32:05
 *@version:
 */
@Service
@SuppressWarnings("all")
public class PowerServiceImpl implements PowerService {

	//依赖注入dao层
	@Autowired
	private PowerDao powerDao;
	
	public List<TreeNode> getList() {
		// TODO Auto-generated method stub
		List<TreeNode> powerAllList = powerDao.getList();
		//临时的powerList
		List<TreeNode> powerTempList = new ArrayList<TreeNode>();
		//判断是否为空
		if(powerAllList!=null&&powerAllList.size()>0){
			for(TreeNode ptreeNode:powerAllList){
				if(ptreeNode.getParentId()==0){//如果等于0,说明是一级节点
					powerTempList.add(ptreeNode);
					//递归绑定子节点
					bindChirldren(ptreeNode,powerAllList);
				}
			}
		}
		
		return powerTempList;
	}
	
	
	public List<TreeNode> getCheckedList(String roleId) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				List<TreeNode> powerAllList = powerDao.getCheckedList(roleId);
				//临时的powerList
				List<TreeNode> powerTempList = new ArrayList<TreeNode>();
				//判断是否为空
				if(powerAllList!=null&&powerAllList.size()>0){
					for(TreeNode ptreeNode:powerAllList){
						if(ptreeNode.getParentId()==0){//如果等于0,说明是一级节点
							powerTempList.add(ptreeNode);
							//递归绑定子节点
							bindChirldren(ptreeNode,powerAllList);
						}
					}
				}
				
				return powerTempList;
	}
	
	public List<TreeNode> getPowerList() {
		// TODO Auto-generated method stub
		List<TreeNode> powerAllList = powerDao.getPowerList();
		//临时的powerList
		List<TreeNode> powerTempList = new ArrayList<TreeNode>();
		//判断是否为空
		if(powerAllList!=null&&powerAllList.size()>0){
			for(TreeNode ptreeNode:powerAllList){
				if(ptreeNode.getParentId()==0){//如果等于0,说明是一级节点
					powerTempList.add(ptreeNode);
					//递归绑定子节点
					bindChirldren(ptreeNode,powerAllList);
				}
			}
		}
		
		return powerTempList;
	}

	/**
	 * 递归绑定所有子节点
	 * @param parentTreeNode
	 * @param powerAllList
	 */
	private  void bindChirldren(TreeNode parentTreeNode,List<TreeNode> powerAllList ){
		for(TreeNode chirldrenTreeNode:powerAllList){
			if(parentTreeNode.getId()==chirldrenTreeNode.getParentId()){
				//获取当前节点的所有子节点集合
				List<TreeNode> children = parentTreeNode.getChildren();
				if(children==null){//如果孩子节点为空,
					List<TreeNode> childrenTempList = new ArrayList<TreeNode>();//实例化孩子集合
					childrenTempList.add(chirldrenTreeNode);//添加子节点到集合里面
					parentTreeNode.setChildren(childrenTempList);//设置孩子集合
				}else{//不空，说明设置过
					children.add(chirldrenTreeNode);//添加子节点到集合里面
				}
				//自己调用自己,找孩子
				bindChirldren(chirldrenTreeNode,powerAllList);
			}
		}
	}
	 
	public int add(Map map) {
		// TODO Auto-generated method stub
		return powerDao.add(map);
	}
	 
	public List<Map<String, Object>> getListById(int id) {
		// TODO Auto-generated method stub
		return powerDao.getListById(id);
	}
	 
	public int update(Map map) {
		// TODO Auto-generated method stub
		return powerDao.update(map);
	}
	 
	public int del(int id) {
		powerDao.del2(id);
		// TODO Auto-generated method stub
		return powerDao.del(id);
	}
	public int saveRoleAndPower(Map map) {
		// TODO Auto-generated method stub
		String deptno = map.get("deptno")+"";//1
		String powerIds = map.get("powerIds")+"";//1,2,3,11
		//添加之前，删除所有原来该角色关联的所有权限ID  ，达到更新目的
		powerDao.deletePowersByRoleId(deptno);
		//分割字符串，循环添加
		String[] powerArr = powerIds.split(",");//[1,2,3,11]
		boolean isSuc=true;
		for(String powerId:powerArr){
			int rs = powerDao.addRoleAndPowers(deptno, powerId);
			if(rs==0){
				isSuc=false; 
			}
		}
		if(isSuc)
		 return 1;
		else
	     return 0;
	}
}
