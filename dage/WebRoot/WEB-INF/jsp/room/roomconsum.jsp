<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>房间消费记录统计</title>
    
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
  <link rel="stylesheet" href="easyui/themes/bootstrap.min.css" type="text/css"></head>
  <body>
   <table id="tt" class="easyui-datagrid" title="房间消费记录统计" style="width:100%;height:100%" align="center";
		  striped="true"	 pagination="true" fitColumns="true" toolbar="#tb" data-options="singleSelect:true,collapsible:true,url:'roomConsumController/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'ordernum',width:180,align:'center'" sortable="true">记账单号</th>
				<th data-options="field:'roomid',width:200,align:'center'">房间号</th>
				<th data-options="field:'goodsid',width:200,align:'center'">商品编号</th>
				<th data-options="field:'goods',width:200,align:'center'">商品名称</th>
				<th data-options="field:'price',width:200,align:'center'">商品单价</th>
				<th data-options="field:'num',width:200,align:'center',sortable:true">商品数量</th>
				<th data-options="field:'optime',width:200,align:'center'">操作时间</th>
				<th data-options="field:'opemp',width:200,align:'center'">操作员</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:3px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
			<div style="float:right">
			<span>记帐单号ID:</span>
			<input id="id" style="line-height:26px;border:1px solid #ccc">
			<span>商品数量:</span>
			<input id="num" style="line-height:26px;border:1px solid #ccc">
			<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
	
		<div id="dlg" class="easyui-dialog" style="width:600px;height:380px;padding:10px 20px;align:center"
		closed="true"  buttons="#dlg-buttons">
		<center>
		
			<div class="ftitle">进货信息</div>
			<form id="fm" method="post">
			<table class="table table-hover" width="100%" style="text-align:center ;font-size:20px;font-color:orange;">
				<tr>
					<td>商品名称:</td>
					<td><input name="goods" class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td>商品单价</td>
					<td><input name="price"  class="easyui-validatebox"></td>
				</tr>
				<tr>
					<td>商品数量:</td>
					<td><input name="num" class="easyui-validatebox" ></td>
				</tr>
				<tr>
        				<td>操作时间:</td>
					<td><input name="optime" class="easyui-datetimebox" ></td>
				</tr>
				<tr>
        				<td>操作员:</td>
					<td><input name="opemp" class="easyui-validatebox" ></td>
				</tr>
			</table>
			</center>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		<script type="text/javascript">
			//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					id: $('#id').val(),
					num: $('#num').val()
				});
		 }
			//弹出添加方法
		 function newUser(){
			$('#dlg').dialog('open').dialog('setTitle','添加进货信息');
			$('#fm').form('clear');
			url = 'roomConsumController/add.do';
		}
		//弹出更新方法
		function editUser(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			   //alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新进货信息');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'roomConsumController/update.do?id='+row.id;
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请至少选中一行！！！'//提示信息
				 });
			}
		}
		
		function saveUser(){
	$('#fm').form('submit',{//给 form表单绑定submit事件
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			//if (result.errorMsg){
				$.messager.show({
					title: '信息提示',
					msg: result.errorinfo
				});
			//} else {
			if(result.suc=='true'){
				$('#dlg').dialog('close');		// close the dialog
				$('#tt').datagrid('reload');	// reload the user data
			}
		}
	});
}
//删除数据
		function destroyUser(){
		    //获取选中行
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认删除吗?',function(r){
					if (r){
					   //jquery的ajax操作  $.get(地址，参数，回调函数，返回值类型)
					   //  $.post(地址，参数，回调函数，返回值类型)
						$.post('roomConsumController/delete.do',{id:row.id},function(result){
							if (result.success){
							$.messager.show({	// show error message
									title: '温馨提示',
									msg: result.errorMsg
								});
								$('#tt').datagrid('reload');	// 更新父窗口
							} else {
								$.messager.show({	// show error message
									title: '错误提示',
									msg: result.errorMsg
								});
							}
						},'json');
					}
				});
			}else{
			   $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请至少选中一行！！！'//提示信息
				 });
			}
		}
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

