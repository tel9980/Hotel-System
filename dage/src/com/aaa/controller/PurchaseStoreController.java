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
import com.aaa.service.PurchaseStoreService;
import com.aaa.service.StoreService;
import com.aaa.service.StoreinService;



/***
 *@className:PurchaseStoreController.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午9:02:30
 *@version:
 */
@SuppressWarnings("all")
@RequestMapping("purchaseStore")
@Controller
public class PurchaseStoreController {
	@Autowired
	private PurchaseStoreService purchaseStoreService;
	@Autowired
	private StoreinService storeinService;
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/purchase")
	public String  showStoreout(){
		return "store/purchaseStore";
	}
	
	@ResponseBody//让该方法的返回值为json 相当于servlet response.getWrite(),print(json)
	@RequestMapping("/list")
	public Object getList(){
		Map map=new HashMap();
		map.put("rows",purchaseStoreService.getList());
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
		map.put("total", purchaseStoreService.getPageCount(paramMap));
		//分页查询结果
		map.put("rows",purchaseStoreService.getPage(paramMap));
		return map;
	}
	
	/**
	 * 单个采购商品
	 * @param store
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object updateStore(Store store){
		
		Map map=new HashMap();
		
		List<Map<String,Object>> list=storeService.getListById(store.getGoodsid());
		store.setInprice(Integer.valueOf(list.get(0).get("inprice")+""));
		store.setSuplieer(list.get(0).get("suplieer")+"");
		store.setSuptel(list.get(0).get("suptel")+"");
			int row=purchaseStoreService.updateStore(store);
			if(row==0){
				map.put("showInfo", "采购失败");
			}else{
				int row2=storeinService.addStore(store);
				if(row2==0){
					map.put("showInfo", "采购失败");
				}else{
					map.put("showInfo", "采购成功");
					map.put("suc", "true");
				}
			}
		
		return map;
	}
	
	/**
	 * 删除页面采购信息
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object deleteStore(Integer goodsid){
		
		int row=purchaseStoreService.delStoreById(goodsid);
		Map map=new HashMap();
		if(row==0){
			map.put("errorMsg", "删除失败");
		}else{
			map.put("suc", "true");
		}
		return map;
	}
	
	
	
	
	/**
	 * 获得采购商品信息
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStore")
	public Object getStore(String sid){
		
		if(sid==null){  //商品ID为空，查询全部
			List<Map>  goodsList = new  ArrayList<Map>();
			List<Map<String, Object>> list=purchaseStoreService.getList();
			return list;
		}else{
			List<Map<String,Object>> map=purchaseStoreService.getListById(Integer.valueOf(sid));
			return map.get(0);
		}
	}
	
	/**
	 * 批量采购
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
				List<Map<String,Object>> list=purchaseStoreService.getListById(goods.getSid());
				Integer goodsid=Integer.valueOf((list.get(0).get("goodsid")+""));
				goods.setGoodsid(goodsid);
				goods.setGoodsname(list.get(0).get("goodsname")+"");
				goods.setInprice(Integer.valueOf(list.get(0).get("inprice")+""));
				goods.setSuplieer(list.get(0).get("suplieer")+"");
				goods.setSuptel(list.get(0).get("suptel")+"");
				    int row=purchaseStoreService.updateStore(goods);
					if(row==0){
						map.put("showInfo", "采购失败");
					}
					else{
					map.put("showInfo", "采购成功");
					
					storeinService.addStore(goods);
					map.put("suc", "true");
					}
				}
			}
				return map;
				
			}
	/**
	 * 获取财务汇总后收入详情数据
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pag")
	public Object usePage(@RequestParam Map paramMap) {
		return purchaseStoreService.getFinance(paramMap);
	}
}

