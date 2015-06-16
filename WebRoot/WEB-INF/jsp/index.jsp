<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection" />
    <!-- UC默认竖屏 ，UC强制全屏 -->
    <meta name="full-screen" content="yes"/>
    <meta name="browsermode" content="application"/>
    <!-- QQ强制竖屏 QQ强制全屏 -->
    <meta name="x5-orientation" content="portrait"/>
    <meta name="x5-fullscreen" content="true"/>
    <meta name="x5-page-mode" content="app"/>
    <title>真.空秀-首页</title>
    <link rel="stylesheet" href="../styles/release/index.css" />
</head>
<body>
<div class="doc">
    <div class="doc-bd index">
        <!-- 轮播图 -->
        <div class="m-pic">
            <div id="J_slide">
                <div class="imgbox"><a href="#"><img src="../img/img1.jpg" alt=""/></a></div>
                <div class="imgbox"><a href="#"><img src="../img/img9.jpg" alt=""/></a></div>
                <div class="imgbox"><a href="#"><img src="../img/img6.jpg" alt=""/></a></div>
                <div class="imgbox"><a href="#"><img src="../img/img5.jpg" alt=""/></a></div>
            </div>
            <div class="state" id="J_page"></div>
        </div>
        <!-- /轮播图 -->
        <!-- 人气排名 -->
        <div class="m-title">
            <h2>人气之星</h2>
        </div>
        <div class="m-hits">
            <div class="item">
                <a href="personal.html">
                    <p>
                        <i class="g-ico g-ico-crown"></i>
                        <img src="../img/img2.png" alt=""/>
                    </p>
                    <span class="name">用户昵称</span>
                </a>
            </div>
            <div class="item">
                <a href="personal.html">
                    <p>
                        <i class="g-ico g-ico-crown"></i>
                        <img src="../img/img3.jpg" alt=""/>
                    </p>
                    <span class="name">用户昵称</span>
                </a>
            </div>
            <div class="item">
                <a href="personal.html">
                    <p>
                        <i class="g-ico g-ico-crown"></i>
                        <img src="../img/img2.png" alt=""/>
                    </p>
                    <span class="name">用户昵称</span>
                </a>
            </div>
        </div>
        <!-- /人气排名 -->
        <!-- top20 -->
        <div class="m-title">
            <div class="portal">
                <span class="info">
                    <a href="crewList.html" class="active">乘务组</a>
                    <a href="notCrewList.html">非乘务组</a>
                </span>
            </div>
            <h2>参赛选手 TOP20</h2>
        </div>
        <div class="m-ranking">
            <ul class="g-clear">
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <!-- 排行 -->
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <!-- 排行 -->
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>02</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <!-- 排行 -->
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>03</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>>
                    </div>
                </li>
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <!-- 排行 -->
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>04</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <!-- /top20 -->
        <div class="m-search">
            <i class="g-ico g-ico-s g-ico-search"></i>
            <span class="sch-ipt"><input type="text" value="" placeholder="搜索昵称或手机号"/></span>
        </div>
    </div>
    <footer class="m-foot">
        <ul>
            <li><a href="javascript:;" title="首页">首页</a></li>
            <li><a href="actRule.html" title="活动规则">活动规则</a></li>
            <li><a href="onlineAct.html" title="线上活动">线上活动</a></li>
            <li><a href="register.html" title="首页">我要报名</a></li>
        </ul>
    </footer>
</div>
    <script type="text/javascript" src="../scripts/slider/scroll.js"></script>
    <script type="text/javascript">
    if(document.getElementById("J_slide")){
    var J_slide = new ScrollPic();
    var num = document.body.clientWidth;

    J_slide.scrollContId   = "J_slide"; //内容容器ID
    J_slide.dotListId      = "J_page";//点列表ID
    J_slide.dotOnClassName = "selected";
    J_slide.frameWidth     = 320;
    J_slide.pageWidth      = 320;
    J_slide.upright        = false;
    J_slide.speed          = 10;
    J_slide.space          = 30;
    J_slide.initialize(); //初始化
    }
    </script>
</body>
</html>