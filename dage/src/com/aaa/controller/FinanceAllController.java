/**
 * 
 */
package com.aaa.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.FinanceAllService;

/***
 *@className:FinnanceAll.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-20上午10:23:50
 *@version:
 */
@Controller
@RequestMapping("/financeAll")
@SuppressWarnings("all")
public class FinanceAllController {
	@Autowired
	private FinanceAllService  FinanceAllService;
	
	/**
	 * 获取模拟数据
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/edata")
	public Object getEchartsData(@RequestParam Map map){
		
		return FinanceAllService.getEChartsData(map);
	}
	/**
	 * 导出Excel表
	 * @return
	 */
	@RequestMapping("/echartDataExp")
	public String echartDataExp(Model model,@RequestParam Map map){
		model.addAttribute("dataList",  FinanceAllService.getEChartsData(map));
		return "finance/financeExl";
	}
	/**
	 * 跳转财务汇总界面
	 */
	@RequestMapping("/showfinance")
	public String ShowFinance(){
		return "finance/financeAll";
	}
	/**
	 * 跳转到财务统计界面
	 */
	@RequestMapping("/showfinanceAccount")
	public String ShowFinanceAccount(){
		return "finance/financeCount";
	}
	/**
	 * 财务汇总数据
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Map GetFinanceAll(@RequestParam Map paramsMap){
		Map map= new HashMap();
		//分页查询总数量
		map.put("total", FinanceAllService.getPageCount(paramsMap));
		//分页查询结果
		map.put("rows", FinanceAllService.getPage(paramsMap));
		
		return map;
	}
}
