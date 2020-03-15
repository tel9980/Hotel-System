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
    	var option="";
    	$("#difference").val(0);
    	$("#diff").val(0);
        $("#price").val(0);
	    $("#backcash").val($("#cash").val()-$("#price").val());
        $.ajax({
           url:"store/getRoomUse.do",//请求地址
           //data:{},//请求中携带的参数
           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
           type:"post",//设置请求类型
           dataType:"json",//设置返回值的类型
           success:function(data){//成功后回调的函数
              //alert(1111);
               if(data!=''&&data!=null){
               //循环解析返回json  拼装option
                 for(var i=0;i<data.length;i++){
                    option+="<option value='"+data[i].goodsid+"'>"+data[i].goodsname+"</option>";                   
                 }
                 $("#useinfo").append(option);
               }
           },
         });
         var room = "";
         $.ajax({
           url:"roomController/getfreeroom.do",//请求地址
           //data:{},//请求中携带的参数
           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
           type:"post",//设置请求类型
           dataType:"json",//设置返回值的类型
           success:function(data){//成功后回调的函数
              //alert(1111);
               if(data!=''&&data!=null){
               //循环解析返回json  拼装option
                 for(var i=0;i<data.length;i++){
                    room+="<option value='"+data[i].roomid+"'>"+data[i].roomid+"</option>";                   
                 }
                 $("#changeroomid").append(room);
               }
           },
         });
         $("#changeroomid").change(function(){
         	$("#changeroomprice").empty();
		    $("#changeroomtype").empty();
		    $("#difference").empty();
         	if($(this).val()!=0){
	         	 $.ajax({
		           url:"roomController/getoneroom.do?roomid="+$(this).val(),//请求地址
		           //data:{},//请求中携带的参数
		           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
		           type:"post",//设置请求类型
		           dataType:"json",//设置返回值的类型
		           success:function(data){//成功后回调的函数
		              //alert(1111);
		               if(data!=''&&data!=null){
		               //循环解析返回json  拼装option
		                 $("#changeroomprice").val(data[0].roomprice);
		                 $("#changeroomtype").val(data[0].roomtype);
		                 $("#difference").val($("#changeroomprice").val()-$("#roomprice").val());
		                 var z = $("#days").val()-$("#indays").val();
		                 var i = $("#difference").val()*z;
				    	 var j = $("#price").val();
				    	 $("#diff").val(i*1+j*1);
		               }
		           },
	         	});
         	 }
         });
         var j=0;    
         $("#useinfo").dblclick(function(){
				var trData = "<tr><td><input type='text' name='roomGoodList["+j+"].goodsid' id='goodsid"+j+"'></td><td><input type='text' name='roomGoodList["+j+"].goods' id='goods"+j+"'></td><td><input type='text' name='roomGoodList["+j+"].num' id='num"+j+"' placeholder='请输入数量' onblur='add(this)'></td><td><input type='text' name='roomGoodList["+j+"].price' id='price"+j+"'></td><td><input type='text' name='roomGoodList["+j+"].opemp' id='opemp"+j+"'></td></tr>"
				$("#tbd").append(trData);
				$.ajax({
		           url:"nowregister/goodInfo.do?goodsid="+$("#useinfo>option:selected").val(),//请求地址
		           //data:{},//请求中携带的参数
		           async:false,//是否是同步请求 ，如果不写，默认为true，默认异步的 ，如果为false，同步
		           type:"post",//设置请求类型
		           dataType:"json",//设置返回值的类型
		           success:function(data){//成功后回调的函数
		             
	               if(data!=''&&data!=null){
	               //循环解析返回json  拼装option
	              		$("#goodsid"+j).val(data[0].goodsid);
	                 	$("#goodsid"+j).attr("readonly","readonly");
	                 	$("#goods"+j).val(data[0].goodsname);
	                 	$("#goods"+j).attr("readonly","readonly");
	                 	$("#price"+j).val(data[0].sellprice);
	                 	$("#price"+j).attr("readonly","readonly");
	                 	$("#opemp"+j).val("<%=((Map)session.getAttribute("emptel")).get("empname")%>");
	                 	$("#opemp"+j).attr("readonly","readonly");
	               }
	           },
	          
	        });
	         $("#useinfo>option:selected").remove();
	       
          	j++;
		});
	});
	    function add(t){
	   		var tt=0;
	    	var s = $(t).attr("id").substr($(t).attr("id").length-1,1);  	
	    	for(var i=0;i<=s;i++){
	    	   	tt+= $("#num"+i).val()*$("#price"+i).val();
	    	}
	    	$("#price").val(tt);
	    	var z = $("#days").val()-$("#indays").val();
	    	var i = $("#difference").val()*z;
	    	var j = $("#price").val();
	    	$("#diff").val(i*1+j*1);
	    }
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
  	<h2>换房操作</h2>
      <form action="nowregister/change.do"  method="post">
      <div  style=" width:940px;overflow: hidden">
      	
        <table width="940px" border="1" align="center">
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
	      <%--   <tr>
	            <td>顾客姓名</td>
	            <td><input type="text" name="cusname" value="${list.get(0).cusname}"> </td> 
	            <td>身份证号</td>
	            <td><input type="text" name="idcard" value="${list.get(0).idcard}"> </td>	            
	        </tr> --%>
            <tr align="center">
	            <td>入住日期</td>
	            <td><input type="text" name="begintime" value="${list.get(0).begintime}" readonly="readonly"> </td> 
	            <td>入住天数</td>
	            <td><input type="text" name="days" value="${list.get(0).days}" id="days" readonly="readonly"> </td>
	            <td>已住天数</td>
	        	<td><input type="text" name="indays" value="${list.get(0).day2-list.get(0).day1}" id="indays" readonly="readonly"></td>
            </tr>
        	<tr align="center">
        		<td>更换后房间号</td>
	            <td><select id="changeroomid" name="changeroomid" required="required">
	            	<option value="0">----请选择----</option>
	            </select></td>
	        	<td>更换后房费</td>
	        	<td><input type="text"  name="changeroomprice" id="changeroomprice" required="required"> </td> 
	        	<td>房间类型</td>
	        	<td><input type="text"  name="changeroomtype" id="changeroomtype" required="required"> </td> 
	        </tr> 
	        <tr align="center">
	        	<td>房费差价</td>
	            <td><input type="text"  id="difference" required="required"> </td>
	        	<td>房间消费</td>
	            <td><input type="text" name="roomuse" id="price" required="required"> </td>	        
	        	<td>应补（退）房费总额</td>
	        	<td><input type="text" name="difference" id="diff" required="required"> <input type="hidden" name="roompricesum" value="${list.get(0).roompricesum}" id="roompricesum"></td>
	        	
	        </tr>
        </table>
        <div style="float:left"><table width="90px;" border="1">
        	<tr>
        		<td>
        			房间消费商品选择        			
        		</td>
        	</tr>
        	<tr>
        		<td>
        			<select multiple="multiple"  size="10" id="useinfo">
        				
        			</select>
        		</td>
        	</tr>
        </table></div>
        <div  style="float:right"><table width="800px;" border="1">
           <thead><tr>
          	<td>商品编号</td>
	           <td>商品名称</td>
	           <td>数量</td>
	           <td>单价</td>
	           <td>操作员</td>
           </tr></thead> 
           <tbody id="tbd">
           </tbody>
        </table>
        	<center><input type="submit" value="确认换房" >&nbsp; <input type="button" onclick="back()" value="返回" ></center>
        </div>
        	</div>
      </form>
   </center>
   
  </body>
</html>