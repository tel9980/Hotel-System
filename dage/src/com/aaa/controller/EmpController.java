  package com.aaa.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.EmpService;
import com.aaa.util.AESUtil;


/***
 *@className:DeptController.java
 *@discripton:控制台 融合了增删查改
 *@author:liudaye
 *@createTime:2018-10-5下午5:17:30
 *@version:
 */
@Controller             
@RequestMapping("/empController")
@SuppressWarnings("all")
public class EmpController {
	
	//依赖注入
		@Autowired
		private EmpService empService;
		
		/**
		 * 员工列表
		 * @param model
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/list")
		public Map empList(){
			Map map=new HashMap();
			map.put("rows", empService.getList());
			return map;
		}
		/**
		 * 员工分页
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/emp")
		public Object empPage(@RequestParam Map paramMap) {
			
			Map map=new HashMap();
			//总数量
			map.put("total", empService.getPageCount(paramMap));
			//分页查询的结果
			List<Map<String, Object>> page = empService.getPage(paramMap);
			for (Map<String, Object> map2 : page) {
				String password = map2.get("password")+"";
				String encrypt = AESUtil.getInstance().decrypt(password);
				map2.put("password", encrypt);
			}
			map.put("rows", page);
			return map;
		}
		/**
		 * 员工添加
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/add")
		public Object empAdd(@RequestParam Map paramMap){
			String password = paramMap.get("password")+"";
			String encrypt = AESUtil.getInstance().encrypt(password);
			paramMap.put("password", encrypt);
			int empAdd=empService.empAdd(paramMap);
			Map map=new HashMap();
			if (empAdd==0) {
				map.put("showInfo","添加失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","添加成功");
			}
			return map;
		}
		/**
		 * 员工编辑
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/update")
		public Object empUpd(@RequestParam Map paramMap) {
			String password = paramMap.get("password")+"";
			String encrypt = AESUtil.getInstance().encrypt(password);
			paramMap.put("password", encrypt);
			int empUpd=empService.empUpd(paramMap);
			Map map=new HashMap();
			if (empUpd==0) {
				map.put("showInfo","编辑失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","编辑成功");
			}
			return map;
		}
		/**
		 * 员工删除
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/delete")
		public Object empDel(@RequestParam Map paramMap){
			int empDel=empService.empDel(paramMap);
			Map map=new HashMap();
			if (empDel==0) {
				map.put("showInfo","删除失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","删除成功");
			}
			return map;
		}
		/**
		 * 获取客房部员工信息
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/room")
		public Object roomList(){
			return empService.getEmpByRoom();
		}
		/**
		 * 获取仓管部员工信息
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/store")
		public Object storeList(){
			return empService.getEmpByStore();
		}
		/**
		 * 获取后勤部员工信息
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/serv")
		public Object servList(){
			return empService.getEmpByStore();
		}
		/**
		 * 通过empno获取单条客房信息
		 * @param paramMap
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/roomone")
		public Object one(@RequestParam Map paramMap){
			return empService.getPage(paramMap);
		}
		/**
		 * 表单唯一性验证
		 * @param empno
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/required")
		public Object required(@RequestParam Map map){
			List<Map<String, Object>> showOne = empService.getPage(map);
			if(showOne!=null&&showOne.size()>0){
				return false;
			}
			return true;	
		}
		/**
		 * 下拉框的值列表
		 * @param paramMap
		 * @return
		 */
		@ResponseBody //让该方法的返回值为json 相当于servlet response.getWrite().Print(json)
		@RequestMapping("/checkempname")// 窄化映射请求
		public Object departmentCheckBoxData(@RequestParam Map paramMap) {
			return empService.getPage(paramMap);
		}
}
