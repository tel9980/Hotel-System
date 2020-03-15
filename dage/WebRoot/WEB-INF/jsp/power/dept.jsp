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
	<table  id="tt" class="easyui-datagrid" title="部门列表" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'deptController/dept.do',method:'post'">
		<thead >
			<tr>		
				<th data-options="field:'deptno',width:200,sortable:true">部门编号</th>
				<th data-options="field:'deptname',width:200,sortable:true">部门名称</th>
				<th data-options="field:'deptlim',width:350,sortable:true">部门介绍</th>
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newDept()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDept()">修改</a>
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="givePower()">权限添加</a>
			<!-- 
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyDept()">删除</a>
			 -->
			<div style="float:right">
				<span>部门编号:</span>
				<input id="deptno" style="line-height:26px;border:1px solid #ccc">
				<span>部门名称:</span>
				<input id="deptname" style="line-height:26px;border:1px solid #ccc">
				<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:450px;height:320px;padding:10px 20px;top:100px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<!-- <div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门编号:</label>
					<input name="deptno" class="easyui-validatebox" validType='deptno' id="dno">
				</div> -->
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门名称:</label>
					<input name="deptname" class="easyui-validatebox" validType='deptname' id="dna">
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门介绍:</label>
					<textarea rows="3" cols="14" style="vertical-align:top;" name="deptlim" class="easyui-validatebox" >
					</textarea>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">部门状态:</label>
					<span class="radioSpan">
		                <input type="radio" name="deptstate" value="使用中">使用中</input>
		                <input type="radio" name="deptstate" value="注销">注销</input>
		            </span>
				</div>
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDept()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
		
		<div id="dlga" class="easyui-dialog" style="width:400px;height:680px;padding:10px 20px;top:50px;"
			closed="true"  buttons="#dlg-buttonsa">
			<form id="fma" method="post">
				<div class="fitem">
					<label>部门名称:</label>
					<input name="deptname" class="easyui-validatebox" required="true">
					 <input name="deptno" type="hidden">
					 <input id="powerIds" name="powerIds" type="hidden">
				</div>
				<div class="fitem">
					<label>权限选择:</label>
				  <div class="easyui-panel" style="padding:5px">
					  <ul id="ttree" class="easyui-tree" data-options="method:'get',animate:true,checkbox:true"></ul>
				  </div>
				 
				</div>
				
			</form>
		</div>
		<div id="dlg-buttonsa">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRoleAndPowers()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlga').dialog('close')">取消</a>
		</div>
		
		
		
		<script type="text/javascript">
		
		function givePower(){
		  var row = $('#tt').datagrid('getSelected');
		  
			if (row){
		          //动态给树添加url
				  $("#ttree").tree({
				      url:'power/checkedTree.do?deptno='+row.deptno
				     //url:'jsp/role/tree_data1.json'
				  });
			  
			 	$('#fma').form('clear');
			 		//$('#ttree').tree('clear');
			   	$('#dlga').dialog('open').dialog('setTitle','授权');
			   	$('#fma').form('load',row);
		   	}else{
		   	   $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请至少选中一行！！！'//提示信息
				 });
		   	}
		 }
		 //保存授权
		 function saveRoleAndPowers(){
		        //获取选中的所有节点
			    var nodes = $('#ttree').tree('getChecked');
				var s = '';
				//循环每一个节点
				for(var i=0; i<nodes.length; i++){
					if (s != '') s += ',';
					s += nodes[i].id;
				}
				//赋值，目的向服务器传送数据
				$("#powerIds").val(s);
				//alert(s);
				//提交form表单
				$('#fma').form('submit',{//给form表单绑定submit事件
						url: "power/saveRoleAndPower.do",//请求的url地址
						onSubmit: function(){//对form表单校验
							return $(this).form('validate');
						},
						success: function(result){//数据保存后的回调函数
							var result = eval('('+result+')');//eval把json字符串转换为json对象  {'errorMsg':'添加失败'}
							 //alert(result.errorMsg);
							//if (result.errorMsg){//判断，如果错误信息不为空  js非null 非0 即true
								$.messager.show({//easyui封装的浏览器右下角弹框
									title: '信息提示',//弹框标题
									msg: result.showInfo//提示信息
								});
							//} else {
							   if(result.suc=='true'){
									$('#dlga').dialog('close');		// 关闭弹出框
									$('#tt').datagrid('reload');	// 刷新父窗口
								}
							//}
						}
			    });
		 }
		
		
		
		
		
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					deptNo: $('#deptno').val(),
					deptName: $('#deptname').val()
				});
		 }
		 //弹出添加方法
		 function newDept(){
			$('#dlg').dialog('open').dialog('setTitle','添加部门');
			$('#fm').form('clear');
			$('#dna').removeAttr("readonly");
			url = 'deptController/add.do';
		 }
		 //弹出更新方法
		function editDept(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			  // alert(row.id);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新部门');
				//禁止更改部门名称
				$('#dna').attr("readonly","readonly");
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'deptController/update.do?deptno='+row.deptno;
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请选中一行！！！'//提示信息
				 });
			}
		}
		//删除数据
		function destroyDept(){
		    //获取选中行
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认删除吗?',function(r){
					if (r){
					   //jquery的ajax操作  $.get(地址，参数，回调函数，返回值类型)
					   //  $.post(地址，参数，回调函数，返回值类型)
						$.post('deptController/delete.do',{deptno:row.deptno},function(result){
							if (result.suc){
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
		function saveDept(){
			$('#fm').form('submit',{//给form表单绑定submit事件
				url: url ,//请求url地址
				onSubmit: function(){//对form表单校验
					if (url=="deptController/add.do") {
						$.extend($.fn.validatebox.defaults.rules, { 
						    deptname:{
					        validator:function(value,param){
					        	var s = null;
								 $.ajax({
									url: "deptController/required.do?page=1&rows=1000",
									data:{deptName:value},
									async:false,
									type:"post",
									dataType:"json",
									success: function(data){
										s=data;
									}
								})
								return s
					        },
					        message:  '部门名称已存在'
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
						window.location.href="power/dept.do";//刷新连接，防止编辑时报重
					}
				}
			});
		}
		</script>
	</body>

</html>