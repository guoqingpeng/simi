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
    <title>真.空秀-非乘务组</title>
    <link rel="stylesheet" href="../styles/release/list.css" />
</head>
<body>
<div class="doc crewList">
    <div class="doc-bd">
        <!-- 列表 -->
        <div class="m-title">
            <h2>非乘务组</h2>
        </div>
        <div class="m-ranking">
            <ul class="g-clear">
                <li>
                    <div class="item">
                        <a href="personal.html">
                            <span class="onePiece ">WANTED</span>
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>02</span>
                            <img src="../img/img4.jpg" alt=""/>
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>02</span>
                            <img src="../img/img4.jpg" alt=""/>
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>02</span>
                            <img src="../img/img4.jpg" alt=""/>
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
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
                            <span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>02</span>
                            <img src="../img/img4.jpg" alt=""/>
                            <div class="info">
                                <p>姓名：fuck</p>
                                <p>身价：$1122</p>
                                <p>职业：空姐</p>
                            </div>
                            <!-- 云彩 -->
                            <span class="cloud"></span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <!-- /列表 -->
        <jsp:include page="searchCommon.jsp"/>
    </div>
    <jsp:include page="root.jsp"/>
</div>
</body>
</html>
