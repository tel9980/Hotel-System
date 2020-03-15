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
     	margin-bottom: 15px;        
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
        height:30px;          
      }   
  
  </style>
  
<script type="text/javascript">
    $(function(){ //页面加载完成后执行的方法
        //$.ajax用法
        //$.post("",{},function(){},"json");$.get("",{},function(){},"json");
        var option="";
        $.ajax({
           url:"storein/getStore.do",//请求地址
           //data:{},//请求中携带的参数
           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
           type:"post",//设置请求类型
           dataType:"json",//设置返回值的类型
           success:function(data){//成功后回调的函数
              
               if(data!=''&&data!=null){
               //循环解析返回json  拼装option
                 for(var i=0;i<data.length;i++){  
                    option+="<option id='op' value='"+data[i].sid+"' >"+data[i].goodsname+"</option>";
                 }
               }
           },
           error:function(data){//失败时调用的函数
           }
         });
          
        var j=0;
        //为id的btnAdd元素添加点击事件
        $("#btnAdd").click(function(){
        	
          var trData = "<tr><td ><select width='100%' id='"+j+"' name='goodsList["+j+"].sid' onchange='getStoreById(this)'>"+option+"</select> </td><td><input type='text' class='easyui-validatebox' id='goodsname"+j+"' name='goodsList["+j+"].goodsname' >  </td> <td><input type='text' id='goodtype"+j+"'  name='goodsList["+j+"].goodtype'></td><td><input   name='goodsList["+j+"].empid' type='text' id='empname"+j+"' > </td><td><input type='text' id='innum"+j+"' name='goodsList["+j+"].innum' > </td><td><input type='button' value='删除' onclick='del(this)' ></td></tr>";
    
          $("#tbd").append(trData);
          j++;
        });
    });
    
    //选择后获取数据
    function getStoreById(t){
       var goodsId = $(t).val();
         var rowId = $(t).attr("id");
	      $.ajax({
	           url:"storein/getStore.do",//请求地址
	           data:{sid:$(t).val()},//请求中携带的参数
	           type:"post",//设置请求类型
	           dataType:"json",//设置返回值的类型
	           success:function(data){//成功后回调的函数
	               if(data!=''&&data!=null){
 					$("#goodsname"+rowId).val(data.goodsid);
	                  $("#goodsname"+rowId).attr("readonly","readonly");
	                  $("#goodtype"+rowId).val(data.goodtype);
	                  $("#goodtype"+rowId).attr("readonly","readonly");
	                  $("#empname"+rowId).val("<%=((Map)session.getAttribute("emptel")).get("empname")%>");
	                  $("#empname"+rowId).attr("readonly","readonly");
	               	$("#innum"+rowId).val(data.innum);
	               	$("innum"+rowId).attr("readonly","readonly");
	               }
	           },
	           error:function(data){//失败时调用的函数
	           }
	         }); 
    }
    //删除元素
    function del(t){
       //删除父亲的父亲，就是tr
       $(t).parent().parent().remove();
    }
  </script>



  <body>
  <center>
    <table id="tt" class="easyui-datagrid" title="入库管理" style="width:100%;height:600px" fitColumns='true' pagination="true" toolbar="#tb"
		 data-options="singleSelect:true,collapsible:true,url:'storein/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'ordernum',align:'center',sortable:true,width:10">入库编号</th>
				<th data-options="field:'goodsname',align:'center',width:10">商品名称</th>
				<th data-options="field:'goodtype',align:'center',width:10">商品类型</th>
				<th data-options="field:'innum',align:'center',width:10">商品入库数量</th>
				<th data-options="field:'empname',align:'center',width:10">操作员姓名</th>
				<th data-options="field:'intime',align:'center',width:10">入库时间</th>
				<th data-options="field:'inprice',align:'center',width:10">商品单价</th>
				<th data-options="field:'suplieer',align:'center',width:10">供货商</th>
				<th data-options="field:'suptel',align:'center',width:10">供货商联系方式</th>
				<th data-options="field:'state',align:'center',width:10,formatter:formatWorkingstatus">状态</th>
				<th data-options="field:'_operate',width:10,align:'center',formatter:fromatterOperation">操作</th>
			</tr>
		</thead>
	</table>


	<div id="tb" style="padding:3px">

			<a   class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="addStore()">批量处理</a>
			
		<div style="float:right">
			<span>商品名称:</span>
			<input id="name" style="line-height:26px;border:1px solid #ccc">
			<span>起:</span>
			<input id="timeone" class="easyui-datetimebox" style="line-height:26px;border:1px solid #ccc">
			<span>止:</span>
			<input id="timetwo" class="easyui-datetimebox" style="line-height:26px;border:1px solid #ccc">
			<a   class="easyui-linkbutton"  iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
		</div>
	</div>
	
