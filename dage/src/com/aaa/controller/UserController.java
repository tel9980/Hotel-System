  package com.aaa.controller;


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

import com.aaa.service.UserService;
import com.aaa.util.AESUtil;



/***
 *@className:DeptController.java
 *@discripton:控制台 融合了增删查改
 *@author:liudaye
 *@createTime:2018-10-5下午5:17:30
 *@version:
 */
@Controller             
@RequestMapping("/userController")
@SuppressWarnings("all")
public class UserController {
	
	//依赖注入
		@Autowired
		private UserService userService;
		
		/**
		 * 员工列表
		 * @param model
		 * @return
		 */
		@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
		@RequestMapping("/list")
		public Map userList(){
			Map map=new HashMap();
			map.put("rows", userService.getList());
			return map;
		}
		/**
		 * 员工分页
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/user")
		public Object userPage(@RequestParam Map paramMap){
			Map map=new HashMap();
			//总数量
			map.put("total", userService.getPageCount(paramMap));
			//分页查询的结果
			map.put("rows", userService.getPage(paramMap));
			return map;
		}
		/**
		 * 会员添加
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/add")
		public Object userAdd(@RequestParam Map paramMap){
			String password = paramMap.get("password")+"";
			String encrypt = AESUtil.getInstance().encrypt(password);
			paramMap.put("password", encrypt);
			int userAdd=userService.userAdd(paramMap);
			Map map=new HashMap();
			if (userAdd==0) {
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
		public Object userUpd(@RequestParam Map paramMap){
			String password = paramMap.get("password")+"";
			String encrypt = AESUtil.getInstance().encrypt(password);
			paramMap.put("password", encrypt);
			int userUpd=userService.userUpd(paramMap);
			Map map=new HashMap();
			if (userUpd==0) {
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
		public Object userDel(@RequestParam Map paramMap){
			int userDel=userService.userDel(paramMap);
			Map map=new HashMap();
			if (userDel==0) {
				map.put("showInfo","删除失败");
			}else{
				map.put("suc","true");
				map.put("showInfo","删除成功");
			}
			return map;
		}
		/**
		 * 表单唯一性验证
		 * @param userno
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/required")
		public Object userno(@RequestParam Map map){
			List<Map<String, Object>> showOne = userService.getPage(map);
			if(showOne!=null&&showOne.size()>0){
				return false;
			}
			return true;	
		}
}
