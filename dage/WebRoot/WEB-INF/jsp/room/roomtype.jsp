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
    <title>部门分页列表</title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	</head>

	<body>
	<center>
	<table  id="tt" class="easyui-datagrid" title="房间类型表" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'roomtype/show.do',method:'post'">
		<thead >
			<tr>		
				<th data-options="field:'id',width:200,sortable:true" hidden="true">部门编号</th>
				<th data-options="field:'roomtype',width:200,sortable:true">房间类型</th>
				<th data-options="field:'roomprice',width:200,sortable:true">房间价格</th>
				<th data-options="field:'cash',width:350,sortable:true">房间押金</th>
				<th data-options="field:'state',width:350,sortable:true">使用状态</th>
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newDept()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDept()">修改</a>
			<!-- 
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyDept()">删除</a>
			 -->
		</div>
		<div id="dlg" class="easyui-dialog" style="width:450px;height:320px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<!-- <div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门编号:</label>
					<input name="deptno" class="easyui-validatebox" validType='deptno' id="dno">
				</div> -->
				<div class="fitem" style="padding:3px 20px">
					<input type="hidden" name="id" class="easyui-validatebox"   >
					<label style="letter-spacing:1px;">房间类型:</label>
					<input name="roomtype" class="easyui-validatebox" required="true" >
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">房间价格:</label>
					<input name="roomprice" class="easyui-validatebox" required="true"  >
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">房间押金:</label>
					<input name="cash" class="easyui-validatebox" required="true"  >
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">使用状态:</label>
					<span class="radioSpan">
		                <input type="radio" name="state" value="使用中">使用中</input>
		                <input type="radio" name="state" value="停用">停用</input>
		            </span>
				</div>
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDept()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		<script type="text/javascript">
		
		 //弹出添加方法
		 function newDept(){
			$('#dlg').dialog('open').dialog('setTitle','添加房型');
			$('#fm').form('clear');
			url = 'roomtype/add.do';
		 }
		 //弹出更新方法
		function editDept(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			  // alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新房间类型');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'roomtype/update.do?id='+row.id;
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
				success:function(result){//数据保存后的回调函数
					var result = eval('('+result+')');//eval把json字符串转换为json对象  {'errorMsg':'添加失败'}
				
					$.messager.show({//easyui封装的浏览器右下角弹框
						title: '信息提示',//弹框标题
						msg: result.showInfo//提示信息
					});
				   if(result.suc=='true'){
						$('#dlg').dialog('close');		// 关闭弹出框
						$('#tt').datagrid('reload');	// 刷新父窗口
						window.location.href="roomtype/jsp.do";//刷新连接，防止编辑时报重
					}
				}
			});
		}
		</script>
	</body>

</html>