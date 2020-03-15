package com.aaa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Customer;
import com.aaa.entity.CustomerList;
import com.aaa.entity.RoomGood;
import com.aaa.entity.RoomGoodList;
import com.aaa.service.NowRegisterService;
import com.aaa.service.RoomChangeService;
import com.aaa.service.RoomConsumService;
import com.aaa.service.RoomLossService;
import com.aaa.service.RoomService;
import com.aaa.service.StoreService;
import com.aaa.service.UserService;
@Controller
@RequestMapping("/nowregister")
@SuppressWarnings("all")
public class NowRegisterController {
	@Autowired
	private NowRegisterService nowRegisterService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private RoomConsumService roomConsumService;
	@Autowired
	private RoomChangeService roomChangeService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoomLossService roomLossService;
	/**
	 * 跳转jsp页面
	 * @return
	 */
	@RequestMapping("/show")
	public Object show(){
		return "register/nowshow";	
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
		map.put("total", nowRegisterService.getCount(pmap));
		map.put("rows", nowRegisterService.showLimit(pmap));
		return map;	
	}

	/**
	 * 获取客房信息，去添加客户信息
	 * @param roomid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/toAdd")
	public Object toAdd(Integer roomid){
		List<Map<String, Object>> showOne = roomService.showOne(roomid);
		if(showOne!=null&showOne.size()>0){
			return showOne.get(0);
		}
		return null;	
	}
	/**
	 * 入住添加
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Object add(@RequestParam Map map,CustomerList customers){
		List<Customer> customerList = customers.getCustomerList();
		int add=0;
		for (Customer customer : customerList) {
			map.put("cusname", customer.getCusname());
			map.put("cussex", customer.getCussex());
			map.put("custel", customer.getCustel());
			map.put("idcardtype", customer.getIdcardtype());
			map.put("idcard", customer.getIdcard());
			add = nowRegisterService.add(map);
			//int userAdd = userService.userAdd(map);
			
		}		
		Map mp = new HashMap();	
		if(add!=0){
			roomService.updateState("已入住",Integer.valueOf(map.get("roomid")+""));
			
			mp.put("successMsg", "入住成功");
			return mp;
		}else{
			mp.put("errorMsg", "入住失败，请确认信息输入正确");
			return mp;
		}			
	}
	/**
	 * 跳转到退房界面
	 * @return
	 */
	@RequestMapping("/getInfo")
	public String getInfo(Model model,Integer roomid){	
		model.addAttribute("list", nowRegisterService.getListByRoomId(roomid));
		return "register/checkout";	
	}
	/**
	 * 跳转到换房界面
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/changeInfo")
	public String changeInfo(Model model,Integer roomid) throws ParseException{	
		List<Map<String, Object>> listByRoomId = nowRegisterService.getListByRoomId(roomid);
//		SimpleDateFormat now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date D =new Date();
//		long time = D.getTime();
//		Date T = now.parse(listByRoomId.get(0).get("begintime")+"");
//		long time2 = T.getTime();	
//		//System.out.println((time-time2)/1000/60/60/24);
//		model.addAttribute("days", (time-time2)/1000/60/60/24);		
		model.addAttribute("list", listByRoomId);
		return "room/roomchange";	
	}
	/**
	 * 通过商品id获取商品信息
	 * @param goodsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/goodInfo")
	public Object getGoodInfo(Integer goodsid){
		return storeService.getListById(goodsid);
		
	}
	/**
	 * 换房操作     1.换房需要修改原房间状态以及换房后的房间状态    
	 * 			 2.根据idcard修改当前入住信息表中登记的房间号转为换后的  
	 * 			 3.添加换房登记记录到换房登记表
	 * 			 4.如果有消费，将原房间消费信息添加到客房消费表
	 * 			 5.
	 * @param map
	 * @param roomgoods
	 * @param customers
	 * @return
	 */
	@RequestMapping("/change")
	public Object add(@RequestParam Map map,RoomGoodList roomgoods,CustomerList customers){
		
		if(Integer.valueOf(map.get("changeroomid")+"")!=0){
			List<RoomGood> roomGoodList = roomgoods.getRoomGoodList();
			List<Customer> customerList = customers.getCustomerList();
			//System.out.println(map.get("roomid")+"--"+map.get("changeroomid"));
			roomService.updateState("打扫中", Integer.valueOf(map.get("roomid")+""));
			roomService.updateState("已入住", Integer.valueOf(map.get("changeroomid")+""));
			int difference = Integer.valueOf(map.get("difference")+"");
			int roompricesum = Integer.valueOf(map.get("roompricesum")+"");
			//System.out.println(difference+"-----"+roompricesum);
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
				map.put("roompricesum",difference+roompricesum);
				nowRegisterService.update(map);	
				roomChangeService.add(map);
			}
			return "redirect:/roomController/show.do";
		}else{
			return "1";
		}		
	}
	/**
	 * 通过房间号 获取 续住信息
	 * @param model
	 * @param roomid
	 * @return
	 */
	@RequestMapping("/stayInfo")
	public Object tostay(Model model,Integer roomid){
		model.addAttribute("list", nowRegisterService.getListByRoomId(roomid));
		return  "room/tostayover";
	}
}
