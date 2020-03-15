package com.aaa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.RoomChangeService;

@Controller
@RequestMapping("/change")
@SuppressWarnings("all")
public class RoomChangeController {
	@Autowired
	private RoomChangeService roomChangeService;
	/**
	 * 跳转到jsp页面
	 * @return
	 */
	@RequestMapping("/showjsp")
	public Object showjsp(){
		return "room/changepage";
	}
	/**
	 * 分页查询
	 * @param pmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/show")
	public Object show(@RequestParam Map pmap){
		Map map = new HashMap();
//		System.out.println(111);
		map.put("total", roomChangeService.getCount(pmap));
		map.put("rows", roomChangeService.showLimit(pmap));
		return map;	
	}
}
