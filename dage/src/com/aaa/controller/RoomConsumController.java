/**
 * 
 */
package com.aaa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.RoomConsumService;

/***
 *@className:RoomConsumController.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-12下午10:13:38
 *@version:
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("roomConsumController")
public class RoomConsumController {
	@Autowired
	private RoomConsumService RoomConsumService;
	/**
	 * 跳转房间消费记录页面
	 * @return
	 */
	@RequestMapping("/list")
	public String  showHome(){
		return "room/roomconsum";
	}
	/**
	 * 获取房间消费分页数据
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object getUserPage(@RequestParam Map paramsMap){
		Map map= new HashMap();
		//分页查询总数量
		map.put("total", RoomConsumService.getPageCount(paramsMap));
		//分页查询结果
		map.put("rows", RoomConsumService.getPage(paramsMap));
		return map;
	}
	/**
	 * 房间消费数据     添加
	 * @param paramsmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Map add(@RequestParam Map paramsmap){
		int addUser = RoomConsumService.addRoomConsum(paramsmap);
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
	 * 房间消费数据  更新
	 * @param paramsmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Map update(@RequestParam Map paramsmap){
		int updateUser = RoomConsumService.updateRoomConsum(paramsmap);
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
	 * 房间消费数据删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delete")
	public Map delete(Integer id){
		int delUser = RoomConsumService.delRoomConsum(id);
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

}
