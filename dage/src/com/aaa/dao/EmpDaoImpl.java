package com.aaa.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.aaa.util.BaseDao;

/***
 *@className:EmpDaoImpl.java
 *@discripton:
 *@author:liudaye
 *@createTime:2018-10-10下午4:51:18
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class EmpDaoImpl implements EmpDao {

		/**
		 * 获取部门列表
		 * @return
		 */
		public List<Map<String,Object>> getList() {
			// TODO Auto-generated method stub
			return BaseDao.selectMap("select e.empno,e.empname,e.empage,e.empsex,e.empidcard," +
					"e.emptel,e.empadd,e.emptype,e.empwage,date_format(emptime,'%Y-%m-%d') as emptime,e.empstate,e.empexit,e.password,e.deptno,d.deptname from emp e left join dept d on e.deptno=d.deptno ", null);
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
				str = " order by "+map.get("sort")+" "+map.get("order");
			}else{
				str = " order by empno asc ";
			}
			return BaseDao.selectMap("select e.empno,e.empname,e.empage,e.empsex,e.empidcard," +
					"e.emptel,e.empadd,e.emptype,e.empwage,date_format(emptime,'%Y-%m-%d') as emptime,e.empstate,date_format(empexit,'%Y-%m-%d') as empexit,e.password,e.deptno,d.deptname from emp e left join dept d on e.deptno=d.deptno  where empstate like '在职' "+setParams(map)+str+" limit "+start+","+rows, null);
		}
		/**
		 * 获取分页数据的总数量
		 * @param map
		 * @return
		 */
		public List<Map<String, Object>> getPageCount(Map map) {
			// TODO Auto-generated method stub
			
			return BaseDao.selectMap("select count(*) as cnt from emp e left join dept d on e.deptno=d.deptno where empstate like '在职' "+setParams(map),null);
		}

		/**
		 *封装参数empno员工编号,empname员工姓名,deptname部门名称,empidcard身份证号,emptel员工联系方式
		 * @param map
		 * @return
		 */
		private String setParams(Map map){
			//查询参数
			String str1=" ";
			//拼接empNo(输什么搜索什么)
			Object empNo= map.get("empNo");
			if (map.get("empNo")!=null&&!"".equals(empNo)) {
				str1+= " and empno like '%"+empNo+"%' ";
			}
			//拼接empName(含有搜索)
			Object empName=map.get("empName");
			if (empName!=null&&!"".equals(empName)) {
				str1+=" and empname like '%"+empName+"%'";
			}
			//拼接deptName(含有搜索)
			Object deptName=map.get("deptName");
			if (deptName!=null&&!"".equals(deptName)) {
				str1+=" and deptname like '%"+deptName+"%'";
			}
			//拼接empidcard
			Object empidcard=map.get("empidcard");
			if (empidcard!=null&&!"".equals(empidcard)) {
				str1+=" and empidcard like '%"+empidcard+"%'";
			}
			//拼接emptel
			Object emptel=map.get("emptel");
			if (emptel!=null&&!"".equals(emptel)) {
				str1+=" and emptel like '%"+emptel+"%'";
			}
			return str1;
		}

		/**
		 * 员工增加
		 */
		public int empAdd(Map map) {
			// TODO Auto-generated method stub
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
			return BaseDao.insertAndUpdateAndDelete("insert into emp(empno,empname,empage,empsex,empidcard,emptel,empadd,emptype,empwage,emptime,password,empstate,deptno) values(CONCAT('EMP',lpad(floor(rand()*10000),4,0)),?,?,?,?,?,?,?,?,?,?,?,?)", 
					new Object[]{map.get("empname"),map.get("empage"),map.get("empsex"),map.get("empidcard"),map.get("emptel"),map.get("empadd"),map.get("emptype"),map.get("empwage"),
					map.get("emptime")==null||"".equals(map.get("emptime"))?new Date():parse,map.get("password"),map.get("empstate"),map.get("deptno")});
		}

		/**
		 * 员工编辑
		 */
		public int empUpd(Map map) {
			// TODO Auto-generated method stub
			
			Date parse =null;
			try {
				Object empexit = map.get("empexit");
				if(empexit!=null&&!"".equals(empexit)){
				parse = new SimpleDateFormat("MM/dd/yyyy").parse((String)empexit);
				}		
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(map.get("empstate").equals("离职")){
				return BaseDao.insertAndUpdateAndDelete("update emp set empname=?,empage=?,empsex=?,empidcard=?,emptel=?,empadd=?,emptype=?,empwage=?,empstate=?,password=?,empexit=?,deptno=? where empno=? ", 
						new Object[]{map.get("empname"),map.get("empage"),map.get("empsex"),map.get("empidcard"),map.get("emptel"),map.get("empadd"),map.get("emptype"),map.get("empwage"),
						map.get("empstate"),map.get("password"),map.get("empexit")==null||"".equals(map.get("empexit"))?new Date():parse,map.get("deptno"),map.get("empno")});
			}else{
				return BaseDao.insertAndUpdateAndDelete("update emp set empname=?,empage=?,empsex=?,empidcard=?,emptel=?,empadd=?,emptype=?,empwage=?,empstate=?,password=?,empexit=?,deptno=? where empno=? ", 
						new Object[]{map.get("empname"),map.get("empage"),map.get("empsex"),map.get("empidcard"),map.get("emptel"),map.get("empadd"),map.get("emptype"),map.get("empwage"),
						map.get("empstate"),map.get("password"),map.get("empexit")==null||"".equals(map.get("empexit"))?null:parse,map.get("deptno"),map.get("empno")});
			}
		}

		/**
		 * 员工删除
		 */
		public int empDel(Map map) {
			// TODO Auto-generated method stub
			return BaseDao.insertAndUpdateAndDelete("delete from emp where empno=?", new Object[]{map.get("empno")});
		}
		/**
		 * 员工登陆查询
		 */
		public List<Map<String,Object>> getEmpByEmptelAndPassword(Map map) {
			// TODO Auto-generated method stub
			return BaseDao.selectMap("select empno,empname,emptel,password from emp where empstate='在职' and emptel=? and password=?", new Object[]{map.get("emptel"),map.get("password")});
		}
		/**
		 * 获取客房部员工信息
		 */
		public List<Map<String, Object>> getEmpByRoom() {
			// TODO Auto-generated method stub
			return BaseDao.selectMap("select empno,empname,emptel from emp where deptno='D2018100002' and empstate like '在职' ",null);
		}
		/**
		 * 获取仓管部员工信息
		 */
		public List<Map<String, Object>> getEmpByStore() {
			// TODO Auto-generated method stub
			return BaseDao.selectMap("select empno,empname,emptel from emp where deptno='D2018100003' and empstate like '在职' ",null);
		}
		/**
		 * 获取后勤部员工信息
		 */
		public List<Map<String, Object>> getEmpByServ() {
			// TODO Auto-generated method stub
			return BaseDao.selectMap("select empno,empname,emptel from emp where deptno= 'D2018100005' and empstate like '在职' ",null);
		}
		/**
		 * 根据员工工号查询用户信息
		 */
		public List<Map<String, Object>> showOne(String empno) {
			// TODO Auto-generated method stub
			String sql = "select * from emp where empno=? and empstate like '在职' ";
			return BaseDao.selectMap(sql, new Object[]{empno});
		}
		
		

}
