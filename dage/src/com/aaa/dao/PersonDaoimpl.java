/**
 * 
 */
package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.entity.Person;
import com.aaa.util.BaseDao;





/***
 *@className:PersonDaoimpl.java
 *@discripton:
 *@author:CZP
 *@createTime:2018-9-12下午3:17:27
 *@version:
 */
@Repository
public class PersonDaoimpl implements PersonDao {
	/**
	 * 根据手机号和密码查询用户
	 */
	public List<Map<String, Object>> selectsqlByNameAndPassword(Person person) {
		String sql="select account,password from client where account=? and  password=?" ;
		Object[] params={person.getAccount(),person.getPassword()};
		List<Map<String,Object>> list =BaseDao.selectMap(sql, params);
		return list;
	}
	/**
	 * 添加新用户
	 */
	public void insert(Person person) {
		String sql="insert into client(userno,account,password) values(CONCAT('AAA',lpad(floor(rand()*1000),4,0)),?,?)" ;

		Object[] params={person.getAccount(),person.getPassword()};
		BaseDao.insertAndUpdateAndDelete(sql, params);
	}
	/**
	 * 添加订单信息
	 * @return 
	 */
	public int update(Person person) {
		//String sql="update userinf set cusname=?,custel=?,roomtype=?,begintime=? overtime=? where account=?" ;
		try {
			Date begintime=new SimpleDateFormat("MM/dd/yyyy").parse((String)person.getBeginTime());
			String sql="insert into bookingroom(remarks,cusname,custel,roomtype,begintime,days,cusnumber,roompricesum,orderid) values(?,?,?,?,?,?,?,?,CONCAT('NUM',DATE_FORMAT(now(),'%Y%m'),lpad(floor(rand()*10000),6,0)))";
			Object[] params={person.getRemarks(),person.getCusName(),person.getAccount(),person.getRoomtype(),
					begintime,person.getDays(),person.getCusnumber(),person.getRoompricesum()};
			return BaseDao.insertAndUpdateAndDelete(sql, params);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	/* 
	 * 根据手机号查询用户信息
	 * (non-Javadoc)
	 * @see com.aaa.mvc.dao.PersonDao#selectsqlById(int)
	 */
	public List<Map<String, Object>> selectsqlByAccount(String account) {
		// TODO Auto-generated method stub  cusname,custel,roomtype,idcardtype,idcard from bookingroom
		String sql="select cusname,custel,orderid, roomtype,cusnumber,days,roompricesum,text,state,date_format(begintime ,'%Y-%m-%d' ) begintime from bookingroom where custel=?";
		Object[] params={account};
		return BaseDao.selectMap(sql, params);
	}
	/* 
	 * 用户申请取消订单
	 * (non-Javadoc)
	 * @see com.aaa.mvc.dao.PersonDao#deleteByOrderid(int)
	 */
	public int updateByOrderid(String orderid) {
		// TODO Auto-generated method stub
		String sql="update bookingroom set state='已取消' where orderid=?";
		Object[] params={orderid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}
	/* 
	 * 查询房间类型
	 * (non-Javadoc)
	 * @see com.aaa.dao.PersonDao#selectRoom()
	 */
	public List<Map<String, Object>> selectRoom() {
		// TODO Auto-generated method stub
		String sql="select distinct roomtype,roomprice from room where roomstate='空闲'";
		Object[] params={};
		return BaseDao.selectMap(sql, params);
	}
	/* 
	 * 根据用户名查询用户
	 * (non-Javadoc)
	 * @see com.aaa.dao.PersonDao#selectsqlByName(com.aaa.entity.Person)
	 */
	public List<Map<String, Object>> selectsqlByName(Person person) {
		String sql="select account,password from client where account=?" ;
		Object[] params={person.getAccount()};
		List<Map<String,Object>> list =BaseDao.selectMap(sql, params);
		return list;
	}
	
}
