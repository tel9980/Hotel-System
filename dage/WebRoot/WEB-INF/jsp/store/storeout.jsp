<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'basic.jsp' starting page</title>
    
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
	
  </head>
  


<style type="text/css">   
       
   .ftitle { 
	   font-size: 14px;            
	   font-weight: bold;           
	   padding: 5px 0;            
	   margin-bottom: 10px;            
	   border-bottom: 1px solid #ccc;        
    }         
    .fitem {           
     	margin-bottom: 10px;        
     }             
     .fitem label {          
        display: inline-block;  
        text-align: left;                
        width: 150px;                
        font-size: 18px;                
        padding-right: 10px;            
      }             
        .fitem input {                
        width: 160px;            
      }   
  	
  </style>
  <body>
  <center>
    <table id="tt" class="easyui-datagrid" title="出库管理" style="width:100%;height:600px" fitColumns='true' pagination="true" toolbar="#tb"
		 data-options="singleSelect:true,collapsible:true,url:'storeout/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'outnumber',align:'center',sortable:true,width:10">出库编号</th>
				<th data-options="field:'goodsname',align:'center',sortable:true,width:10">商品名称</th>
				<th data-options="field:'goodtype',align:'center',width:10">商品类型</th>
				<th data-options="field:'goodsnum',align:'center',width:10">商品出库数量</th>				
				<th data-options="field:'empname',align:'center',width:10">操作员姓名</th>
				<th data-options="field:'outtime',align:'center',width:10">出库时间</th>
				<th data-options="field:'_operate',width:10,align:'center',formatter:fromatterOperation">操作</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="padding:3px">
	<a   class="easyui-linkbutton"  plain="true" onclick="addStore()"></a>
			<a   class="easyui-linkbutton"  plain="true" onclick="editStore()"></a>
			<a   class="easyui-linkbutton"  plain="true" onclick="destroyStore()"></a>
		<div style="float:right">
			<span>商品名称:</span>
			<input id="name" style="line-height:26px;border:1px solid #ccc">
			<span>起:</span>
			<input id="timeone" class="easyui-datetimebox" style="line-height:26px;border:1px solid #ccc">
			<span>止:</span>
			<input id="timetwo" class="easyui-datetimebox" style="line-height:26px;border:1px solid #ccc">
			<a   class="easyui-linkbutton" iconCls="icon-search"  plain="true" onclick="doSearch()">查询</a>
		</div>
	</div>
	
		<div id="dlg" class="easyui-dialog" style="width:600px;height:500px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			
			<form id="fm" method="post">
				<div class="fitem">
					<label>物品编号:</label>
					<input name="goodsid" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label>物品名称:</label>
					<input name="goodsname" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label>物品类型:</label>
					<input name="goodtype" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label>物品原有数量:</label>
					<input name="oldnum">
				</div>
				<div class="fitem">
					<label>物品出库数量:</label>
					<input name="goodsnum">
				</div>
				<div class="fitem">
					<label>物品当前数量:</label>
					<input name="nownum" class="easyui-validatebox" >
				</div>
				<div class="fitem">
					<label>操作员姓名:</label>
					<input name="empname" class="easyui-validatebox" >
				</div>
				<div class="fitem">
					<label>操作员电话:</label>
					<input name="emptel" class="easyui-validatebox" >
				</div>
				<div class="fitem">
					<label>房间管理员编号:</label>
					<input name="roomempid" class="easyui-validatebox" >
				</div>
				<div class="fitem">
					<label>房间管理员电话:</label>
					<input name="emptel" class="easyui-validatebox" >
				</div>
				<div class="fitem">
					<label>出库时间:</label>
					
					 <input class="easyui-datetimebox" name="carrytime"
        data-options="required:true,showSeconds:true" value="2018/10/10 2:3" style="width:150px">
					
				</div>
				
			</form>
		</div>
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveStore()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
	<script type="text/javascript">
	
	function fromatterOperation(){
			return "<input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)'" 
			+"onclick='destroyStore()' value='删除'>"
		}
	
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					goodsid: $('#id').val(),
					goodsname: $('#name').val(),
					outtime:$('#timeone').val(),
					outtimetwo:$('#timetwo').val()
				});
		 }
		 
		
		//删除数据
		function destroyStore(){
		    //获取选中行
			var row = $('#tt').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确认删除吗?',function(r){
					if (r){
					   //jquery的ajax操作  $.get(地址，参数，回调函数，返回值类型)
					   //  $.post(地址，参数，回调函数，返回值类型)
					   
						$.post('storeout/del.do',{goodsid:row.goodsid},function(result){
							if (result.suc=='true'){
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
			}
		}

		</script>
	
  </body>
</html>
