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
    <title>真.空秀-无节操问答</title>
    <link rel="stylesheet" href="../styles/release/ask.css" />
</head>
<body>
<div class="doc">
    <div class="doc-bd">
        <!-- 无节操问答 -->
        <div class="m-title">
            <h2>无节操问答</h2>
        </div>
        <div class="m-question">
            <p class="title" id="content"></p>
            <div class="imgbox" id="j-img"><img src="" alt=""/></div>
        </div>
        <!-- /无节操问答 -->
        <!-- 评论 -->
        <div class="m-discuss">
            <div class="title">评论</div>
            <div class="push">
                <textarea name="" id="j-text" placeholder="发表评论"></textarea>
            </div>
            <div class="btn-box">
                <button id="j-discuss" class="btn-discuss">发表评论</button>
            </div>
            <div class="list">
                <ul id="j-dis-list">
                </ul>
            </div>
        </div>
        <!-- /评论 -->
        <jsp:include page="searchCommon.jsp"/>
    </div>
    <jsp:include page="foot.jsp"/>
</div>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script src="/simi/scripts/utils.js" charset="utf-8"></script>
<script src="/simi/scripts/askInfo.js" charset="utf-8"></script>
</body>
</html>
