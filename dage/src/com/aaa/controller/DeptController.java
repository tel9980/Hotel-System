  package com.aaa.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.DeptService;

/***
 *@className:DeptController.java
 *@discripton:控制台 融合了增删查改
 *@author:liudaye
 *@createTime:2018-10-5下午5:17:30
 *@version:
 */
@Controller             
@RequestMapping("/deptController")
@SuppressWarnings("all")
public class DeptController {
	
	//依赖注入
		@Autowired
		private DeptService deptService;
		/**
		 * 下拉框的值列表
		 * @param paramMap
		 * @return
		 */
		@ResponseBody //让该方法的返回值为json 相当于servlet response.getWrite().Print(json)
		@RequestMapping("/checkBoxData")// 窄化映射请求
		public Object departmentCheckBoxData(@RequestParam Map paramMap) {
			return deptService.getPage(paramMap);
		}
		/**
		 * 部门列表
		 * @param model
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/list")
		public Map deptList(){
			Map map=new HashMap();
			map.put("rows", deptService.getList());
			return map;
		}
		/**
		 * 部门分页
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/dept")
		public Object deptPage(@RequestParam Map paramMap){
			Map map=new HashMap();
			//总数量
			map.put("total", deptService.getPageCount(paramMap));
			//分页查询的结果
			map.put("rows", deptService.getPage(paramMap));
			return map;
		}
		/**
		 * 部门添加
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/add")
		public Object deptAdd(@RequestParam Map paramMap){
			int deptAdd=deptService.deptAdd(paramMap);
			Map map=new HashMap();
			if (deptAdd==0) {
				map.put("showInfo","添加失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","添加成功");
			}
			return map;
		}
		/**
		 * 部门编辑
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/update")
		public Object deptUpd(@RequestParam Map paramMap){
			Map map=new HashMap();
			if(paramMap.get("deptno").toString().equals("D2018100999")){
				map.put("showInfo","超级权限不可更改");
				return map;
			}
			int deptUpd=deptService.deptUpd(paramMap);
			
			if (deptUpd==0) {
				map.put("showInfo","编辑失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","编辑成功");
			}
			return map;
		}
		/**
		 * 部门删除
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/delete")
		public Object deptDel(@RequestParam Map paramMap){
			int deptDel=deptService.deptDel(paramMap);
			Map map=new HashMap();
			if (deptDel==0) {
				map.put("showInfo","删除失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","删除成功");
			}
			return map;
		}
		/**
		 * 表单唯一性验证
		 * @param deptno
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/required")
		public Object deptno(@RequestParam Map map){
			List<Map<String, Object>> showOne = deptService.getPage(map);
			if(showOne!=null&&showOne.size()>0){
				return false;
			}
			return true;	
		}
}
