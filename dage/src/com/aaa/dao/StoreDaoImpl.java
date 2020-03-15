package com.aaa.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.aaa.entity.Store;
import com.aaa.util.BaseDao;



/***
 *@className:StoreDaoImpl.java
 *@Discription:
 *@author:NingZhang
 *@createTime:2018-9-29下午7:44:54
 *@version:
 */
@Repository
@SuppressWarnings("all")
public class StoreDaoImpl implements StoreDao {

	
	public List<Map<String, Object>> getList() {
			return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,goodsnum,inprice,sellprice,suplieer,suptel,empname from store", null);
		}
	
	
	//通过商品id,查询信息
	public List<Map<String, Object>> getListById(Integer goodsid) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,inprice,sellprice,suplieer,suptel,empname from store where goodsid=?", new Object[]{goodsid});
	}

	//增加商品
	public int addStore(Map map) {
		// TODO Auto-generated method stub
		Object[] params={map.get("goodsid"),map.get("goodsname"),map.get("goodtype"),map.get("gooduse"),map.get("goodsnum"),map.get("inprice"),map.get("sellprice"),map.get("suplieer"),map.get("suptel"),map.get("empid")};
		return BaseDao.insertAndUpdateAndDelete("insert into store(goodsid,goodsname,goodtype,gooduse,goodsnum,inprice,sellprice,suplieer,suptel,empname) values(?,?,?,?,?,?,?,?,?,?)",params );
	}

	//删除商品页面信息
	public int delStoreById(Integer goodsid) {
		// TODO Auto-generated method stub
		String sql="update store set status=0 where goodsid=?";
		Object[] params={goodsid};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	//更新商品信息
	public int updateStore(Map map) {
		String sql="update store set goodsnum=?,inprice=?,suplieer=?,empname=? where goodsid=?";
		Object[] params={map.get("goodsnum"),map.get("inprice"),map.get("suplieer"),map.get("empid"),map.get("goodsid")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}
	
	//商品单个出库
	public int outPutStore(Map map) {
		String sql="update store set goodsnum=? where goodsid=?";
		Object[] params={map.get("goodsnum"),map.get("goodsid")};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	//设置参数
	private String setParams(Map map){
		String str1=" where status=1 ";
		if(map.get("goodsid")!=null&&!"".equals(map.get("goodsid"))){
			str1+=" and goodsid ="+map.get("goodsid");
		}
		
		Object goodtype=map.get("goodtype");
		if(goodtype!=null&&!"".equals(goodtype)){
			str1+= " and goodtype like '%"+goodtype+"%'";
		}
		Object goodsname=map.get("goodsname");
		if(goodsname!=null&&!"".equals(goodsname)){
			str1+= " and goodsname like '%"+goodsname+"%'";
		}
		return str1;
	}
	
	//分页
	public List<Map<String, Object>> getPage(int start, int rows, Map map) {
		// TODO Auto-generated method stub
		String str="";
		if(map.get("sort")!=null){
			str=" order by "+map.get("sort")+" "+map.get("order");
		}
		
		return BaseDao.selectMap("select sid,goodsid,goodsname,goodtype,goodsnum,inprice,sellprice,suplieer,suptel,empname from store  "+setParams(map)+str+" limit "+start+","+rows ,null);
	}
	
	//得到分页记录数量
	public List<Map<String, Object>> getPageCount(Map map) {
		return BaseDao.selectMap("select count(*) as cnt from store "+setParams(map), null);
	}
	
	//查询商品用途是房间消费品的信息
	public List<Map<String, Object>> getRoomUse() {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsid,goodsname,goodtype,goodsnum,inprice,sellprice,suplieer,empname from store where gooduse='房间消费品'", null);
		
	}

	//商品批量入库,更新商品库存数量
	public int inputStore(Store store) {
		String sql="update store set goodsnum=? where goodsid=?";
		Object[] params={store.getGoodsnum(),store.getGoodsid()};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}

	//商品批量出库
	public int updateAllStore(Store store) {
		String sql="update store set goodsnum=? where goodsid=?";
		Object[] params={store.getGoodsnum(),store.getGoodsid()};
		return BaseDao.insertAndUpdateAndDelete(sql, params);
	}
	
	//通过商品名称查询库存商品数量,商品id
	public List<Map<String, Object>> getListByName(String goodsname) {
		// TODO Auto-generated method stub
		return BaseDao.selectMap("select goodsnum,goodsid from store where goodsname=?", new Object[]{goodsname});
	}


	

}
