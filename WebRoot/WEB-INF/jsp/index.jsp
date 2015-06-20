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
        <div id="slideBox" class="m-pic">
            <div class="picbox">
                <ul>
                    <li><a href="ask.html"><img src="../img/img1.jpg" alt=""/></a></li>
                    <li><a href="###"><img src="../img/img5.jpg" alt=""/></a></li>
                    <li><a href="###"><img src="../img/img6.jpg" alt=""/></a></li>
                </ul>
            </div>
            <div class="state">
                <ul></ul>
            </div>
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
                    <a href="###" class="cw-item" data-type="0">乘务组</a>
                    <a href="###" class="cw-item" data-type="1">非乘务组</a>
                </span>
            </div>
            <h2>参赛选手 TOP20</h2>
        </div>
        <div class="m-ranking">
            <ul class="g-clear" id="j-per-list">
            </ul>
        </div>
        <!-- /top20 -->
        <div class="m-search">
            <i class="g-ico g-ico-s g-ico-search"></i>
            <span class="sch-ipt"><input type="text" value="" placeholder="搜索昵称或手机号"/></span>
        </div>
    </div>
    <footer class="m-foot">
        <ul class="first">
            <li><a href="javascript:;" title="首页">首页</a></li>
            <li><a href="actRule.html" title="活动规则">活动规则</a></li>
            <li>
                <a href="javascript:;" title="线上活动">线上活动</a>
                <ul class="next">
                    <li><a href="decisiveBattle.html">一战到底</a></li>
                    <li><a href="ask.html">无节操问答</a></li>
                </ul>
            </li>
            <li><a href="register.html" title="首页">我要报名</a></li>
        </ul>
    </footer>
</div>
    <script src="/simi/scripts/jquery-1.9.1.min.js"></script>
    <script src="/simi/scripts/utils.js" charset="utf-8"></script>
    <script src="/simi/scripts/index.js" charset="utf-8"></script>
    <script type="text/javascript" src="/simi/scripts/slider/TouchSlide.1.1.js"></script>
</body>
</html>
