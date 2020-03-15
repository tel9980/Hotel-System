package com.aaa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 *@className:BaseDao.java
 *@discripton:
 *@author:sunshaoshan
 *@createTime:2018-9-1上午9:03:15
 *@version:
 */
public class BaseDao {
	private static final String DRIVER_CLASS="com.mysql.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/dage?useSSL=false&useUnicode=true&characterEncoding=utf-8&user=root&password=1234";
	/**
	 * 1：添加jar包
	 * 2：加载驱动
	 */
	static{
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			System.out.println("驱动加载失败");
			e.printStackTrace();
		}
	}
	/**
	 * 3：获取数据库连接
	 * @return
	 */
	public static Connection getConnection(){
		Connection con =null;
		try {
			con = DriverManager.getConnection(JDBC_URL);
		} catch (SQLException e) {
			System.out.println("数据库连接失败");
			e.printStackTrace();
		}
		return con;
	}
	/**
	 * 4：增删改
	 * @param args
	 */
	public static int insertAndUpdateAndDelete(String sql,Object[] params){
		//获取数据库连接
		Connection con = getConnection();
		PreparedStatement ps=null;
		int row = 0;
		try {
			//预编译sql语句
			ps = con.prepareStatement(sql);
			//设置参数
			setParams(params,ps);
			//执行sql语句
			row =ps.executeUpdate();//row ？ 执行sql获取受影响的行 0 没有改变  1 成功
		} catch (SQLException e) {
			System.out.println("sql语句有误");
			e.printStackTrace();
		}finally{
			closeAll(null,ps,con);
		}
		return row;
	}
	/**
	 * 5:设置参数
	 * @param params
	 */
	public static void setParams(Object[] params,PreparedStatement ps) {
		if(params==null) return; 
		for (int i = 0; i < params.length; i++) {
			try {
				ps.setObject(i+1, params[i]);
			} catch (SQLException e) {
				System.out.println("第"+i+1+"个参数有误");
				e.printStackTrace();
			}
		}
	}
	/**
	 * 插入数据获取主键
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int insertGetPrimaryKey(String sql,Object[] params){
		//获取数据库连接
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs =null;
		int id = 0;
		try {
			//预编译sql语句
			 ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			//设置参数
			setParams(params,ps);
			//执行sql语句
			ps.executeUpdate();//row ？ 执行sql获取受影响的行 0 没有改变  1 成功
			rs= ps.getGeneratedKeys();
			while(rs.next()){
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("sql语句有误");
			e.printStackTrace();
		}finally{
			closeAll(rs,ps,con);
		}
		return id;
	}
	/**
	 * 获取数据list
	 */
	public static List<List<Object>> selectList(String sql,Object[] params){
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<List<Object>> tableList = null;
		try {
			ps = con.prepareStatement(sql);
			setParams(params,ps);
			rs = ps.executeQuery();
			//获取数据的列数
			ResultSetMetaData rsmd = rs.getMetaData();
			int  count = rsmd.getColumnCount();
			//System.out.println(count);
			tableList = new ArrayList<List<Object>>();//大盒子
			while(rs.next()){
				List<Object> rowList = new ArrayList<Object>();//小盒子
				for(int i=0;i<count;i++){//遍历数据的列数
					rowList.add(rs.getObject(i+1));//往小盒子里面添加每一行的值
				}
				tableList.add(rowList);//把小盒子放入大盒子里面
				//System.out.println(rs.getInt(1)+" "+rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(rs, ps, con);
		}
		return tableList;
	}
	/**
	 * 获取数据list<Map>
	 */
	public static List<Map<String,Object>> selectMap(String sql,Object[] params){
		List<Map<String,Object>> tableList = null;
		Connection con = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			setParams(params,ps);
			rs = ps.executeQuery();
			//获取数据的列数
			ResultSetMetaData rsmd = rs.getMetaData();
			int  count = rsmd.getColumnCount();
			//System.out.println(count);
			tableList = new ArrayList<Map<String,Object>>();//大盒子
			while(rs.next()){
				Map<String,Object> rowMap = new HashMap<String,Object>();//小盒子
				for(int i=0;i<count;i++){//遍历数据的列数
					// map  key 列名    value 对应列名的值
					rowMap.put(rsmd.getColumnName(i+1), rs.getObject(i+1));//往小盒子里面添加每一行的值
				}
				tableList.add(rowMap);//把小盒子放入大盒子里面
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(rs,ps,con);
		}
		return  tableList;
	}
	/**
	 * 6:关闭所有的连接
	 * @param args
	 */
	public static void closeAll(ResultSet rs,PreparedStatement ps,Connection con ){
		//注：关闭是有顺序的
		try {
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(con!=null){
				con.close();
			}
		} catch (Exception e) {
			
		}
	}
}
