package com.aaa.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.RoomService;
import com.aaa.service.RoomservService;


/***
 *@className:DeptController.java
 *@discripton:房间维修控制台 融合了增删查改
 *@author:liudaye
 *@createTime:2018-10-12下午5:17:30
 *@version:
 */
@Controller
@RequestMapping("/servController")
@SuppressWarnings("all")
public class RoomservController {
	//依赖注入
	@Autowired
	private RoomservService servService;
	@Autowired
	private RoomService roomService;
	/*
	 * 跳转房间维修记录页面
	 */
	@RequestMapping("/serv")
	public Object serv(){
		return "room/roomserv";
	}
	/**
	 * 房间维护记录列表
	 * @param model
	 * @return
	 */
	@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
	@RequestMapping("/list")
	public Map roomservList(){
		Map map=new HashMap();
		map.put("rows", servService.getList());
		return map;
	}
	/**
	 * 房间维护记录分页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/roomserv")
	public Object roomservPage(@RequestParam Map paramMap){
		Map map=new HashMap();
		//总数量
		map.put("total", servService.getPageCount(paramMap));
		//分页查询的结果
		map.put("rows", servService.getPage(paramMap));
		return map;
	}
	/**
	 * 房间维护记录添加
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object roomservAdd(@RequestParam Map paramMap){
		int roomservAdd=servService.roomservAdd(paramMap);
		roomService.updateState("维修中",Integer.valueOf(paramMap.get("roomid")+
				"")); 
		Map map=new HashMap();
		if (roomservAdd==0) {
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
	public Object servUpd(@RequestParam Map paramMap){
		int servUpd=servService.servUpd(paramMap);
		Map map=new HashMap();
		if (servUpd==0) {
			map.put("showInfo","编辑失败");
		}else{
			map.put("suc","true");
			map.put("showInfo","编辑成功");
		}
		return map;
	}
}
