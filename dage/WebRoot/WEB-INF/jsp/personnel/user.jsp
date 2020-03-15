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
    <title>顾客分页列表</title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	</head>

	<body>
	<center>
	<table  id="tt" class="easyui-datagrid" title="顾客列表" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'userController/user.do',method:'post'">
		<thead >
			<tr>		
				<th data-options="field:'userno',width:12,sortable:true">会员编号</th>
				<th data-options="field:'account',width:12,sortable:true">账号(手机号)</th>
				<th data-options="field:'password',width:12,sortable:true"  hidden="true">密码</th>
				<th data-options="field:'username',width:12,sortable:true">顾客姓名</th>
				<th data-options="field:'useridcard',width:24,sortable:true">顾客身份证号码</th>
				<th data-options="field:'usercount',width:20,sortable:true">卡内余额</th>
				<th data-options="field:'level',width:12,sortable:true">会员等级</th>
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
			<!-- 
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
			 -->
			<div style="float:right">
				<span>账号(手机号):</span>
				<input id="account" style="line-height:26px;border:1px solid #ccc">
				<span>顾客姓名:</span>
				<input id="username" style="line-height:26px;border:1px solid #ccc">
				<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:450px;height:380px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">账户(手机):</label>
					<input id="account" required="true"  name="account" class="easyui-validatebox" validType='account' />
					
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:3px;">用户密码:</label>
					<input name="password" class="easyui-validatebox" required="true"  validType='pwdlength'/>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:3px;">顾客姓名:</label>
					<input name="username" required="true"  class="easyui-validatebox" validType='username'/>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:3px;">身份证号:</label>
					<input id="useridcard" required="true"  class="easyui-validatebox"  name="useridcard" validType='useridcard'/>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:3px;">充值金额:</label>
					<input id="usercount" required="true"  name="usercount" class="easyui-validatebox">
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:3px;">会员等级:</label>
					<input id="level" required="true"  name="level" class="easyui-validatebox">
					<!-- <select name="level" style="width:145px;">
					    <option value="VIP1">VIP1</option>
					    <option value="VIP2">VIP2</option>
					    <option value="VIP3">VIP3</option>
					</select> -->
				</div>
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		<script type="text/javascript">
		//表单验证
		$.extend($.fn.validatebox.defaults.rules,{
			useridcard : {// 验证身份证
                validator : function(value) {
                    return /^\d{6}(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}(\d|X)$/i.test(value);
                },
                message : '身份证号码格式不正确'
            },
            account : {// 验证手机号码
                validator : function(value) {
                    return /^(13|15|18)\d{9}$/i.test(value);
                },
                message : '手机号码格式不正确'
            },
            pwdlength : {//验证密码长度
                validator : function(value) {
                    var len = $.trim(value).length;
                    return len >= 3 && len <= 10;
                },
                message : '输入内容长度必须介于3和10之间.'
            },
            username : {// 验证姓名
                validator : function(value) {
                    return /^[\u0391-\uFFE5]|[A-Za-z]+$/i.test(value);
                },
                message : '请正确输入姓名（输入全中文或全英文）'
            },
        });
		
		
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					userNo: $('#userno').val(),
					userName: $('#username').val(),
					account: $('#account').val(),
					useridcard: $('#useridcard').val(),
				});
		 }
		 //弹出添加方法
		 function newUser(){
			$('#dlg').dialog('open').dialog('setTitle','添加顾客');
			$('#fm').form('clear');
			$('#userNo').removeAttr("readonly");
			$('#useridcard').removeAttr("readonly");
			 $('#usercount').blur(function (){
				var money = $("#usercount").val(); 
				if(money<1000){
					$("#level").val('VIP1');
				}else if(money<3000){
					$("#level").val('VIP2');
				}else if(money<6000){
					$("#level").val('VIP3');
				}else if(money<10000){
					$("#level").val('VIP4');
				}else{
					$("#level").val('VIP5');
				}
			});
			//禁止更改会员等级
			$('#level').attr("readonly","readonly");
			url = 'userController/add.do';
		 }
		 //弹出更新方法
		function editUser(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			  // alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新顾客');
				//禁止更改部门编号和部门名称
				$('#userNo').attr("readonly","readonly");
				$('#useridcard').attr("readonly","readonly");
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'userController/update.do?userno='+row.userno;
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请选中一行！！！'//提示信息
				 });
			}
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
						$.post('userController/delete.do',{userno:row.userno},function(result){
							if (result.suc=='true'){
								$('#tt').datagrid('reload');	// 更新父窗口
								$.messager.show({	// show error message
									title: '弹窗提示',
									msg: result.showInfo
								});
							} else {
								$.messager.show({	// show error message
									title: '弹窗提示',
									msg: result.showInfo
								});
							}
						},'json');
					}
				});
			}else{
			   $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请选中一行！！！'//提示信息
				 });
			}
		}
		 //保存操作
		function saveUser(){
			$('#fm').form('submit',{//给form表单绑定submit事件
				url: url ,//请求url地址
				onSubmit: function(){//对form表单校验
					if (url=="userController/add.do") {
						$.extend($.fn.validatebox.defaults.rules, { 
						    account:{
					        validator:function(value,param){
					        	var s = null;
								 $.ajax({
									url: "userController/required.do?page=1&rows=1000",
									data:{account:value},
									async:false,
									type:"post",
									dataType:"json",
									success: function(data){
										s=data;
									}
								})
								return s;
					        },
					        message:  '联系方式已存在'
						  },
						  useridcard:{
					        validator:function(value,param){
					        	var s = null;
								 $.ajax({
									url: "userController/required.do?page=1&rows=1000",
									data:{useridcard:value},
									async:false,
									type:"post",
									dataType:"json",
									success: function(data){
										s=data;
									}
								})
								return s;
					        },
					        message:  '身份证号已存在'
						  },
						});
					}
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
						window.location.href="power/user.do"; //刷新连接，防止编辑时报重
					}
				}
			});
		}
		</script>
	</body>

</html>