<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客房管理</title>
    
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
    <table id="tt" class="easyui-datagrid" title="客房损耗统计" style="width:100%;height:100%"
		toolbar="#tb" fitColumns="true" pagination="true" data-options="singleSelect:true,collapsible:true,url:'roomloss/list.do',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'roomid',width:70,align:'center',sortable:true">房间号</th>
				<th data-options="field:'goodsid',width:90,align:'center',sortable:true">商品编号</th>
				<th data-options="field:'goodsname',width:90,align:'center',sortable:true">商品名称</th>
				<th data-options="field:'losstime',width:80,align:'center'">损耗时间</th>
				<th data-options="field:'lossnum',width:80,align:'center'">损耗数量</th>
				<th data-options="field:'addtime',width:100,align:'center',sortable:true">补货时间</th>
				<th data-options="field:'addempid',width:180,align:'center'">补货人员</th>
			</tr>
		</thead>
	</table>  
	<div id="tb" style="padding:5px">
			<a  class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRoom()">补货</a>
			<div style="float:right">
				<span>房间号:</span>
				<input id="roomid" style="line-height:26px;border:1px solid #ccc">
				<span>商品编号:</span>
				<input id="goodsid" style="line-height:26px;border:1px solid #ccc">
				<a  class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:350px;padding:10px 20px"
	 closed="true" buttons="#dlg-buttons">
	<div class="ftitle">客房物品损耗信息</div>
		<form id="fm" method="post" enctype="multipart/form-data">
			<div class="fitem">
				<table>
					<tr>
						<td><label>房间号:</label></td>
						<td><input name="roomid" class="easyui-validatebox" required="true" ></td>
					</tr>
					<tr>
						<td><label>商品编号:</label></td>
						<td><input name="goodsid" class="easyui-validatebox" required="true" ></td>
					</tr>
					<tr>
						<td><label>商品名称:</label></td>
						<td><input name="goodsname" class="easyui-validatebox" required="true" ></td>
					</tr>
					<tr>
						<td><label>损耗时间:</label></td>
						<td><input name="losstime" class="easyui-datetimebox" required="true"></td>
					</tr>
					<tr>
						<td><label>损耗数量:</label></td>
						<td><input name="lossnum" class="easyui-validatebox" ></td>
					</tr>
					<tr>
						<td><label>补货时间:</label></td>
						<td><input name="addtime" class="easyui-datetimebox" ></td>
					</tr>
				</table>			
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRoom()">Save</a>
		<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
	<script type="text/javascript">
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					roomid: $('#roomid').val(),
					goodsid: $('#goodsid').val()
				});
		 }
		 //添加
		 function newRoom(){
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认补货吗 ?',function(r){
					if (r){
						$.post('roomloss/update.do',{roomid:row.roomid},function(result){
							if (result.errorMsg){
								$.messager.show({
									title: '错误信息',
									msg: result.errorMsg
								});
							} else {
								$.messager.show({
									title: '成功提示',
									msg: result.successMsg
								});		
								$('#tt').datagrid('reload');	
							}
						},'json');
					}
				});
			}else{
				$.messager.show({
					title: '错误信息',
					msg: '请选中你要操作的行'
				});
			}
		}
	</script>
  </body>
</html>
