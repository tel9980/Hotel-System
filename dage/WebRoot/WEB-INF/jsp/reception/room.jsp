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
    <title>房间</title>

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
        <script src="dage/static1/http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="dage/static1/http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
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
                <div class="header_left float-left">
                <span><i class="lotus-icon-location"></i> 郑州市 金水区 杨金路 1号</span>
				<span>
					<iframe width="150" scrolling="no" height="15" frameborder="0" allowtransparency="true" 
					src="//i.tianqi.com/index.php?c=code&id=11&color=%23FFFFFF&icon=1&py=jinshuiqu&site=12">
					</iframe>
				</span>
                </div>
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
                            <li><a href="login.do">退出登陆</a></li>
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
                        <h2>我们的房间</h2>
                        <p>多种房间类型，满足追求完美的你</p>
                    </div>
                </div>

            </div>

        </section>
        <!-- END / SUB BANNER -->
        
        <!-- ROOM DETAIL -->
        <section class="section-room-detail bg-white">
            <div class="container">
                
                <!-- DETAIL -->
                <div class="room-detail">
                    <div class="row">
                        <div class="col-lg-9">
                            
                            <!-- LAGER IMGAE -->
                            <div class="room-detail_img">
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-1.jpg" alt="">    
                                    <h6>面积为16~20平方米的房间，内有卫生间和其他附属设备组成。房内设一张单人床。</h6>
                                </div>
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-2.jpg" alt="">    
                                    <h6> 一张双人床，此类型房间单独为一楼层，并配有专用的商务中心。</h6>
                                </div>
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-3.jpg" alt="">    
                                    <h6>八间房组成的套间，设有客厅、书房、会议室、警卫室、餐厅厨房设施，有室内花园。</h6>
                                </div>
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-4.jpg" alt="">    
                                    <h6> 两张单人床或一张双人床，房内可以上网，满足商务客人的需求。</h6>
                                </div>
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-5.jpg" alt="">    
                                    <h6>两间或两间以上的房间（内有卫生间和其他附属设施）组成。</h6>
                                </div>
                                <div class="room_img-item">
                                    <img src="../../dage/static1/images/room/detail/lager/img-6.jpg" alt="">    
                                    <h6>两张单人床或一张双人床，适合住两位客人和夫妻同住，适合旅游团体住用。</h6>
                                </div>
                            </div>
                            <!-- END / LAGER IMGAE -->
                            
                            <!-- THUMBNAIL IMAGE -->
                            <div class="room-detail_thumbs">
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-2.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-3.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-2.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-3.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-2.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-3.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-2.jpg" alt=""></a>
                                <a href="#"><img src="../../dage/static1/images/room/detail/img-3.jpg" alt=""></a>
                            </div>
                            <!-- END / THUMBNAIL IMAGE -->
                        </div>
                        <div class="col-lg-3">
                             <!--FORM BOOK -->
                            <div class="room-detail_book">
                                <div class="room-detail_total">
                                    <img src="../../dage/static1/images/icon-logo.png" alt="" class="icon-logo">
                                    <p class="price">
										你的衣衫破旧<br>
										<br>
										而歌声却温柔<br>
										<br>
										陪我漫无目地四处漂流<br>
										<br>
										我的背脊如荒丘<br>
										<br>
										而你却微笑摆首<br>
										<br>
										把它当成整个宇宙<br>
										<br>
										你与太阳挥手<br>
										<br>
										也同海鸥问候<br>
										<br>
										陪我爱天爱地四处风流<br>
										<br>
										只是遗憾你终究<br>
										<br>
										无法躺在我胸口<br>
										<br>
										欣赏夜空最辽阔的不朽<br>
										<br>
										把星子放入眸<br>
										<br>
                                    </p>
                                </div>
                                <div class="room-detail_form">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END / DETAIL -->
                <!-- TAB -->
                <div class="room-detail_tab">
                    <div class="row">                
                        <div class="col-md-9">
                        </div>
                    </div>
                </div>
                <!-- END / TAB -->
                <!-- COMPARE ACCOMMODATION -->
                <div class="room-detail_compare">
                    <h2 class="room-compare_title">房间选择</h2>
                    <div class="room-compare_content">
                        <div class="row">
				  <c:forEach items="${room}" var="room" varStatus="status">
						<div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="room-compare_item">
                                    <div class="img">
                                     <c:choose>  
										 <c:when test="${sessionScope.user!=null}">   
										 <a href="reservation1.do"><img src="../../dage/static1/images/room/detail/compare/img-${status.index+1}.jpg" alt=""></a>
                                    </div>  
                                    <div class="text">
                                        <h2><a href="reservation1.do">${room.get("roomtype")}每天只需${room.get("roomprice")}元</a></h2>
                                    </div>
										 </c:when>  
										 <c:otherwise> 
										 <a href="loginforword.do"><img src="../../dage/static1/images/room/detail/compare/img-${status.index+1}.jpg" alt=""></a>
                                    </div>  
                                    <div class="text">
                                        <h2><a href="loginforword.do">${room.get("roomtype")}每天只需${room.get("roomprice")}元</a></h2>
                                    </div>
										 </c:otherwise>  
									</c:choose>
                                </div>
                            </div>
				</c:forEach>    
                        </div>
                    </div>
                </div>
                <!-- END / COMPARE ACCOMMODATION -->
            </div>
        </section>
        <!-- END / SHOP DETAIL -->
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
                                    <li><a href="">联系我们</a></li>
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