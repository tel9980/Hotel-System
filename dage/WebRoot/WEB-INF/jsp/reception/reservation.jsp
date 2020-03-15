<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<% List<Map<String,Object>> room=(List<Map<String,Object>>)request.getAttribute("room"); %>
<head>
<meta charset="utf-8">
<!-- TITLE -->
<title>房间预定</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="shortcut icon" href="../../dage/static1/images/favicon.png" />
<!-- GOOGLE FONT -->
<link
	href='http://fonts.googleapis.com/css?family=Hind:400,300,500,600%7cMontserrat:400,700'
	rel='stylesheet' type='text/css'>

<!-- CSS LIBRARY -->
<link rel="stylesheet" type="text/css"  href="../../dage/static1/css/lib/font-awesome.min.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/font-lotusicon.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/bootstrap.min.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/owl.carousel.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/magnific-popup.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/settings.css">
<link rel="stylesheet" type="text/css"	href="../../dage/static1/css/lib/bootstrap-select.min.css">

<!-- MAIN STYLE -->
<link rel="stylesheet" type="text/css" href="../../dage/static1/css/style.css">

<!--[if lt IE 9]>
        <script src="../../dage/static1/http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="../../dage/static1/http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
</head>

<!--[if IE 7]> <body class="ie7 lt-ie8 lt-ie9 lt-ie10"> <![endif]-->
<!--[if IE 8]> <body class="ie8 lt-ie9 lt-ie10"> <![endif]-->
<!--[if IE 9]> <body class="ie9 lt-ie10"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body>
	<!--<![endif]-->


	<!-- PRELOADER -->
	<div id="preloader">
		<span class="preloader-dot"></span>
	</div>
	<!-- END / PRELOADER -->

	<!-- PAGE WRAP -->
	<div id="page-wrap">

		<!-- HEADER -->
		<header id="header">

			<!-- HEADER TOP -->
			<div class="header_top">
				<div class="container">
                <div class="header_left float-left">
                <span><i class="lotus-icon-location"></i> 郑州市 金水区 杨金路 1号</span>
				<span>
					<iframe width="150" scrolling="no" height="15" frameborder="0" allowtransparency="true" 
					src="//i.tianqi.com/index.php?c=code&id=11&color=%23FFFFFF&icon=1&py=jinshuiqu&site=12">
					</iframe>
				</span>
                </div>
                    <div class="header_right float-right">
                    <div class="dropdown currency">
                    <c:choose>  
						<c:when test="${sessionScope.user==null}">
							<span>登陆/注册 <i class="fa fa"></i></span>
                        <ul>
                            <li class="active"><a href="loginforword.do">登陆</a></li>
                            <li><a href="register1.do">注册</a></li>
                        </ul>
						</c:when>  
					  	<c:otherwise>
					  		<span>${sessionScope.user}<i class="fa fa"></i></span>
                        <ul>
                            <li class="active"><a href="person.do">个人中心</a></li>
                            <li><a href="loginforword.do">退出登陆</a></li>
                        </ul>
					  	</c:otherwise>  
					</c:choose>   
                    </div>   

						<div class="dropdown language">
							<span>语言</span>

							<ul>
								<li class="active"><a href="#">中文</a>
								</li>
								<li><a href="#">English</a>
								</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
			<!-- END / HEADER TOP -->

			<!-- HEADER LOGO & MENU -->
			<div class="header_content" id="header_content">

				<div class="container">
					<!-- HEADER LOGO -->
					<div class="header_logo">
						<a href="#"><img src="../../dage/static1/images/logo-header.png" alt="">
						</a>
					</div>
					<!-- END / HEADER LOGO -->

					<!-- HEADER MENU -->
					<nav class="header_menu">
						<ul class="menu">
							<li><a href="index.jsp">首页</a></li>
							<li class="current-menu-item"><a href="room.do">房间</a>
							</li>
							<li>
							<c:choose>  
						  		<c:when test="${sessionScope.user!=null}"><a href="reservation1.do">预定</a>    
						   		</c:when>  
					  		    <c:otherwise><a href="loginforword.do">预定</a>    
					  		   </c:otherwise>  
							</c:choose> 
							</li>
							<li><a href="gallery.do">画廊</a></li>
						</ul>
					</nav>
					<!-- END / HEADER MENU -->

					<!-- MENU BAR -->
					<span class="menu-bars"> <span></span> </span>
					<!-- END / MENU BAR -->

				</div>
			</div>
			<!-- END / HEADER LOGO & MENU -->

		</header>
		<!-- END / HEADER -->

		<!-- SUB BANNER -->
		<section class="section-sub-banner bg-9">

			<div class="awe-overlay"></div>

			<div class="sub-banner">
				<div class="container">
					<div class="text text-center">
						<h2>预定</h2>
						<p>达阁国际酒店能带给你一次完美的入住体验</p>
					</div>
				</div>
			</div>
		</section>
		<!-- END / SUB BANNER -->
	<form action="reserve.do"method="post" onsubmit="return check(this)">
		<!-- RESERVATION -->
		<section class="section-reservation-page bg-white">
			<div class="container">
				<div class="reservation-page">
					<div class="row">
						<!-- SIDEBAR -->
						<div class="col-md-4 col-lg-3">
							<div class="reservation-sidebar">
								<!-- SIDEBAR AVAILBBILITY -->
								<div class="reservation-sidebar_availability bg-gray">
									<!-- HEADING -->
									<h2 class="reservation-heading">你的预定</h2>
									<span id="info" ></span>
									<!-- END / HEADING -->
									<h6 class="check_availability_title">选择时间</h6>
									<div class="check_availability-field">
										<label>预计到达时间</label> <input id="beginTime" name="beginTime" type="text"
											class="awe-calendar awe-input from" placeholder="Arrive">
									</div>
									<div class="check_availability-field">
										<label>入住天数</label> 
										<input type="text" placeholder="请输入入住天数" id="days" oninput="cop()" name="days" class="input-text"
                                           onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
									
									</div>
									<h6 class="check_availability_title">房间 &amp; 客人</h6>
									<div class="check_availability-field">
										<label>选择房间类型</label> 
										<select class="awe-select" id="roomprice" name="roomtype" onChange="cop()">
										<c:forEach items="${room}" var="room">
										<option  id="room">${room.get("roomtype")}每天只需${room.get("roomprice")}
										</option>
										</c:forEach>
										</select>
									</div>
									<div class="check_availability-field">
										<label>人数</label> 
										<select class="awe-select" name="cusnumber">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>
									<div class="check_availability-field">
										<label>费用</label> 
										<input type="text" name="roompricesum" id="roompricesum" onfocus=this.blur() name="roompricesum" class="input-text">
									</div>
								</div>
								<!-- END / ROOM SELECT -->
							</div>
						</div>
						<!-- END / SIDEBAR -->
						<!-- CONTENT -->
						<div class="col-md-8 col-lg-9">
							<div class="reservation_content">
								<div class="reservation-billing-detail">
									<div class="row">
										<div class="col-sm-6">
											<label>姓名<sup>*</sup>
											</label> 
										<input id="cusName" name="cusName"  type="text" class="input-text">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<!-- <div class="check_availability-field">
												<label>证件类型</label> 
												<select class="awe-select" name="idcardtype">
													<option>身份证</option>
													<option>护照</option>
												</select>
											</div> -->
										</div>
										<div class="col-sm-6">
										<!--	< div class="check_availability-field">
												<label>性别</label>
												<select name="sex" class="awe-select">
													<option>男</option>
													<option>女</option>
												</select>
											</div> -->
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<label>手机号<sup>*</sup></label> 
											<input id="account" name="account" type="text" 
												 value="${sessionScope.user}" 
											onfocus=this.blur()  class="input-text">
										</div>
										<!-- <div class="col-sm-6">
											<label>证件号<sup>*</sup>
											</label> <input name="cusidcard" id="cusidcard" type="text" class="input-text">
										</div> -->
									</div>
									 <label>备注</label>
                                    <textarea name="remarks" class="input-textarea" placeholder="请输入你的需求，我们将以最大努力给予满足！"></textarea>
									<ul class="option-bank">
										<li><label class="label-radio"> <input
												type="radio" class="input-radio" name="chose-bank">
												选择付款方式 </label>
											<p>请使用您的订单编号作为付款参考。您的订单要到我们账户的资金结清后才能生效。</p></li>
										<img src="../dage/static1/images/icon-card.jpg" alt="">
										</li>
									</ul>
									<input type="submit" class="awe-btn awe-btn-13" value="提交">
								</div>
							</div>
						</div>
						<!-- END / CONTENT -->
					</div>
				</div>
			</div>
		</section>
		<!-- END / RESERVATION -->
