package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:BookingroomDaoImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-17上午11:38:31
 *@version:
 */
@Repository//用于注解dao层，在daoImpl类上面注解。
@SuppressWarnings("all")//压制所有警告
public class BookingroomDaoImpl implements BookingroomDao {

	/**
	 * 获取线上订单列表（未用到）
	 * @return
	 */
	public List<Map<String, Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select b.orderid,b.cusname,b.custel,date_format(begintime,'%Y-%m-%d %H:%m:%s') as begintime," +
				"b.cusnumber,b.handname,b.state,b.text,b.roomid,r.roomid,b.roomtype,e.empno,e.empname from bookingroom b left join room r on b.roomid=r.roomid left join emp e on b.empno=e.empno ", null);
	}
	/**
	 * 获取分页数据
	 * @param start 开始值
	 * @param rows 每页显示数量
	 * @param map 其他参数
	 * @return
	 */
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str = "";
		if (map.get("sort")!=null) {
			str = "order by " + map.get("sort") + " " + map.get("order");
		}else{
			str = " order by state desc ";
		}
		return BaseDao.selectMap("select b.orderid,b.cusname,b.custel,date_format(begintime,'%Y-%m-%d') as begintime," +
				"b.cusnumber,b.handname,b.state,b.text,b.roomid,b.roompricesum,r.roomid,b.roomtype,e.empno,e.empname,date_format(distime,'%Y-%m-%d %H:%m:%s') as distime,b.days,b.remarks " +
				"from bookingroom b left join room r on b.roomid=r.roomid left join emp e on b.empno=e.empno "+setParams(map)+str+" limit "+start+","+rows, null);
	}
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select count(*) as cnt from bookingroom b"+setParams(map),null);
	}

	/**
	 *封装参数（用在获取分页数据中）
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		//查询参数
		String str1=" where 1=1 ";
		//拼接roomtype(含有搜索)
		Object roomtype=map.get("roomtype");
		if (roomtype!=null&&!"".equals(roomtype)) {
			str1+=" and b.roomtype like '%"+roomtype+"%'";
		}
		//拼接handname(含有搜索)
		Object checkname=map.get("checkname");
		if (checkname!=null&&!"".equals(checkname)) {
			str1+=" and handname like '%"+checkname+"%'";
		}
		//拼接state(含有搜索)
		Object state=map.get("state");
		if (state!=null&&!"".equals(state)) {
			str1+=" and state like '%"+state+"%'";
		}
		return str1;
	}
	/**
	 * 订单状态更新
	 */
	public int bookingroomUpd(Map map) {
		// TODO Auto-generated method stub
		String state="";
		if(Integer.valueOf(map.get("roomid")+"")==0){
			state="无法预订";
			map.put("text", "房间已满");
		}else{
			state="已确认";
			map.put("text", "预订成功");
		}
		Date parse =null;
		try {
			Object emptime = map.get("emptime");
			if(emptime!=null&&!"".equals(emptime)){
			parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)emptime);
			}		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return BaseDao.insertAndUpdateAndDelete("update bookingroom set roomid=?,state=?,text=?,handname=?,distime=? where orderid=? ", 
				new Object[]{map.get("roomid"),state,map.get("text"),map.get("handname"),map.get("distime")==null||"".equals(map.get("distime"))?new Date():parse,map.get("orderid")});
	}
		
	/**
	 * 根据房间状态和房间类型选择房号
	 */
	public List<Map<String, Object>> checkRoomId(Map map){
		//System.out.println(BaseDao.selectMap("select * from room where roomtype=? and roomstate like '空闲' ", 
				//new Object[]{map.get("roomtype")}));
		//System.out.println(map.get("roomtype"));
		return BaseDao.selectMap("select * from room  where roomtype=? and roomstate like '空闲' ", 
				new Object[]{map.get("roomtype")});
	}
	public List<Map<String, Object>> showOne(int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select * from bookingroom  where roomid=? and state like '已确认' ", 
				new Object[]{roomid});
	}
	public List<Map<String, Object>> showOredr(String orderid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select * from bookingroom  where orderid=?", 
				new Object[]{orderid});
	}
	public int updateState(int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update bookingroom set state='已入住' where roomid=?", new Object[]{roomid});
	}
}
