<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据Exl</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <%
  // 设置返回值类型 MIME
   List<Map<String,Object>> list=(List<Map<String,Object>>) request.getAttribute("dataList");
    response.setContentType("application/vnd.ms-excel");  
    response.setHeader("Content-Disposition","attachment;filename="+list.get(0).get("time")+".xls");//指定下载的文件名 

   %>
  </head>
  
  <body>
    <table border="1">
       <tr><td>日期</td><td>收入</td><td>支出</td></tr>
       <c:forEach items="${dataList}" var="data">
        <tr><td>${data.time}</td><td>${data.income}</td><td>${data.outcome}</td></tr>
       </c:forEach>
     </table>
  </body>
</html>
