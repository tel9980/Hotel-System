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
    
    <title>换房界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 知识点：1，$.ajax的用法  （$.get();  $.post()，前面讲过）
	            2，批量添加页面数据     -->

  <script type="text/javascript" src="easyui/jquery.min.js"></script>
  <script type="text/javascript">
  	$(function(){
    	$("#staydays").blur(function(){
    		$("#stayroomprice").val($("#staydays").val()*$("#roomprice").val());
    	});
    });
	 	function back(){
	    	location.href="roomController/show.do"
	    }
  </script>
  <style type="text/css">
  	input[type="text"]{
  		color:red;
  	}
  </style>
  </head>
  
  <body>
  <center>
  		<h2>续住操作</h2>
      <form action="stayOverController/stay.do"  method="post">
      <div  style=" width:900px;overflow: hidden;">
      	
        <table width="900px;" border="1" align="center" >
           <tr align="center">
	           <td>房间号</td>
	           <td width="144px"><input type="text" name="roomid" value="${list.get(0).roomid}" readonly="readonly"> </td> 
	           <td>房间类型</td>
	           <td width="144px"><input type="text" name="roomtype" value="${list.get(0).roomtype}" readonly="readonly"> </td>
	           <td>房间价格</td>
	           <td width="144px"><input type="text" name="roomprice" value="${list.get(0).roomprice}" id="roomprice" readonly="readonly"> </td>
           </tr>
           <c:forEach items="${list}" var="map" varStatus="sta">
            <tr align="center">
	            <td>顾客姓名</td>
	            <td><input type="text" name="customerList[${sta.count-1}].cusname" value="${map.cusname}" readonly="readonly">
	            	
      				<input type="hidden" name="customerList[${sta.count-1}].custel" value="${map.custel}" readonly="readonly"> 
	             </td> 
	            <td>性别</td>
	            <td><input type="hidden" name="customerList[${sta.count-1}].idcardtype" value="${map.idcardtype}" > 
	            	<input type="text" name="customerList[${sta.count-1}].cussex" value="${map.cussex}" readonly="readonly"> 
	            </td>
	            <td>身份证号</td>
	            <td><input type="text" name="customerList[${sta.count-1}].idcard" value="${map.idcard}" readonly="readonly"> </td>	            
	        </tr>
	       </c:forEach>
            <tr align="center">
	            <td>入住日期</td>
	            <td><input type="text" name="begintime" value="${list.get(0).begintime}" readonly="readonly"> </td> 
	            <td>入住天数</td>
	            <td><input type="text" name="days" value="${list.get(0).days}" id="days" readonly="readonly"> </td>
	            <td>已住天数</td>
	        	<td><input type="text" name="indays" value="${list.get(0).day2-list.get(0).day1}" id="indays" readonly="readonly"></td>
            </tr>
        	<tr align="center">
        		<td>续住天数</td>
	            <td><input type="text" name="staydays"  id="staydays" required="required"></td>
	        	<td>补交房费</td>
	        	<td><input type="text"  name="stayroomprice" id="stayroomprice" required="required"> </td> 
	        </tr> 
	      	
        </table>  
        <center><input type="submit" value="确认续住" >&nbsp; <input type="button" onclick="back()" value="返回" ></center>
        </div>
      </form>
   </center>
   
  </body>
</html>