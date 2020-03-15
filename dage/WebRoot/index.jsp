<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- TITLE -->
    <title>欢迎</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="shortcut icon" href="static1/images/favicon.png"/>
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Hind:400,300,500,600%7cMontserrat:400,700' rel='stylesheet'
          type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet">

    <!-- CSS LIBRARY -->
    <link rel="stylesheet" type="text/css" href="static1/css/lib/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/font-lotusicon.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/settings.css">
    <link rel="stylesheet" type="text/css" href="static1/css/lib/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="static1/css/helper.css">
    <link rel="stylesheet" type="text/css" href="static1/css/custom.css">
    <link rel="stylesheet" type="text/css" href="static1/css/responsive.css">
    <!-- MAIN STYLE -->
    <link rel="stylesheet" type="text/css" href="static1/css/style.css">
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
</head>
<!--[if IE 7]>
<body class="ie7 lt-ie8 lt-ie9 lt-ie10"> <![endif]-->
<!--[if IE 8]>
<body class="ie8 lt-ie9 lt-ie10"> <![endif]-->
<!--[if IE 9]>
<body class="ie9 lt-ie10"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body> <!--<![endif]-->
<!-- PRELOADER -->
<div id="preloader">
    <span class="preloader-dot"></span>
</div>
<!-- END / PRELOADER -->
<div id="page-wrap" class="bg-white-2">
    <!-- HEADER -->
    <header id="header" class="header-v3 clearfix">
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
                    <span class="socials">
                        <a><i class="fa fa-facebook"></i></a>
                        <a><i class="fa fa-twitter"></i></a>
                        <a><i class="fa fa-pinterest-p"></i></a>
                        <a><i class="fa fa-youtube"></i></a>
                    </span>
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
                <!-- HEADER LOGO -->
                <a class="logo-top img-responsive"><img src="static1/images/logo-header.png" alt=""></a>
                <!-- END / HEADER LOGO -->
            </div>
        </div>
        <!-- END / HEADER TOP -->
        <!-- HEADER LOGO & MENU -->

        <div class="header_content" id="header_content">
            <div class="container">
                <!-- HEADER LOGO -->
                <div class="header_logo">
                    <a><img src="static1/images/logo-header.png" alt=""></a>
                </div>
                <!-- END / HEADER LOGO -->
                <!-- HEADER MENU -->
                <nav class="header_menu">
                    <ul class="menu">
				<li>
					<a href="index.do">首页</a>
				</li>
                 <li>
					<a href="room.do">房间 </a>
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
    <!-- BANNER SLIDER -->
    <section class="section-slider slider-style-2 clearfix">
        <h1 class="element-invisible">滑件</h1>
        <div id="slider-revolution">
            <ul>
                <li data-transition="fade">
                    <img src="static1/images/home-3/slider-1.png" data-bgposition="left center" data-duration="14000"
                         data-bgpositionend="right center" alt="">
                    <div class="tp-caption sft fadeout slider-caption-sub slider-caption-1" data-x="center" data-y="100"
                         data-speed="700" data-start="1500" data-easing="easeOutBack">
                        <img src="static1/images/slider/hom1-slide1.png" alt="icons">
                    </div>
                    <div class="tp-caption sft fadeout slider-caption-sub slider-caption-1" data-x="center" data-y="240"
                         data-speed="700" data-start="1500" data-easing="easeOutBack">
                       		 欢迎
                    </div>
                    <div class="tp-caption sfb fadeout slider-caption slider-caption-sub-1" data-x="center" data-y="280"
                         data-speed="700" data-easing="easeOutBack" data-start="2000">达阁国际酒店
                    </div>
                    <a href="#" class="tp-caption sfb fadeout awe-btn awe-btn-12 awe-btn-slider" data-x="center"
                       data-y="380" data-easing="easeOutBack" data-speed="700" data-start="2200">欢迎你的到来</a>
                </li>
                <li data-transition="fade">
                    <img src="static1/images/home-3/slider-2.png" data-bgposition="left center" data-duration="14000"
                         data-bgpositionend="right center" alt="">
                    <div class="tp-caption sft fadeout" data-x="center" data-y="195" data-speed="700" data-start="1300"
                         data-easing="easeOutBack">
                        <img src="static1/images/icon-slider-1.png" alt="">
                    </div>
                    <div class="tp-caption sft fadeout slider-caption-sub slider-caption-sub-3" data-x="center"
                         data-y="220" data-speed="700" data-start="1500" data-easing="easeOutBack">
                     	   达阁国际酒店
                    </div>
                    <div class="tp-caption sfb fadeout slider-caption slider-caption-3" data-x="center" data-y="260"
                         data-speed="700" data-easing="easeOutBack" data-start="2000">
                   	     完美的服务
                    </div>
                    <div class="tp-caption sfb fadeout slider-caption-sub slider-caption-sub-3" data-x="center"
                         data-y="365" data-easing="easeOutBack" data-speed="700" data-start="2200">带给完美的你
                    </div>
                    <div class="tp-caption sfb fadeout slider-caption-sub slider-caption-sub-3" data-x="center"
                         data-y="395" data-easing="easeOutBack" data-speed="700" data-start="2400"><img
                         src="static1/images/icon-slider-2.png" alt=""></div>
                </li>
            </ul>
        </div>
    </section>
    <section class="ot-accomd-modations">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col-xs-12 col-lg-6 col-lg-offset-3">
                        <div class="ot-heading pt80 pb30 text-center row-20">
                            <h2 class="mb15">房间展示</h2>
                            <p class="sub pr10 pl10">
                                	客房内可通过视听设备提供帐单等的可视性查询服务。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="ot-accomd-modations-content owl-single" data-single_item="false" data-desktop="1"
                             data-small_desktop="1"
                             data-tablet="2" data-mobile="1"
                             data-nav="false"
                             data-pagination="false">
                            <div class="row">
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a ><img class="img-responsive img-full" src="static1/images/room/img-1.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>豪华单人间</a></h2>
                                        <p class="price">
                                           	 从每天118元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">01</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">34.5</span>
                                                <span>大小 M<sup>2</sup></span>

                                            </p>
                                            <p>
                                                <span class="number">01</span>
                                                <span> 卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold"> 
							欢迎你的到来
						    </a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a><img class="img-responsive img-full" src="static1/images/room/img-9.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>家庭套间</a></h2>
                                        <p class="price">
                                     	       从每天168元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">04</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">90</span>
                                                <span>大小 M<sup>2</sup></span>

                                            </p>
                                            <p>
                                                <span class="number">03</span>
                                                <span> 卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold"> 
										    欢迎你的到来
									    </a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a><img class="img-responsive img-full" src="static1/images/room/img-8.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>情侣大床房</a></h2>
                                        <p class="price">
                                            	从每天128元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">02</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">50</span>
                                                <span>大小 M<sup>2</sup></span>

                                            </p>
                                            <p>
                                                <span class="number">01</span>
                                                <span>卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold"> 
						 				   欢迎你的到来
						 				</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a><img class="img-responsive img-full" src="static1/images/room/img-3.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>行政间</a></h2>
                                        <p class="price">
                                      	      从每天158元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">02</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">60</span>
                                                <span>大小 M<sup>2</sup></span>
                                            </p>
                                            <p>
                                                <span class="number">01</span>
                                                <span>卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold"> 
											欢迎你的到来
						 			   </a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a><img class="img-responsive img-full" src="static1/images/room/img-6.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>总统套房</a></h2>
                                        <p class="price">
                                       	     从每天188元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">02</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">180</span>
                                                <span>大小 M<sup>2</sup></span>
                                            </p>
                                            <p>
                                                <span class="number">02</span>
                                                <span>卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold">
											欢迎你的到来
						   				 </a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="item room-item text-center accomd-modations-room_1">
                                        <div class="img">
                                            <a><img class="img-responsive img-full" src="static1/images/room/img-5.jpg"
                                                             alt=""></a>
                                        </div>
                                        <h2 class="title"><a>商务间</a></h2>
                                        <p class="price">
                                          	 从每天128元开始
                                        </p>
                                        <div class="info upper">
                                            <p>
                                                <span class="number">02</span>
                                                <span>可入住的人数</span>
                                            </p>
                                            <p>
                                                <span class="number">60</span>
                                                <span>大小 M<sup>2</sup></span>
                                            </p>
                                            <p>
                                                <span class="number">01</span>
                                                <span>卧室</span>
                                            </p>
                                        </div>
                                        <a class="awe-btn awe-btn-default btn-medium font-hind f12 bold">
											    欢迎你的到来
						 			   </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END / ACCOMMODATIONS -->
    <!-- ABOUT -->
    <section class="ot-about mt60">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col col-xs-12 col-lg-6 col-lg-offset-3">
                        <div class="ot-heading mb40 row-20 text-center">
                            <h2>达阁国际酒店</h2>
                            <p class="sub pr10 pl10">
                               一流的管理、一流的团队、一流的服务、一流的配套将是您精彩人生的最佳驿站。
                            </p>
                        </div>
                    </div>
                </div>
                <div class="img-hover-box mb40">
                    <div class="img">
                        <img class="img-responsive" src="static1/images/home-3/about-hill.png" alt="">
                    </div>
                </div>
                <div class="text-center mt40 mb30 featured">
                    <p class="font-hind f-500 f20">五星级酒店，带给你五星级的享受！
			</p>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                        <div class="details">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <p class="font-hind f14 pr15">
                                                    达阁国际酒店是集旅游、会议、休闲娱乐为一体的涉外综合型商务酒店，
						    酒店占地面积4.5万㎡，楼高54米，距国家5A景区也仅需1小时，
						    是您商务洽谈、旅游观光及居家休闲的梦幻天堂。
			
                                    </p>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <p class="font-hind f14 pl15">
                                                    酒店聘请香港知名酒店管理专家为您精心定制各项服务，
						   一流的管理、一流的团队、一流的服务、
						   一流的配套一定将是您精彩人生的最佳驿站。
                                    </p>
                                </div>
                            </div>
                            <div class="text-center">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END / ABOUT -->
    <!-- OUR BEST -->
    <section class="ot-out-best mt60">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col col-xs-12 col-lg-6 col-lg-offset-3">
                        <div class="ot-heading mb40 row-20 text-center">
                            <h2>酒店服务</h2>
                        </div>
                    </div>
                </div>
                <div class="owl-single owl-best" data-single_item="false" data-desktop="6"
                     data-small_desktop="4"
                     data-tablet="3" data-mobile="2"
                     data-nav="true"
                     data-pagination="false">
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-11.png" alt="icon">
                        <span class="font-hind f-500">免费无线网络</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-12.png" alt="icon">
                        <span class="font-hind f-500">停车场</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-16.png" alt="icon">
                        <span class="font-hind f-500">二十四小时管家</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-12.png" alt="icon">
                        <span class="font-hind f-500">机场专车接送</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-15.png" alt="icon">
                        <span class="font-hind f-500">高清电视直播</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-2.png" alt="icon">
                        <span class="font-hind f-500">多种语言支持</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-13.png" alt="icon">
                        <span class="font-hind f-500">优美的餐厅环境</span>
                    </div>
                    <div class="item text-center">
                        <img class="img-responsive mb10" src="static1/images/home-3/icon/icon-16.png" alt="icon">
                        <span class="font-hind f-500">一流的安保服务</span>
                </div>
            </div>
        </div>
    </section>
    <!-- END / OUR BEST -->
    <!-- DEALS PACKAGE -->
    <section class="section-deals mt90">
        <div class="container">
            <div class="content">
                <div class="row">
                    <div class="col col-xs-12 col-lg-6 col-lg-offset-3">
                        <div class="ot-heading row-20 mb30 text-center">
                            <h2>配套设施</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <div class="item item-deal">
                            <div class="img">
                                <img class="img-full" src="static1/images/home-3/deals/deals-1.png" alt="">
                            </div>
                            <div class="info">
                                <a class="title bold f26 font-monserat upper">餐厅</a>
                                <p class="sub font-monserat f12 f-600 upper mt10 mb20">二十四小时</p>
                                <a class="awe-btn awe-btn-12 btn-medium font-hind f12 bold">欢迎你的到来</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="item item-deal">
                            <div class="img">
                                <img class="img-full" src="static1/images/home-3/deals/deals-2.png" alt="">
                            </div>
                            <div class="info">
                                <a class="title bold f26 font-monserat upper">健身房</a>
                                <p class="sub font-monserat f12 f-600 upper mt10 mb20">二十四小时</p>
                                <a class="awe-btn awe-btn-12 btn-medium font-hind f12 bold">欢迎你的到来</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="item item-deal">
                            <div class="img">
                                <img class="img-full" src="static1/images/home-3/deals/deals-3.png" alt="">
                            </div>
                            <div class="info">
                                <a class="title bold f26 font-monserat upper" >温泉按摩</a>
                                <p class="sub font-monserat f12 f-600 upper mt10 mb20">二十四小时</p>
                                <a class="awe-btn awe-btn-12 btn-medium font-hind f12 bold">欢迎你的到来</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="item item-deal">
                            <div class="img">
                                <img class="img-full" src="static1/images/home-3/deals/deals-4.png" alt="">
                            </div>
                            <div class="info">
                                <a class="title bold f26 font-monserat upper">安保服务</a>
                                <p class="sub font-monserat f12 f-600 upper mt10 mb20">二十四小时</p>
                                <a class="awe-btn awe-btn-12 btn-medium font-hind f12 bold">欢迎你的到来</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END / DEALS PACKAGE -->
    <!-- FOOTER -->
    <footer id="footer" class="footer-style-2">
        <!-- FOOTER TOP -->
        <div class="container">
            <div class="footer_top">
                <div class="row">
                    <!-- WIDGET MAILCHIMP -->
                    <div class="content v-align clearfix">
                        <div class="col-xs-12 col-sm-6">
                            <div class="desc clearfix inline-block">
                                <h4 class="font-monserat bold f36 upper">达阁国际酒店</h4>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                            <div class="mailchimp">
                                <div class="mailchimp-form">
                                    <h4 class="font-monserat bold f36 upper">欢迎联系我们</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END / WIDGET MAILCHIMP -->
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
                                            <a href="#"><img class="img-center" src="static1/images/home-3/footer/logo-footer.png" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget widget_tripadvisor clearfix">
                                    <div class="tripadvisor text-center">
                                        <img class="img-center" src="static1/images/home-3/footer/logo-trivision.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3">
                            <div class="widget">
                                <h4 class="widget-title f20 bold">信息</h4>
                                <div class="text">
                                    <p><i class="lotus-icon-location mr10"></i></p>
                                    <p><i class="lotus-icon-phone mr10"></i> </p>
                                    <p><i class="fa fa-envelope-o mr10"></i> <a></a>
                                    </p>
                                </div>
                            </div>
                            <div class="widget">
                                <h4 class="widget-title f20 bold">支付方式</h4>
                                 <div class="payment pull-right inline-block">
                        <img src="static1/images/home-3/footer/card.png" alt="" class="img-responsive">
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
                                    <li><a>联系我们</a></li>
                                    <li><a href="gallery.do">画廊</a></li>
                                    <li><a>询价</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright" align="center">
                <div class="container">
                    <p class="left inline-block f14">版权 &copy; 2018年 第十一组版权所有</p>
                </div>
            </div>
        </div>
        <!-- END / FOOTER CENTER -->
    </footer>
    <!-- END / FOOTER -->
</div>
<!-- LOAD JQUERY -->
<script type="text/javascript" src="static1/js/lib/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery-ui.min.js"></script>
<script type="text/javascript" src="static1/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="static1/js/lib/bootstrap-select.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="static1/js/lib/owl.carousel.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.appear.min.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.countTo.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.countdown.min.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="static1/js/lib/SmoothScroll.js"></script>
<!-- validate -->
<script type="text/javascript" src="static1/js/lib/jquery.form.min.js"></script>
<script type="text/javascript" src="static1/js/lib/jquery.validate.min.js"></script>
<!-- Custom jQuery -->
<script type="text/javascript" src="static1/js/scripts.js"></script>
</body>
</html>