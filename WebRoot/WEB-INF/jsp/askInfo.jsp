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
            <div class="imgbox"><img src="../img/img9.jpg" alt=""/></div>
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
                    <!-- <li>
                        <span class="portrait"></span>
                        <div class="info">
                            <div class="userName">
                                <i class="storey">3楼</i>
                                <h2>用户昵称用户昵称</h2>
                            </div>
                            <p>信息评价作为信息素养内容的重要组成部分,</p>
                        </div>
                    </li>
                    <li>
                        <span class="portrait"></span>
                        <div class="info">
                            <div class="userName">
                                <i class="storey">2楼</i>
                                <h2>用户昵称用户昵称</h2>
                            </div>
                            <p>信息评价作为信息素养内容的重要组成部分,</p>
                        </div>
                    </li>
                    <li>
                        <span class="portrait"></span>
                        <div class="info">
                            <div class="userName">
                                <i class="storey">1楼</i>
                                <h2>用户昵称用户昵称</h2>
                            </div>
                            <p>信息评价作为信息素养内容的重要组成部分,</p>
                        </div>
                    </li> -->
                </ul>
            </div>
        </div>
        <!-- /评论 -->
        <div class="m-search">
            <i class="g-ico g-ico-s g-ico-search"></i>
            <span class="sch-ipt"><input type="search" value="" placeholder="搜索昵称或手机号"/></span>
        </div>
    </div>
    <footer class="m-foot">
        <ul class="first">
            <li><a href="index.html" title="首页">首页</a></li>
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
<script src="/simi/scripts/askInfo.js" charset="utf-8"></script>
</body>
</html>
