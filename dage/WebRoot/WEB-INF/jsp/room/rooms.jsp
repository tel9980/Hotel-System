<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
    
	    <title>客房信息</title>
	    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
        
        <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="easyui/validator.js"></script>
	
		<style>
			#main{
					overflow: hidden;
					width:auto;
					background-color:#F0F0F0; 
				}
			.one{
				width:150px;
				height:150px;
				float: left;
				border:1px solid black;
				padding:5px;
				margin:5px 5px;
				border-radius:15px;
				overflow: hidden;
				background-color:white;
			}
			.info{
				width:100%;
				height:auto;
				margin-bottom:5px;
				border:0px solid red;
				font-size:16px;
				color: black;
				border-radius:10px;
			}
			.but{
				width:100%;
				height: 30px;
				float: left;
				text-align: center;
				border:0px solid red;
				display: inline;
				margin-left: 5px;
				border-radius:10px;
				margin-top:6px;
			}
			input[type="text"]{
				display: inline;
				width:120px;
				background-color:#F0F0F0;
				font-size: 16px;
				font-weight: bold;
				text-align: center;
				border:0;
				margin-top:2px;
				border-radius:10px;
			}
			#main>.one:hover {
				display:block;
				border:1px red solid;
			}
			.tt{
				overflow: hidden;
				width:100%;
				float:left;
			}
			.ts{
				width:auto;
				float:right;
				margin-right:15px;
			}
			.tw{
				width:auto;
				font-weight:bold;
				font-size:16px;
				float:left;
			}
			#s3{
				margin-top:3px;
				border:15px solid red;
				line-height:15px;
			}
			#s5{
				margin-top:3px;
				border:15px solid #1CD998;
				line-height:15px;
			}
			#s4{
				margin-top:3px;
				border:15px solid greenyellow;
				line-height:15px;
			}
			#s2{
				margin-top:3px;
				height:15px;
				line-height:15px;
				border:15px solid purple;
			}
			#s1{
				margin-top:3px;
				border:15px solid blue;
				line-height:15px;
			}
			.tcbody
			{ 
	        	width:auto; 
	        	height:auto;
	        	position:absolute;
	        	left: 40%;
	        	top: 20%;
	        	z-index:100; 
	        	display:none;
        	}
        	.tcbody input[type="text"]
        	{
				display: inline;
				width:120px;
				background-color:#F0F0F0;
				font-size: 16px;
				font-weight: bold;
				text-align: center;
				border:1;
				margin-top:2px;
			}
			input[type="button"]{
				display: inline;
				font-size:12px;
				border:0;
				padding:2px 5px;
				margin:0;
				width:auto;
				border-radius:10px;
			}
			.tcbody 
			{
				background-color:#72BCF7;
				width:300px;
			}
			#under{
				position:relative;
				top:0px;
				left:0px;
			}
			#under input[type="text"]{
				width:30px;
				color:red;
				font-size:15px;
			}
		</style>
	</head>
	<body>
		<div id="main">
			<div class="tt">
				<div class="tw">客房信息:  <a class="easyui-linkbutton" iconCls="icon-reload" onclick="newpage()">刷新</a> </div>				
				<div class="ts"><span id="s1"></span>打扫中</div>
				<div class="ts"><span id="s2"></span>维修中</div>
				<div class="ts"><span id="s3"></span>已入住</div>
				<div class="ts"><span id="s5"></span>已预订</div>
				<div class="ts"><span id="s4"></span>空闲</div> 
				<div class="ts">状态提示:</div>
			</div>
			<c:forEach items="${list}" var="map" varStatus="sta">
				<div class="one" style="background-color:
				<c:choose>
					<c:when test="${map.roomstate=='空闲'}">greenyellow</c:when>
					<c:when test="${map.roomstate=='已入住'}">red</c:when>
					<c:when test="${map.roomstate=='维修中'}">purple</c:when>
					<c:when test="${map.roomstate=='打扫中'}">blue</c:when>
					<c:when test="${map.roomstate=='已预订'}">#1CD998</c:when>
				</c:choose>">
					<div class="info">
						&nbsp;&nbsp;&nbsp;<input type="text" name="roomid" value="${map.roomid}" readonly="readonly">
						&nbsp;&nbsp;&nbsp;<input type="text" name="roomtype" value="${map.roomtype}" readonly="readonly">
						<input type="hidden" name="roomManage" value="${map.roommanage}" readonly="readonly">
						<input type="hidden" name="manageCell" value="${map.managephone}" readonly="readonly">
						&nbsp;&nbsp;	
						<c:choose>
							<c:when test="${map.roomstate=='已入住'}"><span style="font-size:12px"><input value="${map.begintime}" readonly="readonly"><input value="预住${map.days}天,已入住${map.day2-map.day1}天" readonly="readonly"></span></c:when>
							<c:otherwise><input type="text" name="roomstate" value="${map.roomstate}" readonly="readonly"></c:otherwise>
						</c:choose>				
					</div>
					<div class="but">
						<input type="${map.roomstate=='空闲'?'button':'hidden'}" value="入住" onclick="button('${map.roomid}',1)">
						<%-- <input type="hidden" value="预订" onclick="button('${map.roomid}',2)">		 --%>		
						<input type="${map.roomstate=='已预订'?'button':'hidden'}" value="确认入住" onclick="button('${map.roomid}',3)">
						<%-- <input type="${map.roomstate=='已预订'?'button':'hidden'}" value="取消预定" onclick="button('${map.roomid}',4)"> --%>
						<input type="${map.roomstate=='已入住'?'button':'hidden'}" value="换房" onclick="button('${map.roomid}',5)">
						<input type="${map.roomstate=='已入住'?'button':'hidden'}" value="退房" onclick="button('${map.roomid}',6)">
						<input type="${map.roomstate=='已入住'?'button':'hidden'}" value="续住" onclick="button('${map.roomid}',7)">
						<input type="${map.roomstate=='打扫中'?'button':'hidden'}" value="打扫完毕" onclick="button('${map.roomid}',8)">
						<input type="${map.roomstate=='打扫中'?'button':'hidden'}" value="维修" onclick="button('${map.roomid}',9)">
						<input type="${map.roomstate=='维修中'?'button':'hidden'}" value="维修完毕" onclick="button('${map.roomid}',10)">
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="dlgAdd" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px;top:70px" closed="true" buttons="#toAdd">
			<div class="ftitle">入住信息登记</div>
			<form id="fmAdd" method="post">
				<div class="fitem">
					<table align="center">
						<tr>
							<td><label>房间号:</label></td>
							<td><input name="roomid" class="easyui-validatebox"  readonly="readonly"></td>
						</tr>
						<tr>
							<td><label>客房类型:</label></td>
							<td><input name="roomtype" class="easyui-validatebox"  readonly="readonly"></td>
						</tr>
						<tr>
							<td><label>客房价格:</label></td>
							<td><input id="price" name="roomprice" class="easyui-validatebox"  readonly="readonly"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" onclick="addInfo()" value="多人入住请点击" style="display:inline;
									font-size:14px;color:red;
									border:0;
									padding:2px 5px;
									margin:0;
									width:auto;
									border-radius:10px;">
								<table id="morePeople">
									<tr>
										<td><label>客户姓名:</label></td>
										<td><label>性别:</label></td>
										<td><label>手机号:</label></td>
										<td><label>证件类型:</label></td>
										<td><label>证件号:</label></td>
									</tr>
								
									<tr>
										
										<td><input  class="easyui-validatebox" name="customerList[0].cusname" validType="name" required="required"></td>
										<td>
											<input type="radio" class="easyui-validatebox" name="customerList[0].cussex" id="ra1" value="男">男
											<input type="radio" class="easyui-validatebox" name="customerList[0].cussex" value="女">女
										</td>
										<td><input name="customerList[0].custel" class="easyui-validatebox" validType="mobile" required="required"></td>
										<td>
											<select name="customerList[0].idcardtype" id="idcardtype" required="required">
												
											</select>
										</td>
										<td><input name="customerList[0].idcard" class="easyui-validatebox" validType="idcard" required="required"></td>
									</tr>
								</table>
								
							</td>
						</tr>
						<tr>
							<td><label>入住天数:</label></td>
							<td><input id="days" name="days" class="easyui-validatebox" required="required" ></td>
						</tr>
						<tr>
							<td><label>房费总计:</label></td>
							<td><input id="total" name="roompricesum" class="easyui-validatebox" required="required"></td>
						</tr>
						<tr>
							<td><label>应交押金:</label></td>
							<td><input name="roomcash" class="easyui-validatebox"  readonly="readonly" required="required"></td>
						</tr>
						<tr>
							<td><label>实交押金:</label></td>
							<td>
								<input name="cash" class="easyui-validatebox"  required="required">
							</td>
						</tr>
					</table>			
				</div>
			</form>
		</div>
		<div id="toAdd">
			<a class="easyui-linkbutton" iconCls="icon-ok" onclick="saveInfo()">确认入住</a>
			<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:window.location.href='roomController/show.do'">取消</a>
		</div>
		

		
		<div id="order" class="easyui-dialog" style="width:450px;height:500px;padding:10px 20px;top:70px"
			closed="true"  buttons="#order-buttons">
			<form id="fm" method="post">
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">维修房号:</label>
					<input name="roomid" class="easyui-validatebox" readonly="readonly" required="true">
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">维修物品:</label>
					<input name="servgoods" class="easyui-validatebox" required="true">
				</div>
				<div class="fitem" style="padding:3px 20px">
				<label style="letter-spacing:1px;">维修原因:</label>
				<textarea rows="3" cols="14" style="vertical-align:top;" name="servcause" class="easyui-validatebox" required="required">
				</textarea>
				</div>
				<div class="fitem" style="padding:3px 20px">
					<label style="letter-spacing:1px;">操作人员:</label>
					<select id="empid" name="empname" style="width:145px;">

					</select>
				</div>
				
			</form>
		</div>
		<div id="order-buttons">
			<a   class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrder()"> 保存</a>
			<a   class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#order').dialog('close')">取消</a>
		</div>
		
		<!-- <div id="under">
			<p><span style="color:red;font-size:15px;line-height:20px;font-weight: bold;">各房型空闲房间数量:</span>
			家庭套房:<input type="text" id="r1" readonly="readonly">	
			总统套房:<input type="text" id="r2" readonly="readonly">
			标准套房:<input type="text" id="r3" readonly="readonly">
			情侣套房:<input type="text" id="r4" readonly="readonly">
			豪华单人间:<input type="text" id="r5" readonly="readonly">
			情侣大床房:<input type="text" id="r6" readonly="readonly">
			行政房:<input type="text" id="r7" readonly="readonly">
			商务房:<input type="text" id="r8" readonly="readonly"><br></p>
			<span style="color:red;font-size:15px;line-height:20px;font-weight: bold;">当前各状态房型显示:</span>			
			空闲:<input type="text" id="free" readonly="readonly">	
			已入住:<input type="text" id="ins" readonly="readonly">
			预定中:<input type="text" id="booking" readonly="readonly">
			打扫中:<input type="text" id="clear" readonly="readonly">
			维修中:<input type="text" id="check" readonly="readonly">			
		</div> -->
		
		<script type="text/javascript">
			$(function(){
				$("#days").blur(function(){
					$("#total").val($(this).val()*$("#price").val());
				});
				$("#total").blur(function(){
					$("#total").val($("#days").val()*$("#price").val());
				});
				/* $.ajax({
			           url:"roomController/getcounts.do",//请求地址
			           //data:{},//请求中携带的参数
			           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
			           type:"post",//设置请求类型
			           dataType:"json",//设置返回值的类型
			           success:function(data){//成功后回调的函数			             
			               if(data!=''&&data!=null){
			               //循环解析返回json  拼装option
								$("#r1").val(data.r1);
								$("#r2").val(data.r2);
								$("#r3").val(data.r3);
								$("#r4").val(data.r4);
								$("#r5").val(data.r5);
								$("#r6").val(data.r6);
								$("#r7").val(data.r7);
								$("#r8").val(data.r8);
								$("#free").val(data.free);
								$("#ins").val(data.ins);
								$("#booking").val(data.booking);
								$("#check").val(data.check);
								$("#clear").val(data.clear);
			               }
			           },
			       });			 */
			});
			function button(id,num){
				//入住信息登记
				if(num==1){
					$('#fmAdd').form('clear');
					$('#ra1').prop('checked',true);
					$('#idcardtype').append("<option value='身份证' selected='selected'>身份证</option>");
					$.post('nowregister/toAdd.do',{roomid:id},function(result){
					//	alert(result.roomid);
						$('#fmAdd').form('load',result);				
					    $('#dlgAdd').dialog('open').dialog('setTitle','入住信息登记');	
					},'json');
				}
				/* if(num==2){
					$.post('bookingroomController/getStateInfo.do',{roomid:id},function(result){
						alert(result[0].roomid);
						$('#fmtobookin').form('load',result);
					    $('#tobookin').dialog('open').dialog('setTitle','入住信息登记');	
					},'json');
				} */
				if(num==3){
					$('#fmAdd').form('clear');
					$('#ra1').prop('checked',true);
					$('#idcardtype').append("<option value='身份证' selected='selected'>身份证</option>")
					$.post('nowregister/toAdd.do',{roomid:id},function(result){
					//	alert(result.roomid);
						$('#fmAdd').form('load',result);				
					    $('#dlgAdd').dialog('open').dialog('setTitle','入住信息登记');	
					},'json');
					$.ajax({
			           url:"bookingroomController/getStateInfo.do?roomid="+id,//请求地址
			           //data:{},//请求中携带的参数
			           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
			           type:"post",//设置请求类型
			           dataType:"json",//设置返回值的类型
			           success:function(data){//成功后回调的函数			             
			               if(data!=''&&data!=null){
			               //循环解析返回json  拼装option
								$('#days').val(data[0].days)
								$('#total').val(data[0].days*$('#price').val())
			               }
			           },
			        }); 
				}
				/* if(num==4){} */
				//换房操作
				if(num==5){
					location.href="nowregister/changeInfo.do?roomid="+id;
				}
				//退房操作
				if(num==6){
					location.href="nowregister/getInfo.do?roomid="+id;
				}
				//续住
				if(num==7){	
					location.href="nowregister/stayInfo.do?roomid="+id;
				}
				//打扫完毕 状态变为空闲
				if(num==8){
					$.messager.confirm('Confirm','确认打扫完毕了吗 ?',function(r){
					if(r){
						
						$.post('roomController/updateState.do',{roomid:id,state:'空闲'},function(result){
							if (result.errorMsg){
								$.messager.show({
									title: '错误信息',
									msg: result.errorMsg
								});
							} else {
								$.messager.show({
									title: '成功提示',
									msg: result.successMsg
								});		
								window.location.href="roomController/show.do";
							}
						},'json');
						}
					});
				}
				//去维修  填写维修表单 
				if(num==9){
					
					$.post('nowregister/toAdd.do',{roomid:id},function(result){
					//	alert(result.roomid);
						$('#fm').form('load',result);
						$("#empid").empty();
						$('#dlg').dialog('open').dialog('setTitle','添加房间');			
						$("#empid").append("<option selected='selected' value=''>-----请  选  择-----</option>");
						$.ajax({
							url: "empController/serv.do",
							async:false,
							type:"post",
							dataType:"json",
							success: function(data){
								for(var i=0;i<data.length;i++){
									$("#empid").append("<option value="+data[i].empname+">"+data[i].empname+"</option>");
								}
							}
						});
					    $('#order').dialog('open').dialog('setTitle','添加维修记录');
					},'json');
				}
				//维修完毕 更改房间状态以及 维修表单状态
				if(num==10){
					$.messager.confirm('Confirm','确认维修完毕了吗 ?',function(r){
					if(r){						
						$.post('roomController/updateState.do',{roomid:id,state:'空闲',orderState:'已处理'},function(result){
							if (result.errorMsg){
								$.messager.show({
									title: '错误信息',
									msg: result.errorMsg
								});
							} else {
								$.messager.show({
									title: '成功提示',
									msg: result.successMsg
								});		
								window.location.href="roomController/show.do";	
							}
						},'json');
						}
					});
				}				
			}
			function saveInfo(){
				$('#fmAdd').form('submit',{
					url: 'nowregister/add.do',
					onSubmit: function(){
						return $(this).form('validate');
					},
					success: function(result){
						var result = eval('('+result+')');
						if (result.errorMsg){
							$.messager.show({
								title: '错误信息',
								msg: result.errorMsg
							});
						} else {
							$.messager.show({
									title: '成功提示',
									msg: result.successMsg
								});
							$('#dlgAdd').dialog('close');		
							window.location.href="roomController/show.do";
						}
					}
				});
			}
			
	
			 //保存操作
			function saveOrder(){
				$('#fm').form('submit',{//给form表单绑定submit事件
					url: 'servController/add.do',//请求url地址
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
							$('#order').dialog('close');		// 关闭弹出框
							window.location.href="roomController/show.do";	// 刷新父窗口
						}
					}
				});
			}
			function newpage(){
				window.location.href="roomController/show.do";
			}
			var i = 1;
			function addInfo(){
			
				var people="<tr><td><input  class='easyui-validatebox' name='customerList["+i+"].cusname' validType='name' required='required' ></td><td><input type='radio' class='easyui-validatebox' name='customerList["+i+"].cussex' id='ra1' checked='checked' value='男'>男<input type='radio' class='easyui-validatebox' name='customerList["+i+"].cussex' value='女'>女</td><td><input name='customerList["+i+"].custel' class='easyui-validatebox' validType='mobile' ></td><td><select name='customerList["+i+"].idcardtype' required='required'><option value='身份证' selected='selected'>身份证</option></select></td><td><input name='customerList["+i+"].idcard' class='easyui-validatebox' validType='idcard' required='required'><input type='button' onclick='del(this)' value='删除'></td></tr>";
				$("#morePeople").append(people);
				i++;
			}
			function del(t){
				$(t).parent().parent().remove();
			}
		</script>
 	</body>
</html>
