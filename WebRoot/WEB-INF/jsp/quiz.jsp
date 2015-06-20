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
    <title>真.空秀-一战到底</title>
    <link rel="stylesheet" href="../styles/release/decisiveBattle.css" />
</head>
<body>
<div class="doc">
    <div class="doc-bd">
        <!-- 无节操问答 -->
        <div class="m-title">
            <h2>一战到底</h2>
        </div>
        <div class="m-decisive">
            <div class="m-decisive-hd">
                <span class=""><a href="?">乘 务</a></span>
                <span class="active"><a href="javascript:;">非 乘 务</a></span>
            </div>
            <form action="">
            <div class="m-decisive-bd">
                <ul id="j-quiz">
                    <li>
                        <h4>1：特殊餐食中印度餐的代码为（  ）</h4>
                        <ul class="next">
                            <li class="active"><label ><input type="radio" name="a" checked/>A. RVML</label></li>
                            <li><label ><input type="radio" name="a"/>B. IDML</label></li>
                            <li><label ><input type="radio" name="a"/>C. HNML</label></li>
                            <li><label ><input type="radio" name="a"/>D. MSML</label></li>
                        </ul>
                    </li>
                    <li>
                        <h4>2：特殊餐食中印度餐的代码为（  ）</h4>
                        <ul class="next">
                            <li><label ><input type="checkbox" name="b"/>A. RVML</label></li>
                            <li><label ><input type="checkbox" name="b"/>B. IDML</label></li>
                            <li><label ><input type="checkbox" name="b"/>C. HNML</label></li>
                            <li><label ><input type="checkbox" name="b"/>D. MSML</label></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="m-decisive-ft">
                  <button class="g-btn g-btn-s g-btn-commit"><span>提 交</span></button>
            </div>
            </form>
        </div>
        <!-- /无节操问答 -->
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
<!-- 提交引导 -->
<div class="mark" style="display:none"></div>
<div class="dialog angled-135"  style="display:none">
    <i class="close"></i>
    <div class="guide">
        分享您的得分将累计到自己身价中！
    </div>
    <p class="title">本次得分</p>
    <p class="num">99分</p>
    <p class="title">太棒了!</p>
    <button class="btn">确定</button>
</div>
<!-- /提交引导 -->
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<%-- <script type="text/javascript" src="/simi/scripts/lib/quiz.js"></script> --%>
<script type="text/javascript" src="/simi/scripts/timu.js"></script>
<script type="text/javascript" src="/simi/scripts/quiz.js"></script>
</body>
</html>
