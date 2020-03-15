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
    <table id="tt" title="损耗管理" class="easyui-datagrid"  style="width:100%;height:100%" fitColumns='true' pagination="true" toolbar="#tb"
		 data-options="singleSelect:true,collapsible:true,url:'storeLoss/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'goodsid',align:'center',sortable:true,width:10">商品编号</th>
				<th data-options="field:'goodsname',align:'center',sortable:true,width:10">商品名称</th>
				<th data-options="field:'goodtype',align:'center',width:10">商品类型</th>
				<th data-options="field:'goodsnum',align:'center',width:10">商品数量</th>
				<th data-options="field:'inprice',align:'center',width:10">商品进价</th>
				<th data-options="field:'empname',align:'center',width:10">统计员工姓名</th>
				<th data-options="field:'losstime',align:'center',width:10">损坏时间</th>
				<th data-options="field:'op',align:'center',width:10" formatter="fromatterOperation">操作</th>
			</tr>
		</thead>
	</table>


	<div id="tb" style="padding:3px">
		
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addStore()">添加</a>
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
	
		<div id="dlg" class="easyui-dialog" style="width:600px;height:400px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			
			<form id="fm" method="post">
				<div class="fitem">
					<label>商品编号:</label>
					<input name="goodsid" class="easyui-validatebox" onchange="getStoreById(this)" required="true">
				</div>
				<div class="fitem">
					<label>商品名称:</label>
					<input name="goodsname" id="goodsname" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem">
					<label>商品类型:</label>
					<input name="goodtype" id="goodtype" class="easyui-validatebox" required="true">
			      </div>
				<div class="fitem">
					<label>商品进价:</label>
					<input name="inprice"  id="inprice" class="easyui-validatebox" validType='numbers'>
				</div>
				<div class="fitem">
					<label>统计员工姓名:</label>
					<input name="empname" id="empid"  class="easyui-validatebox"  >
				</div>
				<div class="fitem">
					<label>商品数量:</label>
					<input name="goodsnum" class="easyui-validatebox" validType='numbers'>
				</div>
				<div class="fitem">
					<label>损坏时间:</label>
					<input name="losstime" class="easyui-datetimebox" >
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveStore()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
	<script type="text/javascript">
	//form表单数字验证
		$.extend($.fn.validatebox.defaults.rules,{
			numbers : {// 验证整数或小数
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'
            },
		});
	
	function fromatterOperation(){
			return "<input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)'" 
			+"onclick='destroyStore()' value='删除'><input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)'" 
			+"onclick='editStore()' value='修改'>"
		}
	
		//查询方法
		 function doSearch(){
				$('#tt').datagrid('load',{
					goodsid: $('#id').val(),
					goodsname: $('#name').val(),
					losstime:$('#timeone').val(),
					losstimetwo:$('#timetwo').val()
				});
		 }
		 //弹出添加方法
		 function addStore(){
			$('#dlg').dialog('open').dialog('setTitle','添加商品');
			$('#fm').form('clear');
			var empname='${emptel.empname}';
			 $('#empid').val(empname);
			url = 'storeLoss/add.do';
		}
		
		
	 function getStoreById(t){	 
       var goodsId = $(t).val();
	      $.ajax({
	           url:"store/getStore.do",//请求地址
	           data:{goodsid:$(t).val()},//请求中携带的参数
	           type:"post",//设置请求类型
	           dataType:"json",//设置返回值的类型
	           success:function(data){//成功后回调的函数
	               if(data!=''&&data!=null){
	                  $("#goodsname").val(data.goodsname);
	                  $("#goodsname").attr("readonly","readonly");
	                  $("#goodtype").val(data.goodtype);
	                  $("#goodtype").attr("readonly","readonly");
	                  $("#inprice").val(data.inprice);
	                 $("#inprice").attr("readonly","readonly");
	               }
	           },
	           error:function(data){//失败时调用的函数
	           }
	         }); 
    }
    
		//保存操作
		function saveStore(){
		
			$('#fm').form('submit',{//给form表单绑定submit事件
			url: url,//请求的url地址
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
		
		//弹出更新方法
		function editStore(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			   //alert(row.goodsid);
			     //弹出框
				$('#dlg').dialog('open').dialog('setTitle','更新用户');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#fm').form('load',row);
				var empname='${emptel.empname}';
			 	$('#empid').val(empname);
				url = 'storeLoss/update.do?id='+row.goodsid;
			}
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
					   
						$.post('storeLoss/del.do',{goodsid:row.goodsid},function(result){
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
			}else{
			   $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '请至少选中一行！！！'//提示信息
				 });
			}
		}
		
		
		
		
		
		
		</script>
	
  </body>
</html>
