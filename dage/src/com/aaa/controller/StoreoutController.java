package com.aaa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.StoreoutService;



/***
 *@className:StoreoutCoutroller.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午1:20:22
 *@version:
 */
@Controller
@SuppressWarnings("all")
@RequestMapping("/storeout")
public class StoreoutController {
	
	@Autowired
	private StoreoutService storeoutService;
	
	@RequestMapping("/out")
	public String  showStoreout(){
		return "store/storeout";
	}
	
	@ResponseBody//让该方法的返回值为json 相当于servlet response.getWrite(),print(json)
	@RequestMapping("/list")
	public Object getList(){
		Map map=new HashMap();
		map.put("rows",storeoutService.getList());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/page")
	public Object userPage(@RequestParam Map paramMap) {
		
		
		Map map=new HashMap();
		//总数量
		map.put("total", storeoutService.getPageCount(paramMap));
		//分页查询结果
		map.put("rows",storeoutService.getPage(paramMap));
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public Object addStore(@RequestParam Map paramsMap){
		
		int row=storeoutService.addStore(paramsMap);
		List<Map<String,Object>> list=storeoutService.getListById(Integer.valueOf(paramsMap.get("goodsid")+""));
		System.out.println(list.get(0).get("goodsnum"));
		Map map=new HashMap();
		if(row==0){
			map.put("showInfo", "添加失败");
		}else{
			map.put("showInfo", "添加成功");
			map.put("suc", "true");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Object updateStore(@RequestParam Map paramsMap){
		int row=storeoutService.updateStore(paramsMap);
		Map map=new HashMap();
		if(row==0){
			map.put("showInfo", "修改失败");
		}else{
			map.put("showInfo", "修改成功");
			map.put("suc", "true");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public Object deleteStore(Integer goodsid){
		
		int row=storeoutService.delStoreById(goodsid);
		Map map=new HashMap();
		if(row==0){
			map.put("errorMsg", "删除失败");
		}else{
			map.put("suc", "true");
		}
		return map;
	}
}