<!--单个入库弹出框  -->		
 	<div id="dlg" class="easyui-dialog" style="width:600px;height:380px;padding:10px 20px;align:center"
		closed="true"  buttons="#dlg-buttons">
		<center>
			<form id="fm" method="post">
			
				<div>
					
					<input type="hidden" name="sid" class="easyui-validatebox" required="true" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品编号:</label>
					<input name="goodsid" class="easyui-validatebox" required="true" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品名称:</label>
					<input name="goodsname" class="easyui-validatebox" required="true" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品类型:</label>
					<input name="goodtype" class="easyui-validatebox"  onfocus=this.blur()>
				</div>
				
				<div class="fitem">
					<label>操作员姓名:</label>
					<input name="empid"  value="${emptel.empname} " class="easyui-validatebox" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品数量:</label>
					<input name="innum" class="easyui-validatebox" validType='numbers' onfocus=this.blur()>

				</div>			
			</form>
			</center>
		</div>
		
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveStore()"> 入库</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
<!--批量弹出框  -->		
	<div id="indlg" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
		closed="true"  buttons="#indlg-buttons">
	<form id="infm" method="post" >
        <input type="button" value="添加入库商品" id="btnAdd">
        <table width="750px;" border="1">
          <thead class="fitem" align="center">
           	<td>商品名称</td>
           	<td>商品序号 </td> 
           	<td>商品类型</td>
           	<td>操作员姓名 </td>
           	<td>商品数量 </td>
    		<td>操作</td>
          </thead> 
           <tbody id="tbd" >
           </tbody>
           
        </table>
      </form>
	</div>			
		<div id="indlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="storeAdd()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#indlg').dialog('close')">取消</a>
		</div>
	
	<script type="text/javascript">
	//商品状态改变时,字体颜色改变
		function formatWorkingstatus(val){
		if(val=="待入库"){
			return '<span style="color:red;">'+val+'</span>';
		}
		else{
			return '<span >'+val+'</span>';
		}
	}
	
	//form表单数字验证
		$.extend($.fn.validatebox.defaults.rules,{
			numbers : {// 验证整数或小数
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'
            }
		  });
		
		
		function fromatterOperation(){
			return "<input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)'" 
			+"onclick='inStore()' value='入库'><input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)' onclick='destroyStore()' value='删除'>"
		}
		
		
		
		
		//查询方法

		  function doSearch(){
				$('#tt').datagrid('load',{
					goodsid: $('#id').val(),
					goodsname: $('#name').val(),
					intime:$('#timeone').val(),
					intimetwo:$('#timetwo').val()
				});
		 }
		 
		
		 
		 
		//保存入库操作
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
		
		//弹出入库方法
		function inStore(){
		   //获取选中行
		   var row = $('#tt').datagrid('getSelected');
			if (row.state!="已入库"){
				$('#dlg').dialog('open').dialog('setTitle','商品入库');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#dlg').window('center');
				$('#fm').form('load',row);
				url = 'storein/update.do?id='+row.goodsid;
			}
			if(row.state=="已入库"){
					$.messager.show({	// show error message
					title: '提示信息',
					msg: '已入库,不能入库'
				});
			}
			
		}
		
		
		//保存批量采购
		function storeAdd(){
		
			$('#infm').form('submit',{//给form表单绑定submit事件
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
						$('#indlg').dialog('close');		// 关闭弹出框
						$('#tt').datagrid('reload');
					}
				}
			});
		}
		
		
		//弹出批量采购
		function addStore(){
			$('#indlg').dialog('open').dialog('setTitle','添加采购商品');
			$('#indlg').window('center');
			$('#infm').form('clear');
			url = 'storein/input.do';
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
					   
						$.post('storein/del.do',{goodsid:row.goodsid},function(result){
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
