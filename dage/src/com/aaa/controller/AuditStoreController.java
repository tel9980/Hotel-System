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
import com.aaa.service.AuditStoreService;
import com.aaa.service.StoreService;
import com.aaa.service.StoreinService;



/***
 *@className:AuditStoreController.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-10-12上午9:02:30
 *@version:
 */
@SuppressWarnings("all")
@RequestMapping("auditStore")
@Controller
public class AuditStoreController {
	@Autowired
	private AuditStoreService auditStoreService;
	/**
	 * 跳转链接
	 * @return
	 */
	@RequestMapping("/audit")
	public String  showStoreout(){
		return "finance/auditStore";
	}
	/**
	 * 分页查询
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object userPage(@RequestParam Map paramMap) {
		Map map=new HashMap();
		//总数量
		map.put("total", auditStoreService.getPageCount(paramMap));
		//分页查询结果
		map.put("rows",auditStoreService.getPage(paramMap));
		return map;
	}
	
	/**
	 * 驳回请求
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/reject")
	public Object rejectApply(@RequestParam Map paramMap){
		int row=auditStoreService.rejectApply(paramMap);
		Map map=new HashMap();
		if(row==0){
			map.put("showInfo", "驳回失败");
		}else{
			map.put("suc","true");
			map.put("showInfo", "已驳回");
		}
		return map;
	}
	/**
	 * 通过请求
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pass")
	public Object passApply(@RequestParam Map paramMap){
		int audit=auditStoreService.passApply(paramMap);
		Map map=new HashMap();
		if(audit==0){
			map.put("showInfo", "通过失败");
		}else{
			map.put("suc","true");
			map.put("showInfo", "已通过");
		}
		return map;
	}
}

