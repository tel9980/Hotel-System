<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roomadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
  <link rel="stylesheet" href="easyui/themes/bootstrap.min.css" type="text/css"></head>
  
  <body>
  	<div  >
     <form action="power/add.do" method="post">
		<table border="1" width="800px" align="center"  style='font-family:楷体;font-size:20px'  class="table table-hover">
			<tr align="center" class="warning">
				<td >名称</td>
				<td>
					<input type="hidden" name="id">
					<input type="text" name="name">
				</td>
			</tr>
			<tr align="center" class="success">
				<td>父节点</td>
				<td><input class="easyui-combotree" name="parentid"  data-options="url:'power/tree.do',method:'get',required:true" style="width:210px"></td>
			</tr>
			<tr align="center" class="danger">
				<td>状态</td>
				<td><input type="radio" name="state" value="open" checked="checked">打开
					<input type="radio" name="state" value="closed">关闭
				</td>
			</tr>
			<tr align="center" class="warning">
				<td>图标</td>
				<td><input type="text" name="iconcls"></td>
			</tr>
			<tr align="center"  class="active">
				<td>链接</td>
				<td><input type="text" name="url"></td>
			</tr>
			<tr align="center" class="success">
				<td colspan="2"><input type="submit" class="btn btn-success" value="添加"></td>
			</tr>
		</table>
     </form>
     </div>
  </body>
</html>
