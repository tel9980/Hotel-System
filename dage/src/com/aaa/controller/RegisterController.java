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
import com.aaa.entity.RoomGood;
import com.aaa.entity.RoomGoodList;
import com.aaa.service.NowRegisterService;
import com.aaa.service.RegisterService;
import com.aaa.service.RoomAllService;
import com.aaa.service.RoomConsumService;
import com.aaa.service.RoomLossService;
import com.aaa.service.RoomService;

@Controller
@RequestMapping("/register")
@SuppressWarnings("all")
public class RegisterController {
	@Autowired
	private RegisterService registerService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoomConsumService roomConsumService;
	@Autowired
	private NowRegisterService nowRegisterService;
	@Autowired
	private RoomAllService roomAllService;
	@Autowired
	private RoomLossService roomLossService;
	/**
	 * 跳转入住信息统计页面
	 * @return
	 */
	@RequestMapping("/show")
	public Object show(){
		return "register/show";	
	}
	/**
	 * 获取分页数据
	 * @param pmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/list")
	public Object pagelist(@RequestParam Map pmap){
		Map map = new HashMap();
//		System.out.println(111);
		map.put("total", registerService.getCount(pmap));
		map.put("rows", registerService.showLimit(pmap));
		return map;	
	}

	/**
	 * 获取客房信息，去添加客户信息
	 * @param roomid
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping("/toAdd")
	public Object toAdd(Integer roomid){
		List<Map<String, Object>> showOne = roomService.showOne(roomid);
		if(showOne!=null&showOne.size()>0){
			return showOne.get(0);
		}
		return null;	
	}*/
	/**
	 * 退房操作，更改房间状态，往入住信息统计表添加数据，同时删除当前入住信息表中的客户信息，如有消费往房间消费表添加数据
	 * @param map
	 * @param roomgoods
	 * @return
	 */
	@RequestMapping("/add")
	public Object add(@RequestParam Map map,RoomGoodList roomgoods,CustomerList customers){
		
		List<RoomGood> roomGoodList = roomgoods.getRoomGoodList();
		List<Customer> customerList = customers.getCustomerList();
		roomService.updateState("打扫中", Integer.valueOf(map.get("roomid")+""));
		nowRegisterService.del(Integer.valueOf(map.get("roomid")+""));
		Integer roompricesum = Integer.valueOf(map.get("roompricesum")+"");
		Integer days = Integer.valueOf(map.get("days")+"");
		Integer indays = Integer.valueOf(map.get("indays")+"");
		Integer price = Integer.valueOf(map.get("roomprice")+"");
		map.put("roompricesum", roompricesum-(days-indays)*price);
		Map p = new HashMap();
		p.put("roomid",map.get("roomid"));
		p.put("usesum",map.get("roomuse"));
		p.put("pricesum",roompricesum-(days-indays)*price);
		roomAllService.add(p);
		Map mp = new HashMap();
		if(roomGoodList!=null&&roomGoodList.size()>0){
			for (RoomGood  roomgood: roomGoodList) {
				mp.put("roomid",map.get("roomid"));
				mp.put("goods", roomgood.getGoods());
				mp.put("goodsid", roomgood.getGoodsid());
				mp.put("price", roomgood.getPrice());
				mp.put("num", roomgood.getNum());
				mp.put("opemp", roomgood.getOpemp());
				roomConsumService.addConsum(mp);
				roomLossService.add(mp);
				
			}
		}
		for (Customer customer : customerList) {
			map.put("cusname", customer.getCusname());
			map.put("cussex", customer.getCussex());
			map.put("custel", customer.getCustel());
			map.put("idcardtype", customer.getIdcardtype());
			map.put("idcard", customer.getIdcard());
			registerService.addend(map);
		}
		return "redirect:/roomController/show.do";
	}
}
