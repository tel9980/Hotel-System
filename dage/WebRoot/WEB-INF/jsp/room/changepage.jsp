<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户换房记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
  </head>
  
  <body>
    <table id="tt" class="easyui-datagrid" title="客户换房记录" style="width:100%;height:auto"
		toolbar="#tb" fitColumns="true" pagination="true" data-options="singleSelect:true,collapsible:true,url:'change/show.do',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'oldroomid',width:100,align:'center',sortable:true">原房间号</th>
				<th data-options="field:'changeroomid',width:130,align:'center',sortable:true">换房后房间号</th>
				<th data-options="field:'cusname',width:100,align:'center',sortable:true">顾客姓名</th>
				<th data-options="field:'cussex',width:70,align:'center'">性别</th>
				<th data-options="field:'custel',width:100,align:'center'">联系方式</th>
				<!-- <th data-options="field:'idcardtype',width:100,align:'center'">证件类型</th> -->
				<th data-options="field:'idcard',width:180,align:'center'">证件号</th>
				<th	data-options="field:'oldroomtype',width:100,align:'center'" >原房间类型</th>
				<th data-options="field:'oldroomprice',width:100,align:'center'" >原房间价格</th>
				<th data-options="field:'changeroomtype',width:100,align:'center'">换房后房间类型</th>
				<th data-options="field:'changeroomprice',width:140,align:'center'">换房后房间价格</th>
				<!-- <th data-options="field:'days',width:70,align:'center'">入住天数</th>
				<th data-options="field:'roompricesum',width:70,align:'center'"></th>
				<th data-options="field:'cash',width:70,align:'center'">押金</th> -->
				
				<th data-options="field:'changetime',width:260,align:'center'">换房时间</th>
			</tr>
		</thead>
	</table>  
	<div id="tb">
			<div style="float:right">
				<span>原房间号:</span>
				<input id="oldroomid" style="line-height:26px;border:1px solid #ccc">
				<span>更改后房间号:</span>
				<input id="changeroomid" style="line-height:26px;border:1px solid #ccc">
				<span>客户证件号:</span>
				<input id="idcard" style="line-height:26px;border:1px solid #ccc">
				<span>客户姓名:</span>
				<input id="cusname" style="line-height:26px;border:1px solid #ccc">
				<a  class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
	</div>
	
	
	<script type="text/javascript">
		 function doSearch(){
				$('#tt').datagrid('load',{
					oldroomid: $('#oldroomid').val(),
					changeroomid: $('#changeroomid').val(),
					idcard: $('#idcard').val(),
					cusname: $('#cusname').val(),
				});
		 }
	</script>
  </body>
</html>
