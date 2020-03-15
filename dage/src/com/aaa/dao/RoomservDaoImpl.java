package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:RoomservDaoImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-12下午8:14:24
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class RoomservDaoImpl implements RoomservDao {

	/**
	 * 获取房间维修记录列表
	 * @return
	 */
	public List<Map<String,Object>> getList() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select s.servid,s.servno,s.roomid,s.servgoods,s.servcause,date_format(servtime,'%Y-%m-%d %H:%i:%S') as servtime,s.servstate," +
				"e.empid,e.empname from roomserv s left join emp e on s.empname=e.empname ", null);
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
		//排序参数
		String str = "";
		if (map.get("sort")!=null) {
			str = "order by " + map.get("sort") + " " + map.get("order");
		}
		return BaseDao.selectMap("select s.servid,s.empname,s.servno,s.roomid,s.servgoods,s.servcause,date_format(servtime,'%Y-%m-%d %H:%i:%S') as servtime,date_format(endtime,'%Y-%m-%d %H:%i:%S') as endtime,s.servstate," +
				"e.empid,e.emptel from roomserv s left join emp e on s.empname=e.empname "+setParams(map)+str+" limit "+start+","+rows, null);
	}
	/**
	 * 获取分页数据的总数量
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getPageCount(Map map) {
		// TODO Auto-generated method stub
		
		return BaseDao.selectMap("select count(*) as cnt from roomserv "+setParams(map),null);
	}

	/**
	 *封装参数roomId
	 * @param map
	 * @return
	 */
	private String setParams(Map map){
		//查询参数
		String str1=" where 1=1 ";
		//拼接roomId(含有搜索)
		Object roomId=map.get("roomId");
		Object servno=map.get("servno");
		//拼接stuId
		if (roomId!=null&&!"".equals(roomId)) {
			str1+=" and roomid like '%"+roomId+"%'";
		}
		if (servno!=null&&!"".equals(servno)) {
			str1+=" and servno like '%"+servno+"%'";
		}
		return str1;
	}

	/**
	 * 房间维修记录增加
	 */
	public int roomservAdd(Map map) {
		// TODO Auto-generated method stub
		
		return BaseDao.insertAndUpdateAndDelete("insert into roomserv(servno,roomid,servgoods,servcause,servtime,empname) values(CONCAT('VX',DATE_FORMAT(now(),'%Y%m%d'),lpad(floor(rand()*10000),4,0)),?,?,?,now(),?)", 
				new Object[]{map.get("roomid"),map.get("servgoods"),map.get("servcause"),map.get("empname")});
	}
	/**
	 * 更改房间的
	 */
	public int updateState(String state, int roomid) {
		// TODO Auto-generated method stub
		return BaseDao.insertAndUpdateAndDelete("update roomserv set servstate=?,endtime=now() where roomid=?", new Object[]{state,roomid});
	}
	/**
	 * 维修更新
	 */
	public int servUpd(Map map) {
		// TODO Auto-generated method stub
		//System.out.println(map);
		
		return BaseDao.insertAndUpdateAndDelete("update roomserv set roomid=?,servgoods=?,servcause=?,empname=? where servno=? ", 
				new Object[]{map.get("roomid"),map.get("servgoods"),map.get("servcause"),map.get("empname"),map.get("servno")});
	}
	
}
