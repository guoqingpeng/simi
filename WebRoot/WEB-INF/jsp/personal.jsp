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
    <title>个人主页</title>
    <link rel="stylesheet" href="../styles/release/personal.css" />
</head>
<body>
<div class="doc">
    <!-- 头部 -->
    <header class="doc-hd">
        <section class="m-head">
            <h1>真.空秀</h1>
        </section>
    </header>
    <!-- /头部 -->
    <div class="doc-bd">
        <!-- 头像 -->
        <div class="m-portrait">
            <div class="portrait">
                <img src="../img/img5.jpg" alt="苍井空"/>
                <!-- 点赞 -->
                <div class="fingerprint">
                    <div class="info" id="j-scan">
                        <div class="" id="j-line" style="display: block;"></div>
                        <!-- 扫描成功 -->
                        <div class="text">扫描成功</div>
                    </div>
                </div>
            </div>
            <!-- 个人说明 -->
            <div class="explain">
                <div class="bgbox">
                    <div class="rows">
                        <span class="title">拉票宣言: </span>
                        <div class="info w2">
                            该剧以刘集支部保存的我国现存最早中文译
                        </div>
                    </div>
                    <div class="rows">
                        <span class="title">身价: </span>
                        <div class="info w1">
                            <i>$</i>6666888
                        </div>
                        <span class="title">年龄: </span>
                        <div class="info w1">
                            23 岁
                        </div>
                    </div>
                    <div class="rows">
                        <span class="title">星座: </span>
                        <div class="info w1">
                            白羊座
                        </div>
                    </div>
                    <div class="rows">
                        <span class="title">喜好: </span>
                        <div class="info w2">
                            唱歌、听音乐、上网、看书、打球、打人
                        </div>
                    </div>
                </div>
            </div>
            <!-- /个人说明 -->
        </div>
        <!-- /头像 -->
        <!-- 照片展示 -->
        <div class="m-title">
            <h2>照片展示</h2>
        </div>
        <div class="m-portraitPic">
            <div class="info">
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
            </div>
        </div>
        <!-- /照片展示 -->
        <!-- 方言大挑战 -->
        <div class="m-title">
            <h2>方言大挑战</h2>
        </div>
        <div class="m-dialect">
            <div class="info">
                <span class="title">方言大挑战</span>
                <div class="title-info">
                    <time>18"</time>
                </div>
            </div>
            <div class="info">
                <div class="btn-box">
                    <a href="crewList.html" class="g-btn g-btn-s g-btn-commit"><span>乘务组</span></a>
                    <a href="notCrewList.html" class="g-btn g-btn-s g-btn-commit"><span>非乘务组</span></a>
                </div>
            </div>
        </div>
        <!-- /方言大挑战 -->
        <!-- 评论 -->
        <div class="m-discuss">
            <div class="title">评论</div>
            <div class="push">
                <textarea name="" placeholder="发表评论"></textarea>
            </div>
            <div class="btn-box">
                <button class="btn-discuss">发表评论</button>
            </div>
            <div class="list">
                <ul>
                    <li>
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
                    </li>
                </ul>
            </div>
        </div>
        <!-- /评论 -->
        <div class="m-search">
            <i class="g-ico g-ico-s g-ico-search"></i>
            <span class="sch-ipt"><input type="text" value="" placeholder="搜索昵称或手机号"/></span>
        </div>
    </div>
    <footer class="m-foot">
        <ul>
            <li><a href="index.html" title="首页">首页</a></li>
            <li><a href="actRule.html" title="活动规则">活动规则</a></li>
            <li><a href="onlineAct.html" title="线上活动">线上活动</a></li>
            <li><a href="register.html" title="首页">我要报名</a></li>
        </ul>
    </footer>
</div>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script src="/simi/scripts/application.js" charset="utf-8"></script>
</body>
</html>