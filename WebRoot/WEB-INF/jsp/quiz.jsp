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
                <ul id="j-quiz"></ul>
            </div>
            <div class="m-decisive-ft">
                  <button id="j-enter" class="g-btn g-btn-s g-btn-commit"><span>提 交</span></button>
            </div>
            </form>
        </div>
        <!-- /无节操问答 -->
    </div>
    <jsp:include page="foot.jsp"/>
</div>
<!-- 提交引导 -->
<div class="mark" id="j-mask" style="display:none"></div>
<div class="dialog angled-135" id="j-dialog"  style="display:none">
    <%-- <i class="close"></i> --%>
    <div class="guide">
        分享您的得分将累计到自己身价中！
    </div>
    <p class="title">本次得分</p>
    <p class="num" id="j-score">0分</p>
    <p class="title" id="j-comment">太棒了!</p>
    <button class="btn" id="j-share">确定</button>
</div>
<!-- /提交引导 -->
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<%-- <script type="text/javascript" src="/simi/scripts/lib/quiz.js"></script> --%>
<script type="text/javascript" src="/simi/scripts/utils.js"></script>
<script type="text/javascript" src="/simi/scripts/timu.js"></script>
<script type="text/javascript" src="/simi/scripts/timu_1.js"></script>
<script type="text/javascript" src="/simi/scripts/quiz.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
  wx.config({
     debug: false,
     appId: '${config.appid}',
     timestamp: ${config.timestamp},
     nonceStr: '${config.nonceStr}',
     signature: '${config.signature}',
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
</body>
</html>
