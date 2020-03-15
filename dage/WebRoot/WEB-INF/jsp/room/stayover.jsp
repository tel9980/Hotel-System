<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stayover.jsp' starting page</title>
    
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
  <table id="tt" class="easyui-datagrid" title="续住信息统计" style="width:100%;height:100%" align="center";
		  striped="true"	 pagination="true" fitColumns="true" toolbar="#tb" data-options="singleSelect:true,collapsible:true,url:'stayOverController/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'roomid',width:70,align:'center',sortable:true">房间号</th>
				<th data-options="field:'cusname',width:90,align:'center'">客户姓名</th>
				<th data-options="field:'cussex',width:60,align:'center'">性别</th>
				<th data-options="field:'custel',width:120,align:'center'">联系方式</th>
				<th data-options="field:'idcardtype',width:120,align:'center'">证件类型</th>
				<th data-options="field:'idcard',width:220,align:'center'">证件号</th>
				<th data-options="field:'roomtype',width:80,align:'center'">房间类型</th>
				<th data-options="field:'roomprice',width:80,align:'center'">房间价格</th>
				<th data-options="field:'begintime',width:180,align:'center'">入住时间</th>
				<th data-options="field:'staytime',width:180,align:'center',sortable:true">续住时间</th>
				<th data-options="field:'staydays',width:80,align:'center'">续住天数</th>	
				<th data-options="field:'stayroomprice',width:80,align:'center'">续住房费总计</th>

			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:3px">
			<a  class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="Add()">添加</a>
			<div style="float:right">
				<span>房间号:</span>
				<input id="roomid" style="line-height:26px;border:1px solid #ccc">
				<span>客户姓名:</span>
				<input id="cusname" style="line-height:26px;border:1px solid #ccc">
				<a  class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:600px;height:380px;padding:10px 20px;align:center"
		closed="true"  buttons="#dlg-buttons">
		<center>
			<div class="ftitle" style="font-size:20px">续住订单信息</div>
			<form id="fm" method="post">
				<table>
					<tr>
						<td><label>房间号:</label></td>
						<td><input id="roomid" name="roomid" class="easyui-validatebox" required="true"  style="width:200px"></td>
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
						<td><label>续住时间:</label></td>
						<td>
							<input name="staytime" class="easyui-datetimebox"  style="width:200px"  readonly="readonly">
						</td>
					</tr>
					<tr>
						<td><label>续住天数:</label></td>
						<td>
							<input name="days" class="easyui-validatebox"  style="width:200px" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td><label>房间总费用:</label></td>
						<td>
							<input name="roompricesum" class="easyui-validatebox"  style="width:200px" readonly="readonly">
						</td>
					</tr>
				</table>	
			</form>
			</center>
		</div>
	<div id="dlg-buttons">
		<a class="easyui-linkbutton" iconCls="icon-ok" onclick="saveCus()">保存</a>
		<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					roomid: $('#roomid').val(),
					cusname: $('#cusname').val()
				});
		 }
		  function Add(){
			$('#dlg').dialog('open').dialog('setTitle','添加续住单');
			$('#fm').form('clear');
			url = 'stayOverController/add.do';
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
		
	</script>
  </body>
</html>
