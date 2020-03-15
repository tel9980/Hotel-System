<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roomiframe.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<style type="text/css">
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
	</style>
	<script type="text/javascript">
		$(function(){
		 	$.ajax({
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
			      });
		})
		
	</script>
  </head>
  
  <body>
   	<iframe scrolling="auto" width="100%" height="85%"src="roomController/show.do">
   	
   	</iframe>
   	<div id="under">
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
		</div>
  </body>
</html>
