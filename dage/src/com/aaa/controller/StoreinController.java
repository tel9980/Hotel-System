package com.aaa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Store;
import com.aaa.entity.StoresList;
import com.aaa.service.StoreService;
import com.aaa.service.StoreinService;


/***
 *@className:StoreinController.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-11上午10:49:31
 *@version:
 */

@Controller
@SuppressWarnings("all")
@RequestMapping("/storein")
public class StoreinController {
	
	@Autowired
	private StoreinService storeinService;
	@Autowired
	private StoreService storeService;
	@RequestMapping("/in")
	public String  showStoreout(){
		return "store/Storein";
	}
	
	@ResponseBody//让该方法的返回值为json 相当于servlet response.getWrite(),print(json)
	@RequestMapping("/list")
	public Object getList(){
		Map map=new HashMap();
		map.put("rows",storeinService.getList());
		return map;
	}
	
	/**
	 * 分页展示
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object userPage(@RequestParam Map paramMap) {
		
		
		Map map=new HashMap();
		//总数量
		map.put("total", storeinService.getPageCount(paramMap));
		//分页查询结果
		map.put("rows",storeinService.getPage(paramMap));
		return map;
	}
	
	
	/**
	 * 商品入库
	 * @param store
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object updateStore(Store store){
		int row=storeinService.updateStore(store);
		Map map=new HashMap();
		if(row==0){
			map.put("showInfo", "入库失败");
		}else{
			Integer innum=Integer.valueOf(store.getInnum());
			List<Map<String,Object>> list=storeService.getListById(Integer.valueOf(store.getGoodsid()));
			
			Integer goodsnum=(Integer) list.get(0).get("goodsnum");
			goodsnum+=innum;
			store.setGoodsnum(goodsnum);
			int row2=storeService.inputStore(store);
			if(row2==1){
				map.put("showInfo", "入库成功");
				map.put("suc", "true");
			}else{
				map.put("showInfo", "入库失败");
			}
		}
		return map;
	}
	/**
	 * 删除信息
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object deleteStore(Integer goodsid){
		
		int row=storeinService.delStoreById(goodsid);
		Map map=new HashMap();
		if(row==0){
			map.put("errorMsg", "删除失败");
		}else{
			map.put("suc", "true");
		}
		return map;
	}
	
	/**
	 * 获得入库商品信息
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStore")
	public Object getStore(String sid){
		
		if(sid==null){  //商品ID为空，查询全部
			List<Map>  goodsList = new  ArrayList<Map>();
			List<Map<String, Object>> list=storeinService.getList();
			return list;
		}else{
			List<Map<String,Object>> map=storeinService.getListById(Integer.valueOf(sid));
			return map.get(0);
		}
	}
	/**
	 * 批量入库
	 * @param goodsL
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/input")
	public Object orderAdd(StoresList goodsL){
		

		//调用后台服务层，添加订单
		
		Map map=new HashMap();
		List<Store> goodsList = goodsL.getGoodsList();
	
		if(goodsList!=null&&goodsList.size()>0){
			
			for(Store goods:goodsList){
				
				    int row=storeinService.updateStore(goods);
					if(row==0){
						
						map.put("showInfo", "入库失败");
					}
					else{
						Integer innum=Integer.valueOf(goods.getInnum());
						List<Map<String,Object>> list=storeinService.getListById(goods.getSid());
						List<Map<String,Object>> listone=storeService.getListByName(list.get(0).get("goodsname")+"");
						Integer goodsnum=Integer.valueOf(listone.get(0).get("goodsnum")+"");
						goodsnum+=innum;
						goods.setGoodsnum(goodsnum);
						goods.setGoodsid(Integer.valueOf(listone.get(0).get("goodsid")+""));
						int row2=storeService.inputStore(goods);
						if(row2==1){
							map.put("showInfo", "入库成功");
							map.put("suc", "true");
							
						}else{
							map.put("showInfo", "入库失败");
						}
					}
				}
			}
				return map;
				
			}
}

