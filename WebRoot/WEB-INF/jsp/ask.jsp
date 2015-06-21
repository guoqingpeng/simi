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
            <ul id="j-ask-list">
                <li><a href="askInfo.jsp?id=1">1.假如你变成了女人或者男人你会做得第一件事是（⊙o⊙）啥？</a></li>
                <li><a href="askInfo.jsp?id=2">2.好色能改吗？</a></li>
                <li><a href="askInfo.jsp?id=3">3.你小时候曾经想象过的出风头的场景是什么样的？</a></li>
                <li><a href="askInfo.html">4.请说出一句证明你纯洁的话。</a></li>
                <li><a href="askInfo.html">5.有人撒你一身油，对你说：别担心，有奥妙全自动，你咋办？</a></li>
                <li><a href="askInfo.html">6.你的仇人在上厕所时，没纸出不来，你怎么办？</a></li>
                <li><a href="askInfo.html">7.半夜遇见劫匪，他说不唱歌不让你走，你会唱什么？</a></li>
                <li><a href="askInfo.html">8.你身上哪些部位被人赞美过？</a></li>
                <li><a href="askInfo.html">9.有生以来你受过最重的伤是什么？时间地点？</a></li>
                <li><a href="askInfo.html">10.平时会注意周围的帅哥美女（路人）吗？观察顺序是什么？</a></li>
            </ul>
        </div>
        <!-- /无节操问答 -->
    </div>
    <jsp:include page="foot.jsp"/>
</div>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script src="/simi/scripts/utils.js" charset="utf-8"></script>
<script>
    utils.initNav();
</script>
<%-- <script src="/simi/scripts/ask.js" charset="utf-8"></script> --%>
</body>
</html>
