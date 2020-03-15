<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>仓库采购订单审核1</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="easyui/themes/bootstrap.min.css" type="text/css">
  </head>
  
  <body>
  <center>
    <table id="tt" class="easyui-datagrid"  style="width:100%;height:600px" fitColumns='true' pagination="true" toolbar="#tb"
		 data-options="singleSelect:true,collapsible:true,url:'auditStore/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'ordernum',align:'center',width:16">采购编号</th>
				<th data-options="field:'goodsname',align:'center',sortable:true,width:10">商品名称</th>
				<th data-options="field:'innum',align:'center',width:10">商品数量</th>
				<th data-options="field:'empname',align:'center',width:10">申请员工</th>
				<th data-options="field:'inprice',align:'center',width:10">商品进价</th>
				<th data-options="field:'suplieer',align:'center',width:15">供货商</th>
				<th data-options="field:'suptel',align:'center',width:10">供货商联系方式</th>
				<th data-options="field:'submittime',align:'center',width:16">申请时间</th>
				<th id="statecheck"data-options="field:'state',align:'center',sortable:true,width:10,formatter:formatWorkingstatus">状态</th>
				<th data-options="field:'rejecttext',align:'center',sortable:true,width:20">驳回理由</th>
				<th data-options="field:'handname',align:'center',width:10">审核人</th>
				<th data-options="field:'disposetime',align:'center',width:16">处理时间</th>
			</tr>
		</thead>
	</table>

	<!-- 搜索栏  开始-->
	<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="passApply()">通过</a>
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="rejectApply()">驳回</a>
		<div style="float:right">
			<span>审核状态:</span>
			<!-- <input id="state" style="line-height:26px;border:1px solid #ccc"> -->
			<select id="state" style="line-height:26px;border:1px solid #ccc">
				<option value=""></option>
				<option value="待审核">待审核</option>
				<option value="已审核">已审核</option>
				<option value="已驳回">已驳回</option>
				<option value="已采购">已采购</option>
			</select>
			<a   class="easyui-linkbutton"  iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
		</div>
	</div>
	<!-- 搜索栏  结束-->
	<div id="dlg" class="easyui-dialog" style="width:450px;height:300px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
		<form id="fm" method="post">
			<input name="ordernum"  type="hidden">	
			<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">操作员工:</label>
				<input id="handname" name="handname1" type="text">
			</div>
			<div class="fitem" style="padding:3px 20px">
				<label style="letter-spacing:1px;">驳回理由:</label>
				<textarea required="true" rows="3" cols="30" style="vertical-align:top;" name="rejecttext" class="easyui-validatebox" ></textarea>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDept()"> 保存</a>
		<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
	
		//根据商品状态改变,字体颜色变化
		function formatWorkingstatus(val){
	
			if(val=="待审核"){
				return '<span style="color:red;">'+val+'</span>';
			}
			else {
				return '<span >'+val+'</span>';
			}
		}
	
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					state: $('#state').val(),
				});
		 }
		 
		 //通过审核方法
		function passApply(){
		    //获取选中行
			var row = $('#tt').datagrid('getSelected');
			if (row.state=='待审核'){
				$.messager.confirm('Confirm','确认通过吗?',function(r){
					if (r){
					   //jquery的ajax操作  $.get(地址，参数，回调函数，返回值类型)
					   //  $.post(地址，参数，回调函数，返回值类型)
					   //获取session中的员工姓名
			           var  handname ='${emptel.empname}';
			           //alert(handname);
			           $("#handname").val(handname);
						$.post('auditStore/pass.do',{ordernum:row.ordernum,handname:handname},function(result){
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
							msg: '此申请已处理，请重新选择！'//提示信息
				 });
			}
		}
		 //弹出驳回审核理由 
		function rejectApply(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
		  
			if (row.state=='待审核'){
			  // alert(row.id);
			     //弹出框
				//获取session中的员工姓名
		           var  handname ='${emptel.empname}';
		           //禁止更改部门名称
					$('#handname').attr("readonly","readonly");
		           $("#handname").val(handname);
				$('#dlg').dialog('open').dialog('setTitle','驳回理由');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				url = 'auditStore/reject.do';
			}else{
			     $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '此申请已处理，请重新选择！'//提示信息
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
