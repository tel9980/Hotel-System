<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <titl>房间总消费</title>
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
             
  
  <link rel="stylesheet" href="easyui/themes/icon.css" type="text/css">
  <link rel="stylesheet" href="easyui/themes/default/easyui.css" type="text/css">
  <script type="text/javascript" src="easyui/jquery.min.js"></script>
  <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
  <body>
   <table id="tt" class="easyui-datagrid" title="房间消费列表" style="width:100%;height:550px" align="center";
		  striped="true" pagination="true" fitColumns="true" toolbar="#tb" data-options="singleSelect:true,collapsible:true,url:'roomUseController/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'orderid',width:180,align:'center'" sortable="true"  >记账单号</th>
				<th data-options="field:'roomid',width:200,align:'center'">房间号</th>
				<th data-options="field:'pricesum',width:200,align:'center'">入住消费</th>
				<th data-options="field:'usesum',width:200,align:'center',sortable:true">房间消费</th>
				<th data-options="field:'time',width:200,align:'center'">操作时间</th>
				
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:3px">
			<span>记帐单号:</span>
			<input id="orderid" style="line-height:26px;border:1px solid #ccc">
			<span>房间号:</span>
			<input id="roomid" style="line-height:26px;border:1px solid #ccc">
			<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
	</div>
		
	
		
		<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, { 
		     onlyNum : {// 验证整数或小数
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'    
            }
		    });
          
			//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					orderid: $('#orderid').val(),
					roomid: $('#roomid').val()
				});
		 }
			//弹出添加方法
		
//删除数据
		
	$(function(){
        var p = $('#tt').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 30],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from}-{to} 条记录,共 {total} 条记录'
        });
    });
		</script>
  </body>
</html>
<!-- 分页第二种方式  data-options="pagination:true,singleSelect:true,collapsible:true,url:'userController/list',method:'get'" -->