</form>
		<!-- FOOTER -->
		<footer id="footer">

			<!-- FOOTER TOP -->
			<div class="footer_top">
				<div class="container">
					<div class="row">

						<!-- WIDGET MAILCHIMP -->
						<div class="col-lg-9">
							<div class="mailchimp">
								<h4>达阁国际酒店</h4>
								<div class="mailchimp-form">
									<h4>欢迎你的到来</h4>
								</div>
							</div>
						</div>
						<!-- END / WIDGET MAILCHIMP -->

						<!-- WIDGET SOCIAL -->
						<div class="col-lg-3">
							<div class="social">
								<div class="social-content">
									<a href="#"><i class="fa fa-pinterest"></i>
									</a> <a href="#"><i class="fa fa-facebook"></i>
									</a> <a href="#"><i class="fa fa-twitter"></i>
									</a> <a href="#"><i class="fa fa-google-plus"></i>
									</a> <a href="#"><i class="fa fa-instagram"></i>
									</a>
								</div>
							</div>
						</div>
						<!-- END / WIDGET SOCIAL -->

					</div>
				</div>
			</div>
			<!-- END / FOOTER TOP -->

			<!-- FOOTER CENTER -->
			<div class="footer_center">
				<div class="container">
					<div class="row">

						<div class="col-xs-12 col-lg-5">
							<div class="widget widget_logo">
								<div class="widget-logo">
									<div class="img">
										<a href="#"><img src="../../dage/static1/images/logo-footer.png"
											alt="">
										</a>
									</div>
									<div class="text">
                                    <p><i class="lotus-icon-location mr10"></i> 郑州市 金水区 杨金路 1号</p>
                                    <p><i class="lotus-icon-phone mr10"></i> 1-548-854-8898</p>
                                    <p><i class="fa fa-envelope-o mr10"></i> <a>hello@dagehotel.com</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-4 col-lg-2">
							<div class="widget">
								<h4 class="widget-title f20 bold">服务</h4>
								<ul>
									<li><a>住宿</a>
									</li>
									<li><a>留言簿</a>
									</li>
									<li><a>画廊</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="col-xs-4 col-lg-2">
							<div class="widget">
								<h4 class="widget-title f20 bold">快速连接</h4>
								<ul>
									<li><a href="index.jsp">首页</a>
									</li>
									<li><a href="room.do">房间</a>
									</li>
									<li><a >联系我们</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="col-xs-4 col-lg-3">
							<div class="widget widget_tripadvisor">
								<h4 class="widget-title">达阁国际酒店</h4>
								<div class="tripadvisor">
									<p>给你家一般的温暖</p>
									<img src="../../dage/static1/images/tripadvisor.png" alt=""> <span
										class="tripadvisor-circle"> <i></i> <i></i> <i></i> <i></i>
										<i class="part"></i> </span>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
			<!-- END / FOOTER CENTER -->

			<!-- FOOTER BOTTOM -->
			<div class="footer_bottom">
				<div class="container">
					<p>版权 &copy; 2018年 第十一组版权所有</p>
				</div>
			</div>
			<!-- END / FOOTER BOTTOM -->

		</footer>
		<!-- END / FOOTER -->

	</div>
	<!-- END / PAGE WRAP -->


	<!-- LOAD JQUERY -->
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/bootstrap-select.js"></script>
	<script src="http://ditu.google.cn/maps/api/js?v=3.exp&amp;signed_in=true"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/owl.carousel.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.appear.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.countTo.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.parallax-1.1.3.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/lib/SmoothScroll.js"></script>
	<script type="text/javascript" src="../../dage/static1/js/scripts.js"></script>
	<script type="text/javascript">
	//自动生成订单价格
	function cop(){
        var str=document.getElementById("days").value;
	 	var str1=document.getElementById("roomprice").value;
	 	var str2=str1.substring(str1.length-3);
        document.getElementById("roompricesum").value = str*str2;
    }
 	//检测输入框
	function check(r){
		return phoneNum()&&cherkDate()&&cherkName()&&cherkDays();
	}
	function phoneNum(r){
	   var account = document.getElementById("account").value;
		   //手机号不能为空
		  if(account == null || account == ''){
		  		$("#info").html("手机号不能为空！").css({"font-size":"25px","color":"#ff0000"});
		        return false;
		 }else{
			 var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
			//手机号正确性验证
			var phone = document.getElementById("account").value;
		   if (!phoneReg.test(phone)) {
		   	  $("#info").html("请输入有效的手机号码！").css({"font-size":"25px","color":"#ff0000"});
			 return false;
		   }
	   }
	   return true;
	 }	
	 //验证开始时间不能为空
	 function cherkDate(){
	 	var beginTime = document.getElementById("beginTime").value;
		   //开始时间不能为空
		  if(beginTime == null || beginTime == ''){
		  $("#info").html("必须选择入住时间！").css({"font-size":"25px","color":"#ff0000"});
		        return false;
		 }
		 return true;
	 }
	 function cherkName(){
	 	var name = document.getElementById("cusName").value;
		   //姓名输入框不能为空
		  if(name == null || name == ''){
		  $("#info").html("请输入正确的姓名！").css({"font-size":"25px","color":"#ff0000"});
		        return false;
		 }else{
			//姓名不能过长
			var name = document.getElementById("cusName").value;
		   if (name.length>6) {
		   	  $("#info").html("姓名不能超过六位！").css({"font-size":"25px","color":"#ff0000"});
			 return false;
		   }
		 }
		 return true;
	 	
	 }
     function cherkDays(){
	 	var days = document.getElementById("days").value;
		   //入住天数不能为空
		  if(days == null || days == ''){
		  $("#info").html("必须选择天数！").css({"font-size":"25px","color":"#ff0000"});
		        return false;
		 }
		 return true;
	 	
	 }
	//身份证号码验证
/* 	 function check(r) { 
			var code = document.getElementById("cusidcard").value;
            var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};

            if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
                alert("身份证号格式错误");
                return false;
            }
           else if(!city[code.substr(0,2)]){
                alert("地址编码错误");
                return false;
            }
            else{
                //18位身份证需要验证最后一位校验位
                if(code.length == 18){
                    code = code.split('');
                    //∑(ai×Wi)(mod 11)
                    //加权因子
                    var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                    //校验位
                    var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                    var sum = 0;
                    var ai = 0;
                    var wi = 0;
                    for (var i = 0; i < 17; i++)
                    {
                        ai = code[i];
                        wi = factor[i];
                        sum += ai * wi;
                    }
                    var last = parity[sum % 11];
                    if(parity[sum % 11] != code[17]){
                        alert("校验位错误");
                        return false;
                    }
                }
            }
            return true;
        } */
	</script>
</body>
</html>