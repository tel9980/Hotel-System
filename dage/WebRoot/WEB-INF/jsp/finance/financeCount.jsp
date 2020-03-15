<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>酒店财务统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="static/js/echarts.min.js"></script>
  <script type="text/javascript" src="static/js/jquery-1.11.0.min.js"></script>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script> 
  </head>
  
  <body>
  
				
    <select id="year" >
    <option>2018</option>
    <option>2019</option>
    <option>2017</option>
    </select>年
    <select id="month" >
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10" selected="selected">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    </select>月
    
  <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
   <center> <div id="main" style="width:600px;height:400px;"></div></center>
    <input type='button' value="导出数据" onclick="Export()">
    
    <script type="text/javascript">
    //js定义数组
          
          $(function(){
            //默认显示
            getData(2018,10);
            //月份变化时变化
            $("#month").change(function(){
            	$("#main").empty();
             	$("#tt").remove();
             	 $('#main').removeAttr('_echarts_instance_'); 
                getData($("#year").val(),$("#month").val());
            });
          });
        
          function getData(year,month){
          		
	          var title = [];
	          var ydata1 = [];
	          var ydata2 = [];
	       
          //使用ajax得到数据
	          $.ajax({
	             url:"financeAll/edata.do",
	             type:"post",
	             data:{year:year,month:month},
	             dataType:"json",
	             async:false,//同步
	             success:function(data){
	               
	                if(data!=''){
	                 for(var i=0;i<data.length;i++){
	                    title.push(data[i].time);
	                    ydata1.push(data[i].income);
	                    ydata2.push(data[i].outcome);
	                 }
	                 showData(title,ydata1,ydata2);
	                }else{
	                  $("#main").html("本月大哥还没来,不然怎么会没有数据！！！").css({"font-size":"40px","color":"#ff0000"});
	                    
	                  $("#main").append("<input type='hidden' value='1' id='tt'>");
	                  
	                }
	             }
	          });
          }
          
          function showData(title,ydata1,ydata2){
			        // 基于准备好的dom，初始化echarts实例
			          var myChart = echarts.init(document.getElementById('main'));
			
			       
						option = {
						    title : {
						        text: '达阁酒店财务统计',
						        subtext: '数据来源于达格酒店'
						    },
						    tooltip : {
						        trigger: 'axis'
						    },
						    legend: {
						        data:['收入','支出']
						    },
						    toolbox: {
						        show : true,
						        feature : {
						            dataView : {show: true, readOnly: false},
						            magicType : {show: true, type: ['line', 'bar']},
						            restore : {show: true},
						            saveAsImage : {show: true}
						        }
						    },
						    calculable : true,
						    xAxis : [
						        {
						            type : 'category',
						            data : title
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    series : [
						        {
						            name:'收入',
						            type:'bar',
						            data:ydata1,
						            markPoint : {
						                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'}
						                ]
						            },
						            markLine : {
						                data : [
						                    {type : 'average', name: '平均值'}
						                ]
						            }
						        },
						        {
						            name:'支出',
						            type:'bar',
						            data:ydata2,
						            markPoint : {
						                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'}
						                ]
						            },
						            markLine : {
						                data : [
						                    {type : 'average', name : '平均值'}
						                ]
						            }
						        }
						    ]
						};
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option);
        }
        function Export(){
         if($("#tt").val()==1){
         $.messager.show({//easyui封装的浏览器右下角弹框
							title: '信息提示',//弹框标题
							msg: '本月无数据，无法导出数据！'//提示信息
				 });}
        else{ 
        
        location.href="financeAll/echartDataExp.do?year="+$("#year").val()+"&month="+$("#month").val();}
        
        }
    </script>
  </body>
</html>
