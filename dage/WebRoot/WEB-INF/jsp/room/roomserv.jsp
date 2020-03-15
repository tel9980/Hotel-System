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
    <title>房间维修记录列表</title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	</head>

	<body>
	<center>
	<table  id="tt" class="easyui-datagrid" title="房间维修记录统计" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'servController/roomserv.do',method:'post'">
		<thead >
			<tr>		
				<th hidden="true" data-options="field:'servid',width:200,sortable:true">维修ID</th>
				<th data-options="field:'servno',width:350,align:'center',sortable:true">维修编号</th>
				<th data-options="field:'roomid',width:200,align:'center',sortable:true">维修房间号</th>
				<th data-options="field:'servgoods',width:200,align:'center',sortable:true">维修物品</th>
				<th data-options="field:'servcause',width:350,align:'center',sortable:true">维修原因</th>
				<th data-options="field:'servtime',width:350,align:'center',sortable:true">报修时间</th>
				<th data-options="field:'endtime',width:350,align:'center',sortable:true">维修结束时间</th>
				<th data-options="field:'empname',width:180,align:'center',sortable:true">维修员</th>
				<th data-options="field:'emptel',width:350,align:'center',sortable:true">维修员联系方式</th>
				<th data-options="field:'servstate',width:350,align:'center',sortable:true">处理状态</th>
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb">
			<!-- 
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newDept()">添加</a>
			 -->
			 
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editServ()">修改</a>
			<div style="float:right">
				<span>维修编号:</span>
				<input id="servno" style="line-height:26px;border:1px solid #ccc">
				<span>维修房间号:</span>
				<input id="roomid" style="line-height:26px;border:1px solid #ccc">
				<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:450px;height:500px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">维修编号:</label>
					<input name="servno" class="easyui-validatebox" required="true" readonly="readonly">
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">维修房号:</label>
					<input name="roomid" class="easyui-validatebox" required="true">
				</div>

				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">维修物品:</label>
					<input name="servgoods" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem" style="padding:3px 20px">
				<label style="letter-spacing:1px;">维修原因:</label>
				<textarea rows="3" cols="14" style="vertical-align:top;" name="servcause" class="easyui-validatebox" ></textarea>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">操作人员:</label>
					<select name="empname" id="empid" style="width:145px;">
					</select>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">处理状态:</label>
					<select name="servstate" style="width:145px;">
					    <option value="已处理">已处理</option>
					    <option value="未处理">未处理</option>
					</select>
				</div>
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDept()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		<script type="text/javascript">
		
		//从房间列表直接添加
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					roomId: $('#roomid').val(),
					servno: $('#servno').val(),
				});
		 }
		 
		 //弹出添加方法
		 function newDept(){
			$('#dlg').dialog('open').dialog('setTitle','添加维修记录');
			$('#fm').form('clear');
			url = 'servController/add.do';
		 }
		  //弹出更新方法
		function editServ(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			  // alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新维修记录');
				$("#empid").empty();
						$('#dlg').dialog('open').dialog('setTitle','添加房间');			
						$("#empid").append("<option selected='selected' value=''>-----请  选  择-----</option>");
						$.ajax({
							url: "empController/serv.do",
							async:false,
							type:"post",
							dataType:"json",
							success: function(data){
								for(var i=0;i<data.length;i++){
									$("#empid").append("<option value="+data[i].empname+">"+data[i].empname+"</option>");
								}
							}
						});
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'servController/update.do?servid='+row.servid;
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请选中一行！！！'//提示信息
				 });
			}
		}
		 //保存操作
		function saveDept(){
			$('#fm').form('submit',{//给form表单绑定submit事件
				url: url ,//请求url地址
				onSubmit: function(){//对form表单校验
					return $(this).form('validate');
				},
				success: function(result){//数据保存后的回调函数
					var result = eval('('+result+')');//eval把json字符串转换为json对象  {'errorMsg':'添加失败'}
				//if (result.errorMsg){//判断，如果错误信息不为空  js非null 非0 即true
					$.messager.show({//easyui封装的浏览器右下角弹框
						title: '信息提示',//弹框标题
						msg: result.showInfo//提示信息
					});
				   if(result.suc=='true'){
						$('#dlg').dialog('close');		// 关闭弹出框
						$('#tt').datagrid('reload');	// 刷新父窗口
					}
				}
			});
		}
		 
		</script>
	</body>

</html>