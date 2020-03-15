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
           url:"store/getStore.do",//请求地址
           //data:{},//请求中携带的参数
           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
           type:"post",//设置请求类型
           dataType:"json",//设置返回值的类型
           success:function(data){//成功后回调的函数
               if(data!=''&&data!=null){
               //循环解析返回json  拼装option
                 for(var i=0;i<data.length;i++){  
                    option+="<option value='"+data[i].goodsid+"' >"+data[i].goodsname+"</option>";
                 }
               }
           },
           error:function(data){//失败时调用的函数
           }
         });
          
        var j=0;
        //为id的btnAdd元素添加点击事件
        $("#btnAdd").click(function(){
        	
          var trData = "<tr><td ><select width='100%' id='"+j+"' name='goodsList["+j+"].goodsid' onchange='getStoreById(this)'>"+option+"</select> </td><td><input type='text' class='easyui-validatebox' id='goodsname"+j+"' name='goodsList["+j+"].goodsname' >  </td> <td><input type='text' id='goodtype"+j+"'  name='goodsList["+j+"].goodtype'></td><td><input   name='goodsList["+j+"].empid' type='text' id='empname"+j+"' > </td><td><input type='text' id='goodsnum"+j+"' name='goodsList["+j+"].innum' > </td><td><input type='button' value='删除' onclick='del(this)' ></td></tr>";
    
          $("#tbd").append(trData);
          j++;
        });
    });
    
    //选择后获取数据
    function getStoreById(t){
       var goodsId = $(t).val();
         var rowId = $(t).attr("id");
	      $.ajax({
	           url:"store/getStore.do",//请求地址
	           data:{goodsid:$(t).val()},//请求中携带的参数
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
	                  $("#goodsnum"+rowId).val(data.goodsnum);
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
    <table id="tt" class="easyui-datagrid"  title="库存管理" style="width:100%;height:600px;" fitColumns='true' pagination="true" toolbar="#tb"
		 data-options="singleSelect:true,collapsible:true,url:'store/page.do',method:'post'">
		<thead>
			<tr >
				<th data-options="field:'goodsid',align:'center',sortable:true,width:80">商品编号</th>
				<th data-options="field:'goodsname',align:'center',width:80">商品名称</th>
				<th data-options="field:'goodtype',align:'center',width:80">商品类型</th>
				<th data-options="field:'goodsnum',align:'center',width:80,formatter:formatWorkingstatus">商品数量</th>
				<th data-options="field:'inprice',align:'center',width:80">商品进价</th>
				<th data-options="field:'sellprice',align:'center',width:80">商品卖价</th>
				<th data-options="field:'suplieer',align:'center',width:80">供货商</th>
				<th data-options="field:'suptel',align:'center',width:80">供货商联系方式</th>
				<th data-options="field:'empname',align:'center',width:80">操作员姓名</th>
				<th data-options="field:'_operate',width:150,align:'center',formatter:fromatterOperation">操作</th> 
			</tr>
		</thead>
	</table>


	<div id="tb" style="padding:3px">
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addGoods()">添加</a>
			<a   class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addStore()">批量添加采购</a>
			<a   class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="outAllStore()">批量出库</a>
		<div style="float:right">
			<span>商品编号:</span>
			<input id="id" style="line-height:26px;border:1px solid #ccc">
			<span>商品类型:</span>
			<select id="type" style="width:130px;height:30px;border:1px solid #ccc">
						<option value=""></option>
					    <option value="洗漱用品类" >洗漱用品类</option>
					    <option value="生活用品类">生活用品类</option>
					    <option value="床上用品类">床上用品类</option>
					    <option value="食品类">食品类</option>
					    <option value="性用品类">性用品类</option>
			</select>
			
			<a   class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
		</div>
	</div>
	
<!--商品增加弹出框  -->	
	<div id="dlg" class="easyui-dialog" style="width:600px;height:400px;padding:10px 20px"
		closed="true"  buttons="#dlg-buttons">
			<form id="fm" method="post">
				<div class="fitem">
					<label>商品编号:</label>
					<input name="goodsid" id="goodsid" class="easyui-validatebox" required="true" validType='goodsid'>
				</div>
				<div class="fitem">
					<label>商品名称:</label>
					<input name="goodsname" id="goodsname" class="easyui-validatebox" required="true" validType='goodsname'>
				</div>
				<div class="fitem">
					<label>商品类型:</label>
					<select name="goodtype" id="type"  style="width:160px;height:27px;border:1px solid #ccc">
					    <option value="洗漱用品类" selected="selected">洗漱用品类</option>
					    <option value="生活用品类">生活用品类</option>
					    <option value="床上用品类">床上用品类</option>
					    <option value="食品类">食品类</option>
					    <option value="性用品类">性用品类</option>
			        </select>
				</div>
				<div class="fitem">
					<label>商品数量:</label>
					<input name="goodsnum" class="easyui-validatebox" validType="numbers">
				</div>
				<div class="fitem">
					<label>商品进价:</label>
					<input name="inprice" class="easyui-validatebox" validType="numbers">
				</div>
				<div class="fitem">
					<label>商品卖价:</label>
					<input class="easyui-validatebox" name="sellprice" validType="numbers">
				</div>
				<div class="fitem">
					<label>商品用途:</label>
					<select name="gooduse" id="type"  style="width:160px;height:27px;border:1px solid #ccc">
					    <option value="房间消费品" selected="selected">房间消费</option>
					    <option value="装饰用品">装饰用品</option>
					    <option value="床上用品类">生活用品</option>
					    <option value="食品类">食品类</option>			    
			        </select>
				</div>
				<div class="fitem">
					<label>供货商:</label>
					<input name="suplieer">
				</div>
				<div class="fitem">
					<label>供货商联系方式:</label>
					<input name="suptel" class="easyui-validatebox" validType="subtel">
				</div>
				<div class="fitem">
					<label>操作员姓名:</label>
					<input name="empid" id="empid1"  class="easyui-validatebox" >
				</div>
			</form>
		</div>
		<div id="dlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="goodsAdd()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
		</div>
		
	
<!-- 批量采购,出库弹出框 -->
	<div id="indlg" class="easyui-dialog" style="width:900px;height:400px;padding:10px 20px"
		closed="true"  buttons="#indlg-buttons">
	<form id="infm" method="post" >
        <input type="button" value="添加商品" id="btnAdd">
        <table width="750px;" border="1">
          <thead class="fitem" align="center">
           	<td>商品名称</td>
           	<td>商品编号 </td> 
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
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="inStore()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#indlg').dialog('close')">取消</a>
		</div>
	
<!-- 单个商品出库弹出框 -->	
	<div id="outdlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px;align:center"
		closed="true"  buttons="#outdlg-buttons">
		<form id="outfm" method="post">
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
					<input name="empid"  value="${emptel.empname}" class="easyui-validatebox" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品数量:</label>
					<input name="goodsnum" class="easyui-validatebox" validType='numbers'>

				</div>
				
			</form>
		</div>
		<div id="outdlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="outStore()"> 出库</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#outdlg').dialog('close')">取消</a>
		</div>
		
<!--单个采购弹出框  -->		
		<div id="purchasedlg" class="easyui-dialog" style="width:600px;height:380px;padding:10px 20px;align:center"
		closed="true"  buttons="#purchasedlg-buttons">
		<center>
			<form id="addfm" method="post">
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
					<input name="goodtype" class="easyui-validatebox" onfocus=this.blur()>
				</div>
				
				<div class="fitem">
					<label>操作员姓名:</label>
					<input name="empid" value="${emptel.empname}" class="easyui-validatebox" onfocus=this.blur()>
				</div>
				<div class="fitem">
					<label>商品数量:</label>
					<input name="innum" class="easyui-validatebox" validType='numbers'>

				</div>
			</form>
			</center>
		</div>

		<div id="purchasedlg-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="purStore()"> 采购</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#purchasedlg').dialog('close')">取消</a>
		</div>
		
	<script type="text/javascript">
	//改变商品状态,当数量小于50时,字体变红
	function formatWorkingstatus(val){
	
		if(val<50){
			return '<span style="color:red;">'+val+'</span>';
		}else{
			return '<span >'+val+'</span>';
		}
	}
	//form表单数字验证,手机号码
		$.extend($.fn.validatebox.defaults.rules,{
			numbers : {// 验证整数或小数
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'
            },
             subtel : {// 验证手机号码
                validator : function(value) {
                    return /^(13|15|18|17)\d{9}$/i.test(value);
                },
                message : '手机号码格式不正确'
            },
		  });
	
		function fromatterOperation(){
			return "<input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)'" 
			+"onclick='output()' value='出库'><input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)' onclick='purchaseStore()' value='采购'><input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)' onclick='editStore()' value='修改'><input type='button' style='background-image:linear-gradient(#f5c153,#ea920d)' onclick='destroyStore()' value='删除'>"
		}
		
		//弹出添加商品窗口
		function addGoods(){
			$('#dlg').dialog('open').dialog('setTitle','添加商品');
			$('#dlg').window('center');
			$('#fm').form('clear');
			var empname='${emptel.empname}';
			 $('#empid1').val(empname);
			url = 'store/add.do';
		}
		//保存商品添加,唯一性验证商品编号,商品名称
		function goodsAdd(){
			$('#fm').form('submit',{//给form表单绑定submit事件
			url: url,//请求的url地址
			onSubmit: function(){//对form表单校验
				if (url=="empController/add.do") {
						//商品id,名称唯一性验证	  
				$.extend($.fn.validatebox.defaults.rules, { 
						    goodsid:{
						        validator:function(value,param){
						        	var s = null;
									 $.ajax({
										url: "store/required.do?page=1&rows=1000",
										data:{goodsid:value},
										async:false,
										type:"post",
										dataType:"json",
										success: function(data){
											s=data;
										}
									})
									return s;
						        },
						       message:  '商品编号已存在'
							},
						    goodsname:{
						        validator:function(value,param){
						        	var s = null;
									 $.ajax({
										url: "store/required.do?page=1&rows=1000",
										data:{goodsname:value},
										async:false,
										type:"post",
										dataType:"json",
										success: function(data){
											s=data;
										}
									})
									return s;
						        },
						       message:  '商品名称已存在'
							},

						});
					}
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
		
		
		
		
		//弹出单个出库窗口
		function output(){
		   var row = $('#tt').datagrid('getSelected');
			if (row.goodsnum>0){
			   //alert(row.goodsid);
			     //弹出框
				$('#outdlg').dialog('open').dialog('setTitle','商品出库');
				$('#outdlg').window('center');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#outfm').form('load',row);
				url = 'store/out.do?id='+row.goodsid;
			}else {
					$.messager.show({	// show error message
					title: '提示信息',
					msg: '库存数量为零,不能出库'
				});
			}
		}
		
		//保存单个出库
		function outStore(){
			$('#outfm').form('submit',{//给form表单绑定submit事件
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
						$('#outdlg').dialog('close');		// 关闭弹出框
						$('#tt').datagrid('reload');	// 刷新父窗口
					}
				}
			});
		}
		
		
		//弹出单个采购方法
		function purchaseStore(){
		//获取选中行
		   var row = $('#tt').datagrid('getSelected');
		   
			if (row){
				$('#purchasedlg').dialog('open').dialog('setTitle','申请采购');
				$('#purchasedlg').window('center');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				$('#addfm').form('load',row);
				url = 'store/onepurchase.do';
			}
		}
		//保存单个采购
		function purStore(){
			$('#addfm').form('submit',{//给form表单绑定submit事件
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
						$('#purchasedlg').dialog('close');		// 关闭弹出框
						$('#tt').datagrid('reload');
					}
				}
			});
		}
		
		
		//查询方法
		  function doSearch(){
				$('#tt').datagrid('load',{
					goodsid: $('#id').val(),
					goodtype: $('#type').val(),
					submittime:$('#timeone').val(),
					submittimetimetwo:$('#timetwo').val()
				});
		 }
		 
		
		//保存批量采购,出库
		function inStore(){
		
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
			url = 'store/purchase.do';
		}
		
		
		//弹出出库
		function outAllStore(){
			$('#indlg').dialog('open').dialog('setTitle','添加出库商品');
			$('#indlg').window('center');
			$('#infm').form('clear');
			url = 'store/output.do';
		}
		
		
		
		//弹出更新方法
		function editStore(){
		 
		   var row = $('#tt').datagrid('getSelected');
			if (row){
			   
				$('#dlg').dialog('open').dialog('setTitle','更新商品信息');
				$('#dlg').window('center');
				//加载数据 根据datagrid里面的field的名称和form表单的名称必须一致
				var empname='${emptel.empname}';
			 	$('#empid1').val(empname);
				$('#fm').form('load',row);
				url = 'store/update.do?id='+row.goodsid;
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
					   
						$.post('store/del.do',{goodsid:row.goodsid},function(result){
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
