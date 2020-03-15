package com.aaa.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.service.EmpService;
import com.aaa.service.NowRegisterService;
import com.aaa.service.RegisterService;
import com.aaa.service.RoomService;
import com.aaa.service.RoomservService;



@Controller
@RequestMapping("/roomController")
@SuppressWarnings("all")
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoomservService roomservService;
	@Autowired
	private NowRegisterService nowRegisterService;
	@Autowired
	private EmpService empService;
	/**
	 *  跳转房间信息页面
	 * @return
	 */
	@RequestMapping("/room")
	public Object room(){
		return "room/room";
	}
	/**
	 * 获取所有房间信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/show")
	public Object showAll(Model model){
		
		model.addAttribute("list", roomService.showAll());
		return "room/rooms";	
	}
	@RequestMapping("/iframe")
	public Object iframe(){
		return "room/roomiframe";	
	}
	/**
	 * 获取room表 分页数据
	 * @param pmap
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/page")
	public Object pagelist(@RequestParam Map pmap){
		Map map = new HashMap();
//		System.out.println(111);
		map.put("total", roomService.getcount(pmap));
		map.put("rows", roomService.showLimit(pmap));
		return map;	
	}
	/**
	 * 向room表添加数据
	 * @param map
	 * @param roompic
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Map add(@RequestParam Map map,@RequestParam MultipartFile roompic,HttpServletRequest request){
		String SavePath = "files";
		String realPath = request.getRealPath(SavePath);
		String originalFilename = roompic.getOriginalFilename();
		if(originalFilename!=""){
			String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
			String newfilename = UUID.randomUUID()+suffix;
			File file = new File(realPath+"/"+newfilename);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				roompic.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("roompicpath",SavePath+"/"+newfilename);
			map.put("roompicname",originalFilename);
		}
		int add = roomService.add(map);
		Map mp = new HashMap();
		if(add!=0){
			mp.put("successMsg", "添加成功");
			return mp;
		}else{
			mp.put("errorMsg", "添加失败，请重试");
			return mp;
		}
		//System.out.println(map);
		
	}
	/**
	 * 根据roomid 更新room表
	 * @param map
	 * @param roompic
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Map update(@RequestParam Map map,@RequestParam MultipartFile roompic,HttpServletRequest request){
		String SavePath = "files";
		String realPath = request.getRealPath(SavePath);
		String originalFilename = roompic.getOriginalFilename();
		if(originalFilename!=""){
			String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
			String newfilename = UUID.randomUUID()+suffix;
			File file = new File(realPath+"/"+newfilename);
			if(!file.exists()){
				file.mkdirs();
			}
			try {
				roompic.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("roompicpath",SavePath+"/"+newfilename);
			map.put("roompicname",originalFilename);
		}
		int update = roomService.update(map);
		Map mp = new HashMap();
		if(update!=0){
			mp.put("successMsg", "修改成功");
			return mp;
		}else{
			mp.put("errorMsg", "修改失败，请重试");
			return mp;
		}
	}
	/**
	 * 根据roomid删除room
	 * @param roomid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/del")
	public Map del(Integer roomid){
		int del = roomService.del(roomid);
		Map mp = new HashMap();
		if(del!=0){
			mp.put("successMsg", "删除成功");
			return mp;
		}else{
			mp.put("errorMsg", "删除失败，请重试");
			return mp;
		}
	}
	/**
	 * 修改房间状态
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateState")
	public Map updatestate(@RequestParam Map map){
		Map mp = new HashMap();

		if(map.get("orderState")!=null&&map.get("orderState")!=""){
			int updateState = roomService.updateState((String)map.get("state"), Integer.valueOf(map.get("roomid")+""));
			int updateState2 = roomservService.updateState((String)map.get("orderState"), Integer.valueOf(map.get("roomid")+""));
			if(updateState!=0&&updateState2!=0){
				mp.put("successMsg", "操作成功");
				return mp;
			}else{
				mp.put("errorMsg", "操作失败，请重试");
				return mp;
			}
		}else{
			int updateState = roomService.updateState((String)map.get("state"), Integer.valueOf(map.get("roomid")+""));
			if(updateState!=0){
				mp.put("successMsg", "操作成功");
				return mp;
			}else{
				mp.put("errorMsg", "操作失败，请重试");
				return mp;
			}
		}
	}
	/**
	 * 添加时房间号校验
	 * @param roomid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/required")
	public Object required(Integer roomid){
		//System.out.println(roomid);
		List<Map<String, Object>> showOne = roomService.showOne(roomid);
		if(showOne!=null&&showOne.size()>0){
			return false;
		}
		return true;	
	}
	/**
	 * 获取当前空闲状态的房间
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getfreeroom")
	public Object getFreeRoom(){
		return roomService.getFreeRoom();		
	}
	/**
	 * 根据房间号查询房间信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getoneroom")
	public Object getOneRoom(Integer roomid){
		return roomService.showOne(roomid);		
	}
	/**
	 * 获取不同状态 不同房型的数量
	 * @param roomstate
	 * @param roomtype
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getcounts")
	public Object getCounts(){
		Map map = new HashMap();
		map.put("r1", roomService.getCounts("空闲", "家庭套房"));
		map.put("r2", roomService.getCounts("空闲", "总统套房"));
		map.put("r3", roomService.getCounts("空闲", "标准套房"));
		map.put("r4", roomService.getCounts("空闲", "情侣套房"));
		map.put("r5", roomService.getCounts("空闲", "豪华单人间"));
		map.put("r6", roomService.getCounts("空闲", "情侣大床房"));
		map.put("r7", roomService.getCounts("空闲", "行政房"));
		map.put("r8", roomService.getCounts("空闲", "商务房"));
		map.put("free", roomService.getCounts("空闲", null));
		map.put("ins", roomService.getCounts("已入住", null));
		map.put("check", roomService.getCounts("维修中", null));
		map.put("clear", roomService.getCounts("打扫中", null));
		map.put("booking", roomService.getCounts("已预订", null));
		return map;
	}
}
