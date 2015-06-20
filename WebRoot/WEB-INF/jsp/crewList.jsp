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
    <title>乘务组列表</title>
    <link rel="stylesheet" href="../styles/release/list.css" />
</head>
<body>
<div class="doc crewList">
    <!-- 头部 -->
    <header class="doc-hd">
        <section class="m-head">
            <h1>真.空秀</h1>
        </section>
    </header>
    <!-- /头部 -->
    <div class="doc-bd">
        <!-- 列表 -->
        <div class="m-title">
            <h2>乘务组</h2>
        </div>
        <div class="m-ranking">
            <ul class="g-clear" id="j-per-list">
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                                <p>公司：东方航空公司</p>
                                <p>职业：空姐</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                                <p>公司：东方航空公司</p>
                                <p>职业：空姐</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                                <p>公司：东方航空公司</p>
                                <p>职业：空姐</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>
                            <!-- 照片 -->
                            <img src="../img/img4.jpg" alt=""/>
                            <!-- 详情 -->
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                                <p>公司：东方航空公司</p>
                                <p>职业：空姐</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>
                    </div>
                </li>
            </ul>
            <div class="aaaa" id="j-load-more">
                点击加载更多
            </div>
        </div>
        <!-- /列表 -->
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
<script src="/simi/scripts/utils.js" charset="utf-8"></script>
<script src="/simi/scripts/perList.js" charset="utf-8"></script>
</body>
</html>
