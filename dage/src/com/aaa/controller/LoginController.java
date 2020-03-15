/**
 * 
 */
package com.aaa.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.EmpService;
import com.aaa.util.AESUtil;

/***
 *@className:LoginController.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-13上午9:33:45
 *@version:
 */
@Controller
@SuppressWarnings("all")
public class LoginController {
	@Autowired
	private EmpService empService;
	
	/**
	 * 登录  建立session
	 * @param map
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public String userLogin(@RequestParam Map<String,String> map,HttpSession session){
		String password = map.get("password")+"";
		String encrypt = AESUtil.getInstance().encrypt(password);
		map.put("password", encrypt);
		List<Map<String,Object>> row = empService.getEmpByEmptelAndPassword(map);
			if(row!=null&&row.size()>0){
				session.setAttribute("emptel", row.get(0));
				return "success";
			}else{
				return "usererror";
			}
		
		
	}
	/**
	 * 前台界面跳转
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex(){
		return "index";
	}
	/**
	 * 退出  清空session  防止拦截器不起作用
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){
		//注销session
		session.invalidate();
		return "redirect:/backlogin.jsp";
	}
}
