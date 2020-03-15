/**
 * 
 */
package com.aaa.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aaa.entity.Person;
import com.aaa.service.PersonService;
import com.aaa.util.AESUtil;




/***
 *@className:ReserveController.java
 *@discripton:前台
 *@author:CZP
 *@createTime:2018-10-11下午2:21:40
 *@version:
 */

@Controller
@SuppressWarnings("all")
public class ReserveController {
	
	@Autowired
	private PersonService personService;
	/**
	 * 转发至首页
	 * @return
	 */
	/*@RequestMapping("index")
	public String index(){
		return "forward:/WEB-INF/index.jsp";
	}*/
	/**
	 * 转发至个人中心
	 * @return
	 */
	@RequestMapping("person")
	public String person(@RequestParam Map map,String id, 
			HttpServletRequest request,HttpSession session){
		String account = (String) session.getAttribute("user");
		int row = personService.updateByOrderid(id);
		List<Map<String, Object>> person = personService.selectsqlByAccount(account);
		if(person.size()>0){
			request.setAttribute("person", person);
			return "reception/person";
		}else{
			return "reception/person";
		}
	}
	/**
	 * 转发至房间页面
	 * @return
	 */
	@RequestMapping("room")
	public String Room(HttpServletRequest request){
		//查询所有空闲状态房间
		List<Map<String,Object>> room=personService.selectRoom();
		//将房间类型传入房间页面
		request.setAttribute("room", room);
		return "reception/room";
	}
	/**
	 * 转发至预定页面
	 * @return
	 */
	@RequestMapping("reservation1")
	public String reservation1(HttpServletRequest request){
		//查询所有空闲状态房间
		List<Map<String,Object>> room=personService.selectRoom();
		//将房间类型传入预定页面
		request.setAttribute("room", room);
		return "reception/reservation";
	}
	/**
	 * 转发至画廊
	 * @return
	 */
	@RequestMapping("gallery")
	public String gallery(){
		return "reception/gallery";
	}
	/**
	 * 转发至登陆页面
	 * @return
	 */
	@RequestMapping("loginforword")
	public String UserLogin(HttpSession session){
		//清除seession
		session.removeAttribute("user");
		return "reception/login";
	}
	/**
	 * 转发至注册页面
	 * @return
	 */
	@RequestMapping("register1")
	public String register(){
		return "reception/register";
	}
	/**
	 * 
	 * 转发至提交订单
	 * @return
	 */
	@RequestMapping("reservation")
	public String selectRoom(@RequestParam Map map,HttpServletRequest request,HttpSession session){
		String account=(String) map.get("account");
		String tempPassword=(String) map.get("password");
		//密码加密
		String password = AESUtil.getInstance().encrypt(tempPassword);

		
		Person p=new Person();
		p.setAccount(account);
		p.setPassword(password);
		//根据用户手机号和密码查询用户
		List<Map<String,Object>> list=personService.selectsqlByNameAndPassword(p);

		if (list.size()!=0) {
			//添加session
			session.setAttribute("user", account);
			List<Map<String,Object>> room=personService.selectRoom();
			//将房间类型传入预定页面
			request.setAttribute("room", room);
			return "reception/reservation";
		}else{
			request.setAttribute("msg", "用户名或密码输入错误，请重新输入！");
			return "reception/login";
		}	
	}
	/**
	 * 提交预定订单
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping("reserve")
	public String reserve(@RequestParam Map map,HttpServletRequest request){
		//手机号
		String account=(String) map.get("account");
		//房间类型
		String roomtype1=(String) map.get("roomtype");
		//获取某一字符在字符串中的下标
		int index =roomtype1.indexOf("每");
		//这里根据下标截取字符串
		String roomtype = roomtype1.substring(0,index);
		//姓名
		String cusName=(String) map.get("cusName");
		//证件类型
		//String idcardtype=(String) map.get("idcardtype");
		//性别
		//String sex=(String) map.get("sex");
		//证件号
		//String cusidcard=(String) map.get("cusidcard");
		//预定开始时间
		String beginTime=(String) map.get("beginTime");
		//预定天数
		int days=Integer.valueOf((String) map.get("days"));
		//人数
		int cusnumber=Integer.valueOf((String) map.get("cusnumber"));
		//房间总价
		int roompricesum=Integer.valueOf((String) map.get("roompricesum"));
		//顾客要求   remarks
		String remarks=(String) map.get("remarks");

		Person p=new Person();
		p.setAccount(account);
		//p.setCusex(sex);
		//p.setCusidcard(cusidcard);
		p.setCusName(cusName);
		//p.setIdcardtype(idcardtype);
		p.setRoomtype(roomtype);
		p.setBeginTime(beginTime);
		p.setDays(days);
		p.setCusnumber(cusnumber);
		p.setRoompricesum(roompricesum);
		p.setRemarks(remarks);

		int row=personService.update(p);    
		if (row==1) {
			return "reception/page-404";
		}else{
			request.setAttribute("msg", "网络连接错误，请联系管理员！");
			return "reception/reserve";
		}
	}
	/**
	 * 新用户注册
	 * 
	 */
	@RequestMapping("register2")
	private String register(@RequestParam Map map,HttpServletRequest request){
		
		String account=(String) map.get("account");
		String tempPassword=(String) map.get("passwd");
		String password = AESUtil.getInstance().encrypt(tempPassword);

		Person p=new Person();
		p.setAccount(account);
		p.setPassword(password);
		List<Map<String, Object>> list=personService.selectsqlByName(p);

		if (list.size()>0){
			request.setAttribute("msg", "该用户已经存在！");
			return "reception/register";
		}else{
		personService.insert(p);
		request.setAttribute("msg", "恭喜你注册成功！");
		return "reception/login";
		}
	}
}





