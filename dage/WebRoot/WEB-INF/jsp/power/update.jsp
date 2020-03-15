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
  <link rel="stylesheet" href="static1/css/lib/bootstrap.min.css" type="text/css"></head>
  
  <body>
  <div>
     <form action="power/update.do" method="post">
		<table border="1" width="400px" align="center" class="table table-hover" style='font-family:楷体;font-size:20px'>
			<tr align="center">
				<td>名称</td>
				<td>
					<input type="hidden" name="id" value="${map.id}">
					<input type="text" name="name" value="${map.name}">
				</td>
			</tr>
			<tr align="center">
				<td>父节点</td>
				<td><input class="easyui-combotree" name="parentid" value="${map.parentid}" data-options="url:'power/tree.do',method:'get',required:true" style="width"></td>
			</tr>
			<tr align="center">
				<td>状态</td>
				<td><input type="radio" name="state" ${map.state=='open'?'checked=checked':'' } value="open">打开
					<input type="radio" name="state" ${map.state=='closed'?'checked=checked':'' } value="closed">关闭
				</td>
			</tr>
			<tr align="center">
				<td>图标</td>
				<td><input type="text" name="iconcls" vlaue="${map.iconcls}"></td>
			</tr>
			<tr align="center">
				<td>链接</td>
				<td><input type="text" name="url" value="${map.url}"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" class='btn btn-success'>
				<input type="button" onclick="del('${map.id}','${map.url}')" value="删除" class="btn btn-danger"></td>
			</tr>
		</table>
     </form>
     </div>
     <script type="text/javascript">
     	function del(id,url){
     		if(url==null||url==''||url=='null'){
     			$.messager.show({
							title: '错误信息',
							msg: '当前节点有子节点，请删除子节点后重试！'
						});
     		}else{
     			$.messager.confirm('Confirm','确认删除吗 ?',function(r){
					if (r){
						location.href='power/del.do?id='+id;
					}
				});				
     		}
     	}
     </script>
  </body>
</html>
