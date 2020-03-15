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
    <title>线上订单表</title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	</head>

	<body>
		
	<center>
	<table  id="tt" class="easyui-datagrid" title="顾客订单表" style="width:100%;height:530px"
			fitColumns="true" data-options="toolbar:'#tb',pagination:true, singleSelect:true,collapsible:true,url:'bookingroomController/bookingroom.do',method:'post'">
		<thead >
			<tr>		
				<th data-options="field:'orderid',width:20,sortable:true">订单编号</th>
				<th data-options="field:'cusname',width:10,sortable:true">顾客姓名</th>
				<th data-options="field:'custel',width:15,sortable:true">顾客手机号</th>
				<th data-options="field:'roomtype',width:12,sortable:true">房间类型</th>
				<th data-options="field:'days',width:12,sortable:true">入住天数</th>
				<th data-options="field:'roompricesum',width:12,sortable:true">费用</th>
				<th data-options="field:'remarks',width:12,sortable:true">顾客备注</th>
				<th data-options="field:'roomid',width:10,sortable:true">分配房号</th>
				<th data-options="field:'begintime',width:10,sortable:true">预订入住时间</th>
				<th data-options="field:'state',width:15,sortable:true">订单状态</th>
				<th data-options="field:'text',width:15,sortable:true">订单反馈</th>
				<th data-options="field:'handname',width:10,sortable:true">操作员</th>
				<th data-options="field:'distime',width:20,sortable:true">订单处理时间</th>
			</tr>
		</thead>
	</table >
	</center>
		<div id="tb" style="padding:5px">
			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editState()">订单处理</a>
			
			<div style="float:right">
				<span>房间类型:</span>
				<!-- <input id="roomtype" style="line-height:26px;border:1px solid #ccc"> -->
				<select id="roomtype" style="line-height:23px;border:1px solid #ccc;width:145px;" class="easyui-combobox" >
					<option value=""></option>
					<option value="家庭套房">家庭套房</option>
					<option value="总统套房">总统套房</option>
					<option value="标准套房">标准套房</option>
					<option value="情侣套房">情侣套房</option>
					<option value="豪华单人间">豪华单人间</option>
					<option value="情侣大床房">情侣大床房</option>
					<option value="行政房">行政房</option>
					<option value="商务房">商务房</option>
				</select>
				<span>操作员:</span>
				<input id="checkname" style="line-height:26px;border:1px solid #ccc">
				<span>预定房间状态:</span>
				<select id="state" style="line-height:23px;border:1px solid #ccc;width:145px;" class="easyui-combobox" >
					<option value=""></option>
					<option value="已确认">已确认</option>
					<option value="未确认">未确认</option>
					<option value="无法预订">无法预订</option>
					<option value="已入住">已入住</option>
				</select>
				<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			</div>
		</div>
		<div id="dlg" class="easyui-dialog" style="width:350px;height:180px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">分配房号:</label> 
					<select id="roomid" name="roomid"></select>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">操作员工:</label>
					<input name="handname"   id="handname"  type="text">
				</div>
				
			</form>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveEmp()">保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
		<script type="text/javascript">
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					roomtype: $('#roomtype').val(),//房间状态
					checkname: $('#checkname').val(),//操作员
					state: $('#state').val(),//预定状态
				});
		   }
		 //弹出更新方法
		function editState(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
		   if(row){
			if (row.state=='未确认'){
			   /* alert(row.roomtype); */
			     //弹出框
			     $('#fm').form('clear');
			      $("#roomid").empty();//清空下拉框记录
			     $('#dlg').dialog('open').dialog('setTitle','更新订单状态');
			     $.ajax({
		           url:"bookingroomController/checkRoomId.do",//请求地址
		           data:{roomtype:row.roomtype},//请求中携带的参数
		           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
		           type:"post",//设置请求类型
		           dataType:"json",//设置返回值的类型
		           success:function(data){//成功后回调的函数
		              	var option = "";
		               if(data!=''&&data!=null){
		               //循环解析返回json  拼装option
		                 for(var i=0;i<data.length;i++){
		                    option+="<option value='"+data[i].roomid+"'>"+data[i].roomid+"</option>";                   
		                 }
		                 $("#roomid").append(option);
		                 //获取session中的员工姓名
		                 var  handname ='${emptel.empname}';
		                 //alert(empname);
		                 $("#handname").val(handname);
		                 //alert($("#empname").val())
		                 //  $("#empname").textbox('setValue', empname);
		               }else{
		               		option="<option value='0'>房间已满</option>"
		               		$("#roomid").append(option);
		               		 $("#roomid").append(option);
			                 //获取session中的员工姓名
			                 var  handname ='${emptel.empname}';
			                 //alert(empname);
			                 $("#handname").val(handname);
		               }
		           },
		         });
				
				//禁止更改
				$('#handname').attr("readonly","readonly");
				
				url = 'bookingroomController/update.do?orderid='+row.orderid;
			}else{
			    $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '此申请已处理，请重新选择！'//提示信息
				 });
			}
			}else{
				 $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '至少选中一行!'//提示信息
				 });
			}
		}
		 //保存操作
		function saveEmp(){
			$('#fm').form('submit',{//给form表单绑定submit事件
				url: url,//请求url地址
				onSubmit: function(){//对form表单校验
					return $(this).form('validate');
				},
				success: function(result){//数据保存后的回调函数
					var result = eval('('+result+')');//eval把json字符串转换为json对象  {'errorMsg':'添加失败'}
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