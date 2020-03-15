<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>列表显示</title>
    
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
	<script type="text/javascript">
		$(function(){  	  
			$('#tr').tree({
			    onClick:function(node){
			      //alert(node.id);
			        $(this).tree(node.state === 'closed' ? 'expand' : 'collapse', node.target);  
		           	 node.state = node.state === 'closed' ? 'open' : 'closed';  
			    	//if(node.url!=null&&node.url!='null'&&node.url!=''){
			    		//addTab(node.text, node.url);
			    	$("#ifm").attr("src","power/toUpdate.do?id="+node.id);
			    	//}
				}
			}); 
	 	});
		
		//动态添加页签
		
		
  	</script>
  </head>
  
  <body class="easyui-layout">
	
	<div data-options="region:'west',split:true,title:'功能菜单'" style="width:220px;padding:10px;">
		 <div class="easyui-panel" style="padding:5px" >
			<ul id="tr" class="easyui-tree" data-options="url:'power/tree.do',method:'post',animate:true"></ul>
		</div>
	</div>
	<div data-options="region:'center',title:'显示区'">
		<div id="ta" class="easyui-tabs" style="width:100%;height:100%;">
			 <div title="操作"  >
			 	<iframe id="ifm" scrolling="auto" frameborder="0"   src="power/addp.do" style="width:100%;height:100%;"></iframe>
			 </div>
		</div>
	</div>
	
  </body>
 
</html>
