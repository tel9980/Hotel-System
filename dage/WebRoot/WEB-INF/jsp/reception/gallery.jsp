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
    <title>画廊</title>

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

        <!-- SUB BANNER -->
        <section class="section-sub-banner bg-9">
            <div class="awe-overlay"></div>
            <div class="sub-banner">
                <div class="container">
                    <div class="text text-center">
                        <h2>画廊</h2>
                        <p>最美的风景只为带给最美的你</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- END / SUB BANNER -->
        
        <!-- GALLERY -->
        <section class="section_page-gallery">
            <div class="container">
                <div class="gallery gallery-3">
                    <h1 class="element-invisible">画廊</h1>
                    <!-- FILTER -->
                    <div class="gallery-cat text-center">
                        <ul class="list-inline">
                            <li class="active"><a href="#" data-filter="*">全部</a></li>
                            <li><a href="#" data-filter=".ground">房间</a></li>
                            <li><a href="#" data-filter=".suite">风景 </a></li>
                            <li><a href="#" data-filter=".bathroom">温泉</a></li>
                            <li><a href="#" data-filter=".dining">建筑</a></li>
                        </ul>
                    </div>
                    <!-- END / FILTER -->

                    <!-- GALLERY CONTENT -->
                    <div class="gallery-content">
                        <div class="row">
                            <div class="gallery-isotope col-4">

                                <!-- ITEM SIZE -->
                                <div class="item-size"></div>
                                <!-- END / ITEM SIZE -->

                                <!-- ITEM -->
                                <div class="item-isotope larger suite bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-1.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->  

                                <!-- ITEM -->
                                <div class="item-isotope ground bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-2.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->  
                                
                                <!-- ITEM -->
                                <div class="item-isotope ground suite dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-3.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM --> 
                                
                                <!-- ITEM -->
                                <div class="item-isotope ground suite bathroom">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-4.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope suite bathroom dining">
                                    <div class="gallery_item">
                                        <a href="https://www.youtube.com/watch?v=RnjZ6IhkR40" class="mfp-iframe">
                                            <img src="../../dage/static1/images/gallery/page-3/img-5.jpg" alt="">
                                        </a>
                                        <span class="icon"><i class="fa lotus-icon-media-play"></i></span>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope ground suite dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-6.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope ground suite bathroom">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-7.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope larger ground bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-8.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope suite bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-9.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope ground bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-10.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->
                                <!-- ITEM -->
                                <div class="item-isotope larger suite bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-11.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->  

                                <!-- ITEM -->
                                <div class="item-isotope ground bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-12.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->  
                                
                                <!-- ITEM -->
                                <div class="item-isotope ground suite dining">
                                    <div class="gallery_item">
                                        <a href="https://www.youtube.com/watch?v=RnjZ6IhkR40" class="mfp-iframe">
                                            <img src="../../dage/static1/images/gallery/page-3/img-13.jpg" alt="">
                                        </a>
                                        <span class="icon"><i class="fa lotus-icon-media-play"></i></span>
                                    </div>
                                </div>
                                <!-- END / ITEM --> 
                                
                                <!-- ITEM -->
                                <div class="item-isotope ground suite bathroom">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-14.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->

                                <!-- ITEM -->
                                <div class="item-isotope suite bathroom dining">
                                    <div class="gallery_item">
                                        <a href="images/gallery/popup/img-1.jpg" class="mfp-image">
                                            <img src="../../dage/static1/images/gallery/page-3/img-15.jpg" alt="">
                                        </a>
                                        <h6 class="text">最美的风景只为带给最美的你</h6>
                                    </div>
                                </div>
                                <!-- END / ITEM -->
                            </div>
                        </div>

                    </div>
                    <!-- GALLERY CONTENT -->

                </div>
            </div>       
        </section>
        <!-- END / GALLERY -->

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
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
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
                                        <a href="#"><img src="../../dage/static1/images/logo-footer.png" alt=""></a>
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
                                    <li><a >住宿</a></li>
                                    <li><a >留言簿</a></li>
                                    <li><a >画廊</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-4 col-lg-2">
                             <div class="widget">
                                 <h4 class="widget-title f20 bold">快速连接</h4>
                                <ul>
                                    <li><a href="index.jsp">首页</a></li>
                                    <li><a href="room.do">房间</a></li>
                                    <li><a >联系我们</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-xs-4 col-lg-3">
                            <div class="widget widget_tripadvisor">
                                <h4 class="widget-title">达阁国际酒店</h4>
                                <div class="tripadvisor">
                                    <p>给你家一般的温暖</p>
                                    <img src="../../dage/static1/images/tripadvisor.png" alt="">
                                    <span class="tripadvisor-circle">
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i></i>
                                        <i class="part"></i>
                                    </span>
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
</body>
</html>