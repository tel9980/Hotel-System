package com.aaa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.StoreLossService;
import com.aaa.service.StoreService;



/***
 *@className:StoreLossController.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11下午7:23:04
 *@version:
 */
@Controller
@SuppressWarnings("all")
@RequestMapping("/storeLoss")
public class StoreLossController {
	@Autowired
	private StoreLossService storeLossService;
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/loss")
	public String  showStoreout(){
		return "store/storeLoss";
	}
	
	@ResponseBody//让该方法的返回值为json 相当于servlet response.getWrite(),print(json)
	@RequestMapping("/list")
	public Object getList(){
		Map map=new HashMap();
		map.put("rows",storeLossService.getList());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/page")
	public Object userPage(@RequestParam Map paramMap) {
		Map map=new HashMap();
		//总数量
		map.put("total", storeLossService.getPageCount(paramMap));
		//分页查询结果
		map.put("rows",storeLossService.getPage(paramMap));
		return map;
	}
	/**
	 * 添加损耗商品
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object addStore(@RequestParam Map paramsMap){
		
			Map map=new HashMap();
			List<Map<String,Object>> list=storeService.getListById(Integer.valueOf((paramsMap.get("goodsid")+"")));
			Integer n1=Integer.valueOf(list.get(0).get("goodsnum")+"");
			Integer n2=Integer.valueOf(paramsMap.get("goodsnum")+"");
			Integer n3=n1-n2;
			if(n3>=0){
				int row=storeLossService.addStore(paramsMap);
				if(row==0){
					map.put("showInfo", "添加失败");
				}else{
					paramsMap.remove("goodsnum");
					paramsMap.put("goodsnum", n3);
					int row1=storeService.outPutStore(paramsMap);
					if(row1==0){
						map.put("showInfo", "添加失败");
					}else{
						map.put("showInfo", "添加成功");
						map.put("suc", "true");
					}
				}
			}else{
				map.put("showInfo", "添加失败,库存量小于损耗量");
			}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Object updateStore(@RequestParam Map paramsMap){
		int row=storeLossService.updateStore(paramsMap);
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
		
		int row=storeLossService.delStoreById(goodsid);
		Map map=new HashMap();
		if(row==0){
			map.put("errorMsg", "删除失败");
		}else{
			map.put("suc", "true");
		}
		return map;
	}
}


