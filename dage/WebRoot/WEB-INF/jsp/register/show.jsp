<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>入住信息统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/validator.js"></script>
	
	
  </head>
  
  <body>
    <table id="tt" class="easyui-datagrid" title="入住信息统计" style="width:100%;height:auto"
		toolbar="#tb" fitColumns="true" pagination="true" data-options="singleSelect:true,collapsible:true,url:'register/list.do',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'ordernum',width:160,align:'center',sortable:true">订单号</th>
				<th data-options="field:'roomid',width:70,align:'center',sortable:true">房间号</th>
				<th data-options="field:'cusname',width:90,align:'center'">客户姓名</th>
				<th data-options="field:'cussex',width:60,align:'center'">性别</th>
				<th data-options="field:'custel',width:120,align:'center'">联系方式</th>
				<th data-options="field:'idcardtype',width:120,align:'center'">证件类型</th>
				<th data-options="field:'idcard',width:220,align:'center'">证件号</th>
				<th data-options="field:'roomtype',width:80,align:'center'">房间类型</th>
				<th data-options="field:'roomprice',width:80,align:'center'">房间价格</th>
				<th data-options="field:'begintime',width:180,align:'center',sortable:true">入住时间</th>
				<th data-options="field:'days',width:80,align:'center'">入住天数</th>
				<th data-options="field:'endtime',width:180,align:'center',sortable:true">离开时间</th>			
				<th data-options="field:'roompricesum',width:80,align:'center'">房费总计</th>
			</tr>
		</thead>
	</table>  
	<div id="tb" >
			<!--  <a  class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCus()">修改</a>-->
			<div style="float:right">
				<span>房间号:</span>
				<input id="roomid" style="line-height:26px;border:1px solid #ccc">
				<span>客户姓名:</span>
				<input id="cusname" style="line-height:26px;border:1px solid #ccc">
				<span>身份证号:</span>
				<input id="idcard" style="line-height:26px;border:1px solid #ccc">
				<a  class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:350px;padding:10px 20px"
	 closed="true" buttons="#dlg-buttons">
	<div class="ftitle">入住信息登记</div>
		<form id="fm" method="post">
			<div class="fitem">
				<table>
					<tr>
						<td><label>房间号:</label></td>
						<td><input name="roomid" class="easyui-validatebox" required="true" readonly="readonly" style="width:200px"></td>
					</tr>
					<tr>
						<td><label>客户姓名:</label></td>
						<td><input type="text"  class="easyui-validatebox" name="cusname" style="width:200px"></td>
					</tr>
					<tr>
						<td><label>性别:</label></td>
						<td><input type="text"  class="easyui-validatebox" name="cussex" style="width:200px"></td>
					</tr>
					<tr>
						<td><label>手机号:</label></td>
						<td><input name="custel" class="easyui-validatebox" style="width:200px"></td>
					</tr>
					<tr>
						<td><label>证件类型:</label></td>
						<td><input name="idcardtype" class="easyui-validatebox" style="width:200px"></td>
					</tr>
					<tr>
						<td><label>证件号:</label></td>
						<td><input name="idcard" class="easyui-validatebox" style="width:200px" ></td>
					</tr>
					<tr>
						<td><label>客房类型:</label></td>
						<td><input name="roomtype" class="easyui-validatebox" style="width:200px"  readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>押金:</label></td>
						<td><input name="cash" class="easyui-validatebox" style="width:200px"  readonly="readonly"></td>
					</tr>
					<tr>
						<td><label>入住时间:</label></td>
						<td>
							<input name="begintime" class="easyui-datetimebox"  style="width:200px"  readonly="readonly">
						</td>
					</tr>
					<tr>
						<td><label>离开时间:</label></td>
						<td>
							<input name="endtime" class="easyui-datetimebox"  style="width:200px" readonly="readonly">
						</td>
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
					cusname: $('#cusname').val(),
					idcard: $('#idcard').val(),
				});
		 }
		//保存
		function saveCus(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
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
						$('#dlg').dialog('close');		// close the dialog
						$('#tt').datagrid('reload');	// reload the user data
					}
				}
			});
		}
			//编辑
		function editCus(){
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','修改入住信息');
				$('#fm').form('clear');
				$('#fm').form('load',row);
				url = 'register/update';
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
