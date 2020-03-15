package com.aaa.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.RoomLossService;

@Controller
@RequestMapping("roomloss")
@SuppressWarnings("all")
public class RoomLossController {
	@Autowired
	private RoomLossService roomLossService;
	
	/**
	 * 跳转jsp页面
	 * @return
	 */
	@RequestMapping("/show")
	public Object show(){
		return "room/roomloss";	
	}
	/**
	 * 获取roomloss分页数据
	 * @param pmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/list")
	public Object pagelist(@RequestParam Map pmap){
		Map map = new HashMap();
//		System.out.println(111);
		map.put("total", roomLossService.getCount(pmap));
		map.put("rows", roomLossService.showLimit(pmap));
		return map;	
	}
	/**
	 *  往roomloss中添加数据
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object add(@RequestParam Map map){
		map.put("addempid", "1");
		int add = roomLossService.add(map);
		Map mp = new HashMap();
		if(add!=0){
			mp.put("successMsg", "添加成功");
			return mp;
		}else{
			mp.put("errorMsg", "添加失败");
			return mp;
		}		
	}
	/**
	 * 补货确认操作
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object update(@RequestParam Map map,HttpSession session){
		Map m = (Map)session.getAttribute("emptel");
		map.put("addempid", m.get("empname"));
		int add = roomLossService.update(map);
		Map mp = new HashMap();
		if(add!=0){
			mp.put("successMsg", "添加成功");
			return mp;
		}else{
			mp.put("errorMsg", "添加失败");
			return mp;
		}		
	}
}
