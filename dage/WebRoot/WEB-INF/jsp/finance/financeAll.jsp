<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'financeAll.jsp' starting page</title>
    
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
  
  <body>
     <table id="tt" class="easyui-datagrid"  style="width:100%;height:550px" fitColumns='true' pagination="true" toolbar="#tba"
		 data-options="singleSelect:true,collapsible:true,url:'financeAll/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'time',align:'center',width:16">时间</th>
				<th data-options="field:'income',align:'center',sortable:true,width:10">住房收入</th>
				<th data-options="field:'outcome',align:'center',width:10">采购支出</th>
				<th data-options="field:'in',align:'center',width:10" formatter="incomeOperation">收入详情</th>
				<th data-options="field:'out',align:'center',width:10" formatter="outcomeOperation">支出详情</th>
			</tr>
		</thead>
	</table>
	<div id="dlg" class="easyui-dialog" style="width:600px;height:400px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<center>
				<table border="1px" width="550px" style="text-align:center"  >	
					 <thead >
					 <td>订单编号</td>
					 <td>房间号 </td> 
					 <td>入住消费</td>
					 <td>房间消费 </td>
					 <td>结账时间 </td>
					 </thead>
				<tbody id="intb"> </tbody> 
				</table>
		  </center>
	</div>
	<div id="dlg-buttons">
		<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<div id="outcome" class="easyui-dialog" style="width:1050px;height:400px;padding:10px 20px"
		closed="true"  buttons="#outcome-buttons" pagination="true">
		<center>
				<table border="1px  black solid "  style="text-align:center">	
					 <thead>
					 <td>订单编号</td>
					 <td>商品编号 </td> 
					 <td>商品名称</td>
					 <td>商品类型 </td>
					 <td>商品数量 </td>
					 <td>商品单价 </td>
					 <td>供应商</td>
					 <td>供应商电话</td>
					 <td>时间</td>
					 <td>操作员</td>
					  </thead>
					  <tbody id="outtb">
					  </tbody> 
				</table>
		</center>
	</div>
	<div id="outcome-buttons">
		<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#outcome').dialog('close')">取消</a>
	</div>
  </body>
  <script type="text/javascript">
  //收入详情按钮
  	function incomeOperation(){
  		return "<input type='button' style='color:white;border:0;background-color:green'  onclick='income()' value='收入详情'>";
  	}
  	//支出详情按钮
  	function outcomeOperation(){
  	return "<input type='button' onclick='outcome()' style='color:white;border:0;background-color:red' value='支出详情'>"
  	}
  	function income(){
  		var row = $('#tt').datagrid('getSelected');
  		$('#dlg').window('center');
  		$("#intb").empty();
  		if(row!=null){
  		$.ajax({
  				 url:'roomUseController/pag.do',
  				 type:'post',
	             data:{time:row.time},
	             dataType:'json',
	             async:false,//同步
	             success:function(data){
	             
	                if(data!=''){
  		$('#dlg').dialog('open').dialog('setTitle','收入详情');
	                var str="";
		                 for(var i=0;i<data.length;i++){
	             		 	str+="<tr><td>"+data[i].orderid+"</td><td>"+data[i].roomid+"</td><td>"+data[i].pricesum+"</td><td>"+data[i].usesum+"</td><td>"+data[i].time+"</td></tr>"
		                 }
		               	$("#intb").append(str);
	                }else{
	                	$('#dlg').dialog('close');
	                	 $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '老板任性不想营业！！！'//提示信息
				 });
	                }
	             }
	          });
  		}
  	}
  	function outcome(){
  		var row = $('#tt').datagrid('getSelected');
  		$('#outcome').window('center');
  		$("#outtb").empty();
  		if(row!=null){
  		$.ajax({
  				 url:'purchaseStore/pag.do',
  				 type:'post',
	             data:{time:row.time},
	             dataType:'json',
	             async:false,//同步
	             success:function(data){
	             
	                if(data!=''){
  		$('#outcome').dialog('open').dialog('setTitle','支出详情');
	                var str="";
		                 for(var i=0;i<data.length;i++){
	             		 	str+="<tr><td>"+data[i].ordernum+"</td><td>"+data[i].goodsid+"</td><td>"+data[i].goodsname+"</td><td>"+data[i].goodtype+"</td><td>"+data[i].innum+"</td><td>"+data[i].inprice+"</td><td>"+data[i].suplieer+"</td><td>"+data[i].suptel+"</td><td>"+data[i].submittime+"</td><td>"+data[i].handname+"</td></tr>"
		                 }
		               	$("#outtb").append(str);
	                }else{
	                $('#outcome').dialog('close');
	                	 $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '今天进货小哥哥撩小姐姐去了！！！'//提示信息
				 });
	                }
	             }
	          });
  		}
  	}
  </script>
</html>
