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
    <title>搜索结果</title>
    <link rel="stylesheet" href="../styles/release/list.css" />
    <script src="/simi/scripts/jquery-1.9.1.min.js"></script>
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
            <h2>搜索结果</h2>
        </div>
        <div class="m-ranking">
            <ul class="g-clear" id="j-per-list">
            </ul>
            <div class="" id="j-load-more">
                点击加载更多
            </div>
        </div>
        <!-- /列表 -->
        <jsp:include page="searchCommon.jsp"/>
    </div>
    <jsp:include page="foot.jsp"/>
</div>
<script src="/simi/scripts/utils.js" charset="utf-8"></script>
<script src="/simi/scripts/searchList.js" charset="utf-8"></script>
</body>
</html>
