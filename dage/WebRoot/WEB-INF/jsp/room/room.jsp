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
	<script type="text/javascript" src="easyui/validator.js"></script>
	
	
  </head>
  
  <body>
    <table id="tt" class="easyui-datagrid" title="客房管理" style="width:100%;height:100%"
		toolbar="#tb" fitColumns="true" pagination="true" data-options="singleSelect:true,collapsible:true,url:'roomController/page.do',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'roomid',width:70,align:'center',sortable:true">房间号</th>
				<th data-options="field:'roomtype',width:90,align:'center',sortable:true">房间类型</th>
				<th data-options="field:'roomstate',width:90,align:'center',sortable:true">房间状态</th>
				<th data-options="field:'roomprice',width:80,align:'center'">房间价格</th>
				<th data-options="field:'roomcash',width:80,align:'center'">房间押金</th>
				<th data-options="field:'roommanage',width:100,align:'center',sortable:true">房间管理员</th>
				<th data-options="field:'managephone',width:180,align:'center'">管理员联系方式</th>
				<th data-options="field:'roompicpath',width:400,align:'center'">图片路径</th>
				<th data-options="field:'roompicname',width:150,align:'center'">图片名称</th>
				<th data-options="field:'other',width:260,align:'center'">备注</th>
			</tr>
		</thead>
	</table>  
	<div id="tb" style="padding:5px">
			<a  class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRoom()">添加</a>
			<a  class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRoom()">修改</a>
			<a  class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyRoom()">删除</a>
			<div style="float:right">
				<span>房间号:</span>
				<input id="roomid" style="line-height:26px;border:1px solid #ccc">
				<span>房间管理员:</span>
				<input id="roommanage" style="line-height:26px;border:1px solid #ccc">
				<a  class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:350px;padding:10px 20px;top:50px"
	 closed="true" buttons="#dlg-buttons">
	<div class="ftitle">客房信息</div>
		<form id="fm" method="post" enctype="multipart/form-data">
			<div class="fitem">
				<table>
					<tr>
						<td><label>房间号:</label></td>
						<td><input id="room" name="roomid" class="easyui-validatebox" required="required"
								    validType="checkroomid" ></td>
					</tr>
					<tr>
						<td><label>客房类型:</label></td>
						<td><select name="roomtype" id="roomtype" required="required">
						</select></td>
					</tr>
					<tr>
						<td><label>客房状态:</label></td>
						<td><select name="roomstate" required="required">
							<option value="空闲" selected="selected">空闲</option>
							<option value="已入住" >已入住</option>
							<option value="维修中" >维修中</option>
							<option value="打扫中" >打扫中</option>
							<option value="已预订" >已预订</option>
						</select></td>
					</tr>
					<tr>
						<td><label>客房价格:</label></td>
						<td><input name="roomprice" class="easyui-validatebox" id="roomprice" required="required"></td>
					</tr>
					<tr>
						<td><label>客房押金:</label></td>
						<td><input name="roomcash" class="easyui-validatebox" id="roomcash" required="required"></td>
					</tr>
					<tr>
						<td><label>客房管理员:</label></td>
						<td>
							<select id="manage" name="roommanage" required="required"></select>
						</td>
					</tr>
					<tr>
						<td><label>客房管理员联系方式:</label></td>
						<td><input id="phone" name="managephone" class="easyui-validatebox" required="required"></td>
					</tr>
					<tr>
						<td><label>客房图片:</label></td>
						<td><input type="file" name="roompic" class="easyui-validatebox" >
							<input type="hidden" name="roompicpath" class="easyui-validatebox">
							<input type="hidden" name="roompicname" class="easyui-validatebox">
						</td>
					</tr>
					<tr>
						<td><label>备注:</label></td>
						<td>
							<input name="other">
						</td>
					</tr>
				</table>			
			</div>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRoom()">保存</a>
		<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
		//查询方法
		$(function(){
			$("#manage").change(function(){
				if($("#manage").val()!=0){
					$.ajax({
						url:"empController/roomone.do?page=1&rows=1000&empName="+$("#manage").val(),
						async:false,
						type:"post",
						dataType:"json",
						success: function(data){
							$("#phone").val(data[0].emptel);
						}
					});
				}else{
					$("#phone").val("  ");
				}
			});
			$("#roomtype").change(function(){
				if($("#roomtype").val()!=0){
					$.ajax({
						url:"roomtype/showone.do?roomtype="+$("#roomtype").val(),
						async:false,
						type:"post",
						dataType:"json",
						success: function(data){
							$("#roomprice").val(data[0].roomprice);
							$("#roomcash").val(data[0].cash);
						}
					});
				}else{
					$("#roomprice").val("  ");
					$("#roomcash").val("  ");
				}
			});	
		});
		 function doSearch(){
				$('#tt').datagrid('load',{
					roomid: $('#roomid').val(),
					roommanage: $('#roommanage').val()
				});
		 }
		 //添加
		 function newRoom(){
		 	$('#fm').form('clear');
			$("#manage").empty();
			$("#roomtype").empty();
			$('#dlg').dialog('open').dialog('setTitle','添加房间');			
			$("#manage").append("<option selected='selected' value=''>-----请  选  择-----</option>");
			$.ajax({
				url: "empController/room.do",
				async:false,
				type:"post",
				dataType:"json",
				success: function(data){
					for(var i=0;i<data.length;i++){
						$("#manage").append("<option value="+data[i].empname+">"+data[i].empname+"</option>");
					}
				}
			});
			$("#roomtype").append("<option selected='selected' value=''>-----请  选  择-----</option>");
			$.ajax({
				url: "roomtype/showall.do",
				async:false,
				type:"post",
				dataType:"json",
				success: function(data){
					for(var i=0;i<data.length;i++){
						$("#roomtype").append("<option value="+data[i].roomtype+">"+data[i].roomtype+"</option>");
					}
				}
			});
			url = 'roomController/add.do';
		}
		//保存
		function saveRoom(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
				if(url=="roomController/add.do"){
					$.extend($.fn.validatebox.defaults.rules, { 
					    checkroomid:{
					        validator:function(value,param){
					        	var s = null;
					        	var len =value.length;
					        	var f = len >= 3 && len <= 4;
								 $.ajax({
									url: "roomController/required.do",
									data:{roomid:value},
									async:false,
									type:"post",
									dataType:"json",
									success: function(data){
										s=data;
									}
								})
								return s&&f
					        },
					        message:  '房间号已存在或房间号（三位或四位数字）不合理'
					    },
					});
				}
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
						$('#dlg').dialog('close');		
						$('#tt').datagrid('reload');	
						window.location.href="roomController/room.do";
					}
				}
			});
		}
		//编辑
		function editRoom(){
			
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$("#roomtype").empty();
				$("#manage").empty();
				$('#fm').form('clear');				
				$("#manage").append("<option  value=''>-----请  选  择-----</option>");
				$("#roomtype").append("<option  value=''>-----请  选  择-----</option>");
				$('#dlg').dialog('open').dialog('setTitle','添加房间');			
				$.ajax({
					url: "empController/room.do",
					async:false,
					type:"post",
					dataType:"json",
					success: function(data){
						for(var i=0;i<data.length;i++){
							$("#manage").append("<option value="+data[i].empname+">"+data[i].empname+"</option>");
						}
					}
				});
				$.ajax({
					url: "roomtype/showall.do",
					async:false,
					type:"post",
					dataType:"json",
					success: function(data){
						for(var i=0;i<data.length;i++){
							$("#roomtype").append("<option value="+data[i].roomtype+">"+data[i].roomtype+"</option>");
						}
					}
				});
				$('#fm').form('load',row);
				url = 'roomController/update.do?id='+row.roomid;
			}else{
				$.messager.show({
					title: '错误信息',
					msg: '请选中你要操作的行'
				});
			}
		}
		function destroyRoom(){
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认删除吗 ?',function(r){
					if (r){
						$.post('roomController/del.do',{roomid:row.roomid},function(result){
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
