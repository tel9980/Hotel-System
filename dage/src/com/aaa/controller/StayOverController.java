/**
 * 
 */
package com.aaa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Customer;
import com.aaa.entity.CustomerList;
import com.aaa.service.NowRegisterService;
import com.aaa.service.StayOverService;


/***
 *@className:StayOverController.java
 *@Discriptron:
 *@author:chenMin
 *@createTime:2018-10-16下午6:46:46
 *@version:
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("stayOverController")
public class StayOverController {
	@Autowired
	private StayOverService stayOverService;
	@Autowired
	private NowRegisterService nowRegisterService;
	@RequestMapping("/list")
	public String  showHome(){
		return "room/stayover";
	}
	@ResponseBody
	@RequestMapping("/page")
	public Object getPage(@RequestParam Map paramsMap){
		Map map= new HashMap();
		//分页查询总数量
		map.put("total", stayOverService.getPageCount(paramsMap));
		//分页查询结果
		map.put("rows", stayOverService.getPage(paramsMap));
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public Map add(@RequestParam Map paramsmap){
		int addUser = stayOverService.addStayOver(paramsmap);
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
	 * 续住操作    1.往续住表添加信息   2.更改当前入住信息表中的住房天数  
	 * @param map
	 * @param customers
	 * @return
	 */
	@RequestMapping("/stay")
	public Object stay(@RequestParam Map map,CustomerList customers){
		List<Customer> customerList = customers.getCustomerList();
		for (Customer customer : customerList) {
			map.put("cusname", customer.getCusname());
			map.put("cussex", customer.getCussex());
			map.put("custel", customer.getCustel());
			map.put("idcardtype", customer.getIdcardtype());
			map.put("idcard", customer.getIdcard());
			stayOverService.addStayOver(map);
		}
		Integer days = Integer.valueOf(map.get("days")+"");
		Integer staydays = Integer.valueOf(map.get("staydays")+"");
		Integer price = Integer.valueOf(map.get("roomprice")+"");
		//System.out.println(days+staydays);
		//System.out.println(map.get("roomid"));
		nowRegisterService.updatedays(days+staydays, Integer.valueOf(map.get("roomid")+""),(days+staydays)*price);
		return "redirect:/roomController/show.do";
	}
	
}
