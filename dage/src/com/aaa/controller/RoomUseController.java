/**
 * 
 */
package com.aaa.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.aaa.service.RoomUseService;
//import com.sun.xml.internal.ws.api.FeatureConstructor;

/***
 *@className:FinanceController.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-8下午3:26:52
 *@version:
 */
@Controller
@SuppressWarnings("all")
@RequestMapping("/roomUseController")
public class RoomUseController {
	@Autowired
	private RoomUseService userService;
	/**
	 * 跳转 房间总消费页面
	 * @return
	 */
	@RequestMapping("/roomUse")
	public String  showHome(){
		return "finance/roomUse";
	}
	/**
	 * 获取房间入住消费和商品消费分页数据 
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object getUserPage(@RequestParam Map paramsMap){
		
		
		Map map= new HashMap();
		//分页查询总数量
		map.put("total", userService.getPageCount(paramsMap));
		//分页查询结果
		map.put("rows", userService.getPage(paramsMap));
		return map;
	}
	/**
	 * 添加
	 * @param paramsmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Map add(@RequestParam Map paramsmap){
		int addUser = userService.addUser(paramsmap);
		Map map= new HashMap();
		if(addUser==0){
		map.put("errorinfo", "添加失败！！！");
		}
		else{
			map.put("suc", "true");
			map.put("errorinfo", "添加成功！！！");
		}
		return map;
	}
	/**
	 * 更新
	 * @param paramsmap
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping("/update")
	public Map update(@RequestParam Map paramsmap){
		int updateUser = userService.updateUser(paramsmap);
		Map map= new HashMap();
		if(updateUser==0){
		map.put("errorinfo", "更新失败！！！");
		}
		else{
			map.put("suc", "true");
			map.put("errorinfo", "更新成功！！！");
		}
		return map;
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public Map delete(Integer id){
		int delUser = userService.delUser(id);
		Map map= new HashMap();
		if(delUser==0){
		map.put("errorMsg", "删除失败！！！");
		}
		else{
			map.put("success", "true");
			map.put("errorMsg", "删除成功！！！");
		}
		return map;
	}
	/**
	 * 获取收入当天收入数据详情
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pag")
	public Object getUsePage(@RequestParam Map paramsMap){
		
		return userService.getDayFinance(paramsMap);
	}
	
}
