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
    <title>照片上传</title>
    <link rel="stylesheet" href="../styles/release/upload.css" />
</head>
<body>
<include action='http://localhost:8080/simi/config/getConfig.do'/>
<div class="doc">
    <!-- 头部 -->
    <header class="doc-hd">
        <section class="m-head">
            <h1>真.空秀</h1>
        </section>
    </header>
    <!-- /头部 -->
    <div class="doc-bd">
        <form action="">
        <!-- 上传图片 -->
        <div class="m-upload">
            <span class="up-btn"><button><i>+</i>图片上传</button></span>
        </div>
        <div class="m-portraitPic">
            <div class="info">
                <span class="imgbox"><i class="close"></i><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img5.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
                <span class="imgbox"><img src="../img/img6.jpg" alt="苍井空"/></span>
            </div>
        </div>
        <!-- /上传图片 -->
        <!-- 方言大挑战 -->
        <div class="m-title">
            <h2>方言大挑战</h2>
        </div>
        <div class="m-dialect">
            <div class="record">
                <p class="text">
                    苍穹之剑武圣职业以下哪个技能会对目标
                    造成土伤害？苍穹之剑真气获得方法有几
                    种？
                </p>
                <p class="tips">(请按方言朗读以上文字)</p>
                <div class="title-info">
                    <time id="j-r-time">18"</time>
                </div>
            </div>
            <div class="btn-box">
                <div class="">
                    <button class="recordStar">
                        <i class="g-ico g-ico-l g-ico-suona"></i>
                        <p>正在录音...</p>
                    </button>
                </div>
                <div class="hide">
                    <button class="g-btns g-btn-s g-btn-warn"><span>重新录音</span></button>
                    <button class="g-btns g-btn-s g-btn-warn"><span>确定上传</span></button>
                </div>
            </div>
        </div>
        <!-- /方言大挑战 -->
        </form>
        <!-- 活动说明 -->
        <div class="m-title">
            <h2>活动说明</h2>
        </div>
        <div class="m-actRule">
            <div class="info pl0">
                <p>苍穹之剑武圣职业以下哪个技能会对目标
                造成土伤害？苍穹之剑真气获得方法有几
                种？苍穹之剑武圣职业以下哪个技能会对
                目标造成土伤害？苍穹之剑真气获得方法
                有几种？苍穹之剑武圣职业以下哪个技能
                会对目标造成土伤害？苍穹之剑真气获得
                方法有几种？</p>
            </div>
            <!--二维码 -->
            <div class="qrCode"><img src="../bgimg/qrcode.png" alt=""/></div>
        </div>
        <!-- /活动说明 -->
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
<script src="/simi/scripts/jquery.js"></script>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
       <script>
         wx.config({
            debug: true,
            appId: '${config.appid}',
            timestamp: ${config.timestamp},
            nonceStr: '${config.nonceStr}',
            signature: '${cosnfig.signature}',
            access_token: '${config.access_token}',
            url: '${config.url}',
            jsapi_ticket: '${config.jsapi_ticket}',
            jsApiList : [
                // 所有要调用的 API 都要加到这个列表中
                'checkJsApi',
                'onMenuShareTimeline',
                'onMenuShareAppMessage',
                'onMenuShareQQ',
                'onMenuShareWeibo',
                'hideMenuItems',
                'showMenuItems',
                'hideAllNonBaseMenuItem',
                'showAllNonBaseMenuItem',
                'translateVoice',
                'startRecord',
                'stopRecord',
                'onRecordEnd',
                'playVoice',
                'pauseVoice',
                'stopVoice',
                'uploadVoice',
                'downloadVoice',
                'chooseImage',
                'previewImage',
                'uploadImage',
                'downloadImage',
                'getNetworkType',
                'openLocation',
                'getLocation',
                'hideOptionMenu',
                'showOptionMenu',
                'closeWindow',
                'scanQRCode',
                'chooseWXPay',
                'openProductSpecificView',
                'addCard',
                'chooseCard',
                'openCard'
            ]
        });
    </script>

<script src="/simi/scripts/application.js" charset="utf-8"></script>

</body>
</html>
