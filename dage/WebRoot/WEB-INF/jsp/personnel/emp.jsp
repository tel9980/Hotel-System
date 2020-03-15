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
    <title>员工分页列表</title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	</head>

	<body>
	<center>
	<table  id="tt" class="easyui-datagrid" title="员工列表" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'empController/emp.do',method:'post'">
		<thead >
			<tr>		
				<th data-options="field:'empno',width:12,sortable:true">员工工号</th>
				<th data-options="field:'empname',width:12,sortable:true">员工姓名</th>
				<th data-options="field:'empsex',width:10,sortable:true">员工性别</th>
				<th data-options="field:'empidcard',width:22,sortable:true">员工身份证号码</th>
				<th data-options="field:'emptel',width:15,sortable:true">员工联系方式</th>
				<th data-options="field:'empadd',width:15,sortable:true">员工地址</th>
				<th data-options="field:'deptname',width:12,sortable:true">部门名称</th>
				<th data-options="field:'emptype',width:12,sortable:true">员工类型</th>
				<!-- <th data-options="field:'empwage',width:12,sortable:true">员工月薪</th> -->
				<th data-options="field:'empstate',width:12,sortable:true">在职状态</th>
				<th data-options="field:'password',width:12,sortable:true" hidden="true">登陆密码</th>
				<th data-options="field:'emptime',width:12,sortable:true">入职时间</th>
				<!-- <th data-options="field:'empexit',width:12,sortable:true">离职时间</th> -->
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newEmp()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editEmp()">修改</a>
			<!-- 
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyEmp()">删除</a>
			 -->
			<div style="float:right">
				<span>员工工号:</span>
				<input id="empno" style="line-height:26px;border:1px solid #ccc">
				<span>员工姓名:</span>
				<input id="empname" style="line-height:26px;border:1px solid #ccc">
				<span>部门名称:</span>
				<input id="deptname" style="line-height:26px;border:1px solid #ccc">
				<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:450px;height:480px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<!-- <div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工工号:</label>
					<input id="empNo" name="empno" class="easyui-validatebox" validType='empno'>
				</div> -->
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工姓名:</label>
					<input name="empname" class="easyui-validatebox" required="true" validType='empname'>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">身份证号:</label>
					<input id="empidcard" name="empidcard" class="easyui-validatebox" required="true" validType='empidcard'>
				</div>
				<!-- <div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工年龄:</label>
					<input id="empage" name="empage" class="easyui-validatebox" validType='empage'>
				</div> -->
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工性别:</label>
					<span class="radioSpan">
		                <input type="radio" name="empsex" value="男">男
		                <input type="radio" name="empsex" value="女">女
		            </span>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">联系方式:</label>
					<input id="emptel" name="emptel" class="easyui-validatebox" required="true"  validType='emptel'>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工地址:</label>
					<input name="empadd" class="easyui-validatebox" required="true" >
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工类型:</label>
					<select name="emptype" style="width:145px;">
					    <option value="干事" selected="selected">干事</option>
					    <option value="主管">主管</option>
					    <option value="经理">经理</option>
					    <option value="达阁至尊">达阁至尊</option>
					</select>
				</div>
				<!-- <div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">员工月薪:</label>
					<input name="empwage" class="easyui-validatebox" validType='empwage'>
				</div> -->
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">在职状态:</label>
					<span class="radioSpan">
		                <input type="radio" name="empstate" value="在职">在职</input>
		                <input type="radio" name="empstate" value="离职">离职</input>
		            </span>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">登陆密码:</label>
					<input id="pwd" name="password" class="easyui-validatebox" validType='pwdlength'>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门名称:</label>
					<input class="easyui-combobox" name="deptno" style="width:145px;"//员工表中的deptno
					data-options="
						url:'deptController/checkBoxData.do?page=1&rows=100',
						method:'get',
						valueField:'deptno', <!-- 部门表中的deptno -->
						textField:'deptname',
						panelHeight:'auto'
					">
				</div>
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveEmp()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		<script type="text/javascript">
		 //表单验证
		$.extend($.fn.validatebox.defaults.rules,{
			empidcard : {// 验证身份证
                validator : function(value) {
                    return /^\d{6}(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}(\d|X)$/i.test(value);
                },
                message : '身份证号码格式不正确'
            },
            emptel : {// 验证手机号码
                validator : function(value) {
                    return /^(13|15|18|17)\d{9}$/i.test(value);
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
            empname : {// 验证姓名
                validator : function(value) {
                    return /^[\u0391-\uFFE5]|[A-Za-z]+$/i.test(value);
                },
                message : '请正确输入姓名（输入全中文或全英文）'
            },
            empwage : {// 验证月薪
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'
            },
            
        });
        
        /*  //根据身份证号码计算年龄
        $('#empidcard').blur(function (){
			var empCard = $("#empidcard").val(); 
			if(empCard!=null&&empCard.trim()!=""){
				//获取性别
				if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) { 
					$("#gender1").val(1);//男
					$("#gender").val(1);
				} else {
					$("#gender1").val(2);//女
					$("#gender").val(2);
				}
				//获取年龄 
				var myDate = new Date(); 
				var month = myDate.getMonth() + 1; 
				var day = myDate.getDate();
				var age = myDate.getFullYear() - empCard.substring(6, 10); 
				$("#empage").val(age);
			}
		}); */
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					empNo: $('#empno').val(),
					empName: $('#empname').val(),
					deptName: $('#deptname').val(),
					empidcard: $('#empidcard').val(),
					emptel: $('#emptel').val(),
				});
		 }
		 //弹出添加方法
		 function newEmp(){
			$('#dlg').dialog('open').dialog('setTitle','添加员工');
			$('#fm').form('clear');
			   $('#empNo').val("EMP");
			   $('#pwd').val("123");
				$('#empidcard').removeAttr("readonly");
				$('#empage').attr("readonly","readonly");
			url = 'empController/add.do';
		 }
		 //弹出更新方法
		function editEmp(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			  // alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新员工');
				//禁止更改部门名称
				$('#empidcard').attr("readonly","readonly");
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'empController/update.do?empno='+row.empno;
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请选中一行！！！'//提示信息
				 });
			}
		}
		//删除数据
		function destroyEmp(){
		    //获取选中行
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认删除吗?',function(r){
					if (r){
					   //jquery的ajax操作  $.get(地址，参数，回调函数，返回值类型)
					   //  $.post(地址，参数，回调函数，返回值类型)
						$.post('empController/delete.do',{empno:row.empno},function(result){
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
		function saveEmp(){
			$('#fm').form('submit',{//给form表单绑定submit事件
				url: url ,//请求url地址
				onSubmit: function(){//对form表单校验
					//唯一性校验
					if (url=="empController/add.do") {
						$.extend($.fn.validatebox.defaults.rules, { 
						    empidcard:{
						        validator:function(value,param){
						        	var s = null;
						        	//使用ajax得到数据
									 $.ajax({
										url: "empController/required.do?page=1&rows=1000",
										data:{empidcard:value},
										async:false,//FALSE同步（等待传输）   TRUE异步
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
						    emptel:{
						        validator:function(value,param){
						        	var s = null;
									 $.ajax({
										url: "empController/required.do?page=1&rows=1000",
										data:{emptel:value},
										async:false,
										type:"post",
										dataType:"json",
										success: function(data){
											s=data;
										}
									})
									return s;
						        },
						       message:  '手机号已存在'
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
						window.location.href="power/emp.do";//刷新连接，防止编辑时报重
					}
				}
			});
		}
		</script>
	</body>

</html>