package com.aaa.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.service.BookingroomService;
import com.aaa.service.RoomService;


/***
 *@className:DeptController.java
 *@discripton:线上订单控制台 融合了查改
 *@author:liudaye
 *@createTime:2018-10-12下午5:17:30
 *@version:
 *SpringMVC运行原理
 *1. 客户端请求提交到DispatcherServlet
 *2. 由DispatcherServlet控制器查询一个或多个HandlerMapping，找到处理请求的Controller
 *3. DispatcherServlet将请求提交到Controller
 *4. Controller调用业务逻辑处理后，返回ModelAndView
 *5. DispatcherServlet查询一个或多个ViewResoler视图解析器，找到ModelAndView指定的视图
 *6. 视图负责将结果显示到客户端
 *
 */
//负责处理由DispatcherServlet 分发的请求,把用户请求的数据经业务处理层封装成一个Model返回给对应的View 进行展示。
@Controller 
//通用url映射配置 ,用来处理请求地址映射,可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径
@RequestMapping("/bookingroomController")
//压制所有警告
@SuppressWarnings("all")
public class BookingroomController {
	//依赖注入,spring可以自动把bean里面引用的对象的setter/getter方法省略，它会自动帮你set/get。
	@Autowired
	private BookingroomService bookingroomService;
	@Autowired
	private RoomService roomService;
	/*
	 * 跳转线上订单页面
	 */
	@RequestMapping("/booking")
	public Object serv(){
		return "indent/bookingroom";
	}
	/**
	 * 线上订单列表
	 * @param model
	 * @return
	 */
	@ResponseBody//让该方法的返回值为json  相当于servlet response.getWrite().print(json)
	@RequestMapping("/list")
	public Map bookingroomList(){
		Map map=new HashMap();
		map.put("rows", bookingroomService.getList());
		return map;
	}
	/**
	 * 线上订单分页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/bookingroom")
	public Object bookingroomPage(@RequestParam Map paramMap){//使用 @RequestParam 绑定 HttpServletRequest 请求参数到控制器方法参数
		Map map=new HashMap();
		//总数量
		map.put("total", bookingroomService.getPageCount(paramMap));
		//分页查询的结果
		map.put("rows", bookingroomService.getPage(paramMap));
		return map;
	}
	/**
	 * 订单状态编辑
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object bookingroomUpd(@RequestParam Map paramMap){
		List<Map<String, Object>> showOredr = bookingroomService.showOredr((String)paramMap.get("orderid"));
		Map map=new HashMap();
		if(showOredr.get(0).get("roomid")!=null){
			map.put("showInfo","该订单已分配房间");
			return map;
		}else{
			int bookingroomUpd=bookingroomService.bookingroomUpd(paramMap);
			
			if (bookingroomUpd==0) {
				map.put("showInfo","编辑失败");
			}else{
				roomService.updateState("已预订", Integer.valueOf(paramMap.get("roomid")+""));
				map.put("suc","true");
				map.put("showInfo","编辑成功");
			}
			return map;
		}
	}
	/**
	 * 弹出框内房间号下拉框的值列表(房间号)
	 * @param paramMap
	 * @return
	 */
	@ResponseBody //让该方法的返回值为json 相当于servlet response.getWrite().Print(json)
	@RequestMapping("/checkRoomId")// 窄化映射请求
	public Object departmentCheckRoomId(@RequestParam Map paramMap) {
		List<Map<String, Object>> checkRoomId = bookingroomService.checkRoomId(paramMap);
		return checkRoomId;
	}
	/***
	 * 确认入住调用方法  post请求数据
	 * @param roomid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getStateInfo")
	public Object getStateInfo(Integer roomid){

		return bookingroomService.showOne(roomid);
		
	}
}
