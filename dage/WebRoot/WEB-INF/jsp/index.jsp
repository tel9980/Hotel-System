<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>a{ TEXT-DECORATION:none}a:hover{TEXT-DECORATION:underline }</style> 
    <base href="<%=basePath%>">
    
    <title>主界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<!-- <script type="text/javascript">
	   $(function(){
	      addTab("百度","https://www.baidu.com");
	   });
	</script> -->
  </head>
  
  <body class="easyui-layout" onload="startTime()">
	<div data-options="region:'north',border:false" style="height:45px;background:#202340;padding:10px;text-align:center;font-weight:bold;font-family:楷体;font-size:27px;color:#FFFFFF">
		<div style="float:left;width:200px;">达阁酒店</div><div style="float:left;width:1026px;" id="clock"></div>
		<div style="float:right;width:290px;"><span>管理员：${sessionScope.emptel.get("empname")}</span>&nbsp<a href="loginOut.do" Style="color:#FFFFFF"">退出</a>
 </div> 
	</div>
	<div data-options="region:'west',split:true,title:'功能菜单'" style="width:220px;padding:10px;">
		<div class="easyui-panel" style="padding:5px">
		  <ul id="tree" class="easyui-tree" data-options="url:'power/tree.do',method:'post',animate:true"></ul>
	 	</div>
	</div>
	<div data-options="region:'south',border:false" style="height:23px;background:#A9FACD;padding:5px;font-size:10px;;color:#5A2D5F" align="center">2018-2118 &nbsp;&nbsp;&nbsp;&nbsp;  &copy; </div>
	<div data-options="region:'center',title:'主功能区'">
		<div id="ta" class="easyui-tabs" style="width:100%;height:100%;">
			<iframe id="ifr" scrolling="auto" frameborder="0"  src="static1/images/welcome.png" style="width:100%;height:100%;"></iframe>
		</div>
	</div>
  </body>
  <script type="text/javascript">
   //给ID为tt的数绑定onClick事件
	   $('#tree').tree({
			onClick: function(node){
				if (node.url!="null"&&node.url!='') {
					//alert(node.text+",url地址:"+node.url);  // 当点击时，弹出节点名称
					//addTab(node.text, node.url);
					$("#ifr").attr("src",node.url);
				}
				
			}
		});
	/* 	//动态添加页签
		function addTab(title, url){ //tit le页签的标题   url请求地址
			if ($('#ta').tabs('exists', title)){//判断该名称的页签是否存在   如果true
				$('#ta').tabs('select', title);//让选中
			} else {//不存在
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#ta').tabs('add',{ //添加页签
					title:title,	//题头
					content:content,//内容
					closable:true	//是否可关闭
				});
			}
		} */
		//头部时钟
		function showTime(){
			var date = new Date();
			this.year = date.getFullYear();
			this.month = date.getMonth() + 1;
			this.date = date.getDate();
			this.day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[date.getDay()];
			this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
			this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
			this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
			$("#clock").text(this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":" + this.minute + ":" + this.second + " " + this.day);
		}
		window.setInterval("showTime()",1000);
		
  </script>
  
</html>
