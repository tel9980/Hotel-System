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
import com.aaa.service.StoreoutService;

/***
 * @className:StoreController.java
 * @Discription:
 * @author:NingZhang
 * @createTime:2018-9-30上午10:53:05
 * @version:
 */
@Controller
@SuppressWarnings("all")
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private StoreoutService storeoutService;

	@Autowired
	private PurchaseStoreService purchaseStoreService;

	/**
	 * 跳转到显示商品界面
	 * 
	 * @return
	 */
	@RequestMapping("/show")
	public String showStoreout() {
		return "store/showStore";
	}

	/**
	 * 分页显示商品
	 * 
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object storePage(@RequestParam Map paramMap) {

		Map map = new HashMap();
		// 总数量
		map.put("total", storeService.getPageCount(paramMap));
		// 分页查询结果
		map.put("rows", storeService.getPage(paramMap));
		return map;
	}

	/**
	 * 增加商品
	 * 
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object addStore(@RequestParam Map paramsMap) {

		Map map = new HashMap();

		int row = storeService.addStore(paramsMap);
		if (row == 0) {
			map.put("showInfo", "添加失败");
		} else {
			map.put("showInfo", "添加成功");
			map.put("suc", "true");
		}
		return map;

	}

	/**
	 * 更新商品信息
	 * 
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object updateStore(@RequestParam Map paramsMap) {
		Map map = new HashMap();
		int row = storeService.updateStore(paramsMap);
		if (row == 0) {
			map.put("showInfo", "更新失败");
		} else {
			map.put("showInfo", "更新成功");
			map.put("suc", "true");
		}

		return map;

	}

	/**
	 * 单个商品出库
	 * 
	 * @param paramsMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/out")
	public Object outputStore(@RequestParam Map paramsMap) {
		Map map = new HashMap();
		List<Map<String, Object>> list = storeService.getListById(Integer.valueOf(paramsMap.get("goodsid") + ""));
		int n1 = Integer.valueOf(list.get(0).get("goodsnum") + "");
		int n2 = Integer.valueOf((String) paramsMap.get("goodsnum" + ""));
		if (n1 - n2 >= 0) {
			int num = n1 - n2;
			list.get(0).remove("goodsnum");
			list.get(0).put("goodsnum", num);
			int row = storeService.outPutStore(list.get(0));
			if (row == 0) {
				map.put("showInfo", "出库失败");
			} else {
				map.put("showInfo", "出库成功");
				storeoutService.addStore(paramsMap);
				map.put("suc", "true");
			}
		} else {
			map.put("showInfo", "出库失败,出库数量大于库存数量");
		}

		return map;

	}

	/**
	 * 单个采购方法
	 * 
	 * @param paramsMap
	 * @return
	 */

	@ResponseBody
	@RequestMapping("/onepurchase")
	public Object purchaseone(Store store) {
		Map map = new HashMap();
		//根据商品id,查出商品信息
		List<Map<String, Object>> list = storeService.getListById(store.getGoodsid());
		store.setInprice(Integer.valueOf(list.get(0).get("inprice") + ""));
		store.setSuplieer(list.get(0).get("suplieer") + "");
		store.setSuptel(list.get(0).get("suptel") + "");
		int row = purchaseStoreService.addStore(store);
		if (row == 0) {
			map.put("showInfo", "申请采购失败");
		} else {
			map.put("showInfo", "申请采购成功");
			map.put("suc", "true");
		}
		return map;

	}

	/**
	 * 根据商品id删除商品
	 * 
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Object deleteStore(Integer goodsid) {
		int row = storeService.delStoreById(goodsid);
		Map map = new HashMap();
		if (row == 0) {
			map.put("errorMsg", "删除失败");
		} else {
			map.put("suc", "true");
		}
		return map;
	}

	/**
	 * 获取商品信息,多批处理时,下拉框选择,使信息显示在input框中
	 * 
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStore")
	public Object getStore(String goodsid) {
		if (goodsid == null) { // 商品ID为空，查询全部
			List<Map> goodsList = new ArrayList<Map>();
			List<Map<String, Object>> list = storeService.getList();
			return list;
		} else {
			List<Map<String, Object>> map = storeService.getListById(Integer.valueOf(goodsid));
			return map.get(0);
		}
	}

	/**
	 * 商品多批采购
	 * 
	 * @param goodsL
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/purchase")
	public Object orderAdd(StoresList goodsL) {
		int row = 0;
		Map map = new HashMap();
		List<Store> goodsList = goodsL.getGoodsList();
		if (goodsList != null && goodsList.size() > 0) {
			for (Store goods : goodsList) {
				List<Map<String, Object>> list = storeService.getListById(goods.getGoodsid());
				goods.setInprice(Integer.valueOf(list.get(0).get("inprice")+ ""));
				goods.setSuplieer(list.get(0).get("suplieer") + "");
				goods.setSuptel(list.get(0).get("suptel") + "");
				goods.setGoodsname(list.get(0).get("goodsname") + "");
				row = purchaseStoreService.addStore(goods);
			}
		}
		if (row == 0) {
			map.put("showInfo", "申请失败");
		} else {
			map.put("showInfo", "申请成功");
			map.put("suc", "true");

		}

		return map;

	}

	/**
	 * 商品多批出库
	 * 
	 * @param goodsL
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/output")
	public Object outPut(StoresList goodsL) {
		Map map = new HashMap();
		List<Store> goodsList = goodsL.getGoodsList();
		if (goodsList != null && goodsList.size() > 0) {
			for (Store goods : goodsList) {
				List<Map<String, Object>> list = storeService.getListById(goods.getGoodsid());
				int n1 = Integer.valueOf(list.get(0).get("goodsnum") + "");
				int n2 = goods.getInnum();
				if (n1 - n2 >= 0) {
					int num = n1 - n2;
					list.get(0).remove("goodsnum");
					list.get(0).put("goodsnum", num);
					int row = storeService.outPutStore(list.get(0));
					if (row == 0) {
						map.put("showInfo", "出库失败");
					} else {
						map.put("showInfo", "出库成功");
						goods.setGoodsname(list.get(0).get("goodsname") + "");
						storeoutService.addAllStore(goods);
						map.put("suc", "true");
					}
				} else {
					map.put("showInfo", "出库失败,出库数量大于库存数量");

				}
			}
		}
		return map;
	}

	/**
	 * 表单唯一性验证
	 * 
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/required")
	public Object required(@RequestParam Map map) {
		List<Map<String, Object>> showOne = storeService.getPage(map);

		if (showOne != null && showOne.size() > 0) {
			return false;
		}
		return true;
	}

	/**
	 * 获得房间消费品
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getRoomUse")
	public Object getRoomUse() {
		return storeService.getRoomUse();

	}
}
