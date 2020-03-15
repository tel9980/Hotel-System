package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.RoomservDao;



/***
 *@className:RoomservServiceImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-12下午8:15:49
 *@version:
 */
@Service
@SuppressWarnings("all")
public class RoomservServiceImpl implements RoomservService {

	//依赖注入
		@Autowired
		private RoomservDao servDao;
		
		/**
		 * 查询所有房间维护记录信息
		 */
		public List<Map<String, Object>> getList() {
			// TODO Auto-generated method stub
			return servDao.getList();
		}	

		/**
		 * 获取分页数据
		 */
		public List<Map<String, Object>> getPage(Map map) {
			// TODO Auto-generated method stub
			//获取分页要素，判断如果为空，赋予默认值
			int pageNo = map.get("page")==null?1:Integer.valueOf(map.get("page")+"");
			int pageSize = map.get("rows")==null?10:Integer.valueOf(map.get("rows")+"");
			//计算开始值
			int start = (pageNo-1)*pageSize;
			return servDao.getPage(start, pageSize, map);
		}
		/**
		 * 获取分页数据的总数量
		 */
		public int getPageCount(Map map) {
			// TODO Auto-generated method stub
			List<Map<String, Object>> pageCount = servDao.getPageCount(map);
			//判断集合，如果不为空，返回总数量
			if (pageCount!=null&&pageCount.size()>0) {
				return Integer.valueOf(pageCount.get(0).get("cnt")+"");
			}
			return 0;
		}
		
		/**
		 * 房间维护记录添加
		 */
		public int roomservAdd(Map map) {
			// TODO Auto-generated method stub
			return servDao.roomservAdd(map);
		}
		/**
		 * 更改客房
		 */
		public int updateState(String state, int roomid) {
			// TODO Auto-generated method stub
			return servDao.updateState(state, roomid);
		}

		public int servUpd(Map map) {
			// TODO Auto-generated method stub
			return servDao.servUpd(map);
		}

}
