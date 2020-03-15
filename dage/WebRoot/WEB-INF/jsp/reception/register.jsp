<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<% String msg=(String)request.getAttribute("msg"); %>
<head>
    <meta charset="utf-8">
    <!-- TITLE -->
    <title>注册</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="shortcut icon" href="../../dage/static1/images/favicon.png"/>

    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Hind:400,300,500,600%7cMontserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- CSS LIBRARY -->
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/font-lotusicon.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/settings.css">
    <link rel="stylesheet" type="text/css" href="../../dage/static1/css/lib/bootstrap-select.min.css">

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
<!--[if (gt IE 9)|!(IE)]><!--> <body> <!--<![endif]-->


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
                                <li class="active"><a href="#">中文</a></li>
                                <li><a href="#">English</a></li>
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
                        <a href="#"><img src="../../dage/static1/images/logo-header.png" alt=""></a>
                    </div>
                    <!-- END / HEADER LOGO -->
                    <!-- HEADER MENU -->
                    <nav class="header_menu">
                        <ul class="menu">
                            <li>
                                <a href="index.jsp">首页</a>
                            </li>
                            <li class="current-menu-item">
                                <a href="room.do">房间</a>
                            </li>
                            <li>
                                <c:choose>  
						  		<c:when test="${sessionScope.user!=null}"><a href="reservation1.do">预定</a>    
						   		</c:when>  
					  		    <c:otherwise><a href="loginforword.do">预定</a>    
					  		   </c:otherwise>  
							</c:choose>    
                            </li>
                            <li>
                                <a href="gallery.do">画廊</a>
                            </li>
                        </ul>
                    </nav>
                    <!-- END / HEADER MENU -->

                    <!-- MENU BAR -->
                    <span class="menu-bars">
                        <span></span>
                    </span>
                    <!-- END / MENU BAR -->
                </div>
            </div>
            <!-- END / HEADER LOGO & MENU -->
        </header>
        <!-- END / HEADER -->
        <!-- ACCOUNT -->
        <section class="section-account parallax bg-11">
            <div class="awe-overlay"></div>
            <div class="container">
                <div class="login-register">
                    <div class="text text-center">
                        <h2>注册</h2>
                        <p>期待你加入我们!</p>
                        <form action="register2.do" class="account_form" method="post" onsubmit="return check(this)" >

                            <div class="field-form">
                            <span id="info" ></span>
                                <input type="text" id="name" name="account" class="field-text" placeholder="手机号码">
                            </div>
                            <div class="field-form">
                                <input type="password" id="password" name="passwd" class="field-text" placeholder="密码">
                                <span class="view-pass"><i class="lotus-icon-view"></i></span>
                            </div>
                            <div class="field-form field-submit">
                                <button class="awe-btn awe-btn-13" type="submit" >注册</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- END / ACCOUNT -->

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
                                    <a ><i class="fa fa-pinterest"></i></a>
                                    <a ><i class="fa fa-facebook"></i></a>
                                    <a ><i class="fa fa-twitter"></i></a>
                                    <a ><i class="fa fa-google-plus"></i></a>
                                    <a ><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- END / WIDGET SOCIAL -->

                    </div>
                </div>
            </div>
            <!-- END / FOOTER TOP -->

        <!-- FOOTER CENTER -->
        <div class="footer_center bgr-footer">
            <div class="container">
                <div class="content pt10 pb60">
                    <div class="row">
                        <div class="col-xs-6 col-sm-3">
                            <div class="footer-logo clearfix">
                                <div class="widget widget_logo clearfix">
                                    <div class="widget-logo text-center">
                                        <div class="img">
                                            <a href="#"><img class="img-center" src="../../dage/static1/images/home-3/footer/logo-footer.png" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget widget_tripadvisor clearfix">
                                    <div class="tripadvisor text-center">
                                        <img class="img-center" src="../../dage/static1/images/home-3/footer/logo-trivision.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="widget">
                            </div>
                            <div class="widget">
                                <h4 class="widget-title f20 bold">支付方式</h4>
                                 <div class="payment pull-right inline-block">
                        <img src="../../dage/static1/images/home-3/footer/card.png" alt="" class="img-responsive">
                    </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="widget">
                                <h4 class="widget-title f20 bold">服务</h4>
                                <ul>
                                    <li><a >住宿</a></li>
                                    <li><a >留言簿</a></li>
                                    <li><a >画廊</a></li>
                                    <li><a >餐厅</a></li>
                                    <li><a >活动</a></li>
                                    <li><a >提议</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="widget">
                                <h4 class="widget-title f20 bold">连接</h4>
                                <ul>
                                    <li><a href="index.jsp">首页</a></li>
                                    <li><a href="room.do">房间</a></li>
                                    <li><a >联系我们</a></li>
                                    <li><a >询价</a></li>
                                </ul>
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
    //用户提示信息
	<%if(msg!=null){%>
		alert("<%=msg%>");
	<%}%>
	//检测手机号和密码输入框
	function check(r){
		return phoneNum()&&checkLength();
	}
	function phoneNum(r){
	   var name = document.getElementById("name").value;
		   //手机号不能为空
		  if(name == null || name == ''){
		        $("#info").html("用户名不能为空！").css({"font-size":"25px","color":"#ffffff"});
		        return false;
		 }else{
		 var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
		//手机号正确性验证
		var phone = document.getElementById("name").value;
		   if (!phoneReg.test(phone)) {
		   $("#info").html("请输入有效的手机号码！").css({"font-size":"25px","color":"#ffffff"});
			 return false;
		   }
	   }
	   return true;
	 }	
	//验证密码为六到十二位
	function checkLength(){
		var password=document.getElementById("password"); //获取密码框值
		if(password.value.length<6||password.value.length>12){
		$("#info").html("请设置六到十二位之间的密码！").css({"font-size":"25px","color":"#ffffff"});
		return false;
		}
		return true;	
	}
	</script>
</body>
</html>