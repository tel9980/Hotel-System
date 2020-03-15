package com.aaa.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.PowerService;

/***
 *@className:PowerController.java
 *@discripton:
 *@author:zz
 *@createTime:2018-10-9上午11:53:50
 *@version:
 */
@Controller
@RequestMapping("/power")
@SuppressWarnings("all")
public class PowerController {

	@Autowired
	private PowerService powerService;
	
	/**
	 * 权限树json数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tree")
	public Object powerTree(){
		return powerService.getPowerList();
	}
	/**
	 * 权限树json数据(选择)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkedTree")
	public Object checkedTree(String deptno){
		return powerService.getCheckedList(deptno);
	}
	/**
	 * 权限树json数据(根据登陆不同，展示权限菜单不同)
	 * @return
	 */
	@ResponseBody //返回json格式数据
	@RequestMapping("/powerTree")
	public Object powerListTree(){
		return powerService.getPowerList();
	}
	/**
	 * 跳转到部门权限管理页面
	 * @return
	 */
	@RequestMapping("/addpowers")
	public Object addPowers(){
		return "power/dept";	
	}
	/**
	 * 跳转power.jsp
	 * @return
	 */
	@RequestMapping("/list")
	public Object power(){
		return "power/power";
	}
	/**
	 * 跳转power权限添加页面
	 * @return
	 */
	@RequestMapping("/addp")
	public Object addp(){
		return "power/add";
	}
	/**
	 * 跳转部门页面
	 * @return
	 */
	@RequestMapping("/dept")
	public Object dept(){
		return "personnel/dept";
	}
	/**
	 * 跳转员工页面
	 * @return
	 */
	@RequestMapping("/emp")
	public Object emp(){
		return "personnel/emp";
	}
	/**
	 * 跳转用户页面
	 * @return
	 */
	@RequestMapping("/user")
	public Object user(){
		return "personnel/user";
	}
	/**
	 * 添加权限
	 * @param map
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/add")
	public void add(@RequestParam Map map,HttpServletResponse response) throws IOException{
		int add = powerService.add(map);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		if(add==0){
			response.getWriter().print("添加失败");
		}else{
			response.getWriter().print("<script> window.parent.parent.location.href=window.parent.parent.location.href  </script>");
		}		
	}
	/**
	 * 去更新
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id,Model model){
		List<Map<String, Object>> list = powerService.getListById(id);
		if(list!=null&&list.size()>0){
			model.addAttribute("map", list.get(0));
			return "power/update";
		}
		return null;
	}
	/**
	 * 更新权限 并刷新
	 * @param map
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/update")
	public void update(@RequestParam Map map,HttpServletResponse response) throws IOException{
		int update = powerService.update(map);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		if(update==0){
			response.getWriter().print("更新失败");
		}else{
			response.getWriter().print("<script> window.parent.parent.location.href=window.parent.parent.location.href  </script>");
		}
	}
	/**
	 * 删除权限树节点 
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/del")
	public void del(Integer id,HttpServletResponse response) throws IOException{
		int del = powerService.del(id);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		if(del==0){
			response.getWriter().print("删除失败");
		}else{
			response.getWriter().print("<script> window.parent.parent.location.href=window.parent.parent.location.href  </script>");
		}
	}
	/**
	 * 保存角色权限关联
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveRoleAndPower")
	public Object saveRoleAndPower(@RequestParam Map paramMap){
		//保存
		int rs = powerService.saveRoleAndPower(paramMap);
		Map map = new HashMap();
		if(rs==0){
		     map.put("showInfo", "添加失败");
		}else{
			  map.put("suc", "true");
			  map.put("showInfo", "添加成功");
		} 
		return map;
	}
}
