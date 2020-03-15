package com.aaa.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aaa.entity.TreeNode;
import com.aaa.util.BaseDao;

/***
 *@className:PowerDaoImpl.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:21:04
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class PowerDaoImpl implements PowerDao {
	@Autowired
	private HttpSession session;
	
	public List<TreeNode> getList() {
		// TODO Auto-generated method stub
		//查询数据
		List<Map<String, Object>> powerMapList = BaseDao.selectMap("select id,name,parentid,state,iconcls,url from tb_power", null);
		//定义返回列表
		List<TreeNode> powerList = new ArrayList<TreeNode>();
		//判断是否为空
		 if(powerMapList!=null&&powerMapList.size()>0){
			 TreeNode treeNode = null;
			 //循环遍历，构造TreeNode对象，加入powerList
			 for(Map powerMap:powerMapList){
				// treeNode = new TreeNode(id, text, parentId, state, iconCls, url);
				 treeNode = new TreeNode(Integer.valueOf(powerMap.get("id")+""), powerMap.get("name")+"",
						 Integer.valueOf(powerMap.get("parentid")+""), powerMap.get("state")+""
						 , powerMap.get("iconcls")+"", powerMap.get("url")+"");
				 powerList.add(treeNode);
			 }
		 }
		return powerList;
	}
	/*public static void main(String[] args) {
		int size = new PowerDaoImpl().getList().size();
		System.out.println(size);
	}*/
	public List<TreeNode> getPowerList() {
		// TODO Auto-generated method stub
				Map map = (Map)session.getAttribute("emptel");
				Object empno =null;
				if(map!=null&&!map.isEmpty()) {
					 empno = map.get("empno");
				}
				//查询数据
				List<Map<String, Object>> powerMapList = BaseDao.selectMap("select id,name,parentid,state,iconcls,url from tb_power  where id in (select powerid from tb_dept_power where deptno=(select deptno from emp where empno=?))", 
						new Object[]{empno});
				//定义返回列表
				List<TreeNode> powerList = new ArrayList<TreeNode>();
				//判断是否为空
				 if(powerMapList!=null&&powerMapList.size()>0){
					 TreeNode treeNode = null;
					 //循环遍历，构造TreeNode对象，加入powerList
					 for(Map powerMap:powerMapList){
						// treeNode = new TreeNode(id, text, parentId, state, iconCls, url);
						 treeNode = new TreeNode(Integer.valueOf(powerMap.get("id")+""), powerMap.get("name")+"",
								 Integer.valueOf(powerMap.get("parentid")+""), powerMap.get("state")+""
								 , powerMap.get("iconcls")+"", powerMap.get("url")+"");
						 powerList.add(treeNode);
					 }
				 }
				return powerList;
	}
	
	public List<TreeNode> getCheckedList(String deptno) {
		// TODO Auto-generated method stub
		        //查询数据
				List<Map<String, Object>> powerMapList = BaseDao.selectMap("select id,name,parentid,state,iconcls,url from tb_power", null);
				//查询该角色拥有的所有权限
				List<Map<String, Object>> powersByRoleId = BaseDao.selectMap("select powerid from tb_dept_power where deptno=?", new Object[]{deptno});
				//定义返回列表
				List<TreeNode> powerList = new ArrayList<TreeNode>();
				//判断是否为空
				 if(powerMapList!=null&&powerMapList.size()>0){
					 TreeNode treeNode = null;
					 //循环遍历，构造TreeNode对象，加入powerList
					 for(Map powerMap:powerMapList){
						 //判断是否为空
						 if(powersByRoleId!=null&&powersByRoleId.size()>0){
							 for(Map powers:powersByRoleId){
								 //如果用户该全选，让节点checked=true
								 if(powers.get("powerid").toString().equals(powerMap.get("id").toString())){
									 powerMap.put("checked",true);
									 break;
								 }
							 }   
						 }
						// treeNode = new TreeNode(id, text, parentId, state, iconCls, url);
						 treeNode = new TreeNode(Integer.valueOf(powerMap.get("id")+""), powerMap.get("name")+"",
								 Integer.valueOf(powerMap.get("parentid")+""), "open"
								 , powerMap.get("iconcls")+"", powerMap.get("url")+"",powerMap.get("checked")==null?null:powerMap.get("checked")+"");
						 powerList.add(treeNode);
					 }
				 }
			return powerList;
	}
	
	public int add(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into tb_power (name,parentid,state,iconcls,url) values(?,?,?,?,?)", 
				new Object[]{map.get("name"),"".equals(map.get("parentid"))?0:map.get("parentid"),map.get("state"),map.get("iconcls"),map.get("url")});
	}

	 
	public List<Map<String, Object>> getListById(int id) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select id,name,parentid,state,iconcls,url from tb_power where id=?", new Object[]{id});
	}

	 
	public int update(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update tb_power  set name=?,parentid=?,state=?,iconcls=?,url=? where id=?", 
				new Object[]{map.get("name"),map.get("parentid"),map.get("state"),map.get("iconcls"),map.get("url"),map.get("id")});

	}

	 
	public int del(int id) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from tb_power where id=?",  new Object[]{id});
	}

	public int addRoleAndPowers(String deptno, String powerId) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("insert into tb_dept_power(deptno,powerid) values(?,?)", 
				new Object[]{deptno,powerId});
	}


	public int deletePowersByRoleId(String deptno) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from tb_dept_power where deptno=?", 
				new Object[]{deptno});
	}
	public int del2(int id) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("delete from tb_dept_power where powerid=?", 
				new Object[]{id});
	}


}
