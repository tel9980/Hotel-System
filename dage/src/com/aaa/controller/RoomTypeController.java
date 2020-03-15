package com.aaa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.RoomTypeService;

@Controller
@RequestMapping("/roomtype")
public class RoomTypeController {
	@Autowired
	private RoomTypeService roomTypeService;
	
	@RequestMapping("/jsp")
	public Object jsp(){
		return "room/roomtype";
	}
	/**
	 * 展示所有
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/showall")
	public Object showall(){
		return roomTypeService.show();
	}
	/**
	 * 获取单个类型的信息
	 * @param roomtype
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/showone")
	public Object showone(String roomtype){
		return roomTypeService.showOne(roomtype);
	}
	/**
	 * 分页显示
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/show")
	public Object pagelist(@RequestParam Map pmap){
		Map map = new HashMap();
//		System.out.println(111);
		map.put("total", roomTypeService.getcount(pmap));
		map.put("rows", roomTypeService.showLimit(pmap));
		return map;	
	}
	/**
	 * 房间类型添加
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object deptAdd(@RequestParam Map paramMap){
		int deptAdd=roomTypeService.add(paramMap);
		//System.out.println(paramMap);
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
	 * 房间类型编辑
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object update(@RequestParam Map paramMap){
		Map map=new HashMap();
		int deptUpd=roomTypeService.update(paramMap);
		
		if (deptUpd==0) {
			map.put("showInfo","编辑失败");
		}else{
			map.put("suc","true");
			map.put("showInfo","编辑成功");
		}
		return map;
	}
}
