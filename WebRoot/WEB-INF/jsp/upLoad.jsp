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
    <title>真.空秀-照片上传</title>
    <link rel="stylesheet" href="../styles/release/upload.css" />
</head>
<body>
<div class="doc">
    <div class="doc-bd">
        <form action="">
        <!-- 上传图片 -->
        <div class="m-upload">
            <span class="up-btn"><button id="j-add"><i>+</i>图片上传</button></span>
        </div>
        <div class="m-portraitPic">
            <div class="info">
            </div>
        </div>
        <!-- /上传图片 -->
        <!-- 方言大挑战 -->
        <div class="m-title">
            <h2>方言大挑战</h2>
        </div>
        <div class="m-dialect">
            <div class="record">
                <p class="text" id="j-voice-text"></p>
                <p class="tips">(请按方言朗读以上文字)</p>
                <div class="title-info">
                    <time id="j-r-time">0"</time>
                </div>
            </div>
            <div class="btn-box">
                <div class="">
                    <button class="recordStar">
                        <i class="g-ico g-ico-l g-ico-suona"></i>
                        <p>点击录音...</p>
                    </button>
                </div>
                <div id="j-re-record" class="hide mt10">
                    <button class="g-btns g-btn-s g-btn-warn"><span>重新录音</span></button>
                </div>
                <div id="j-save" class="mt10">
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
            <h3 class="title">一、活动宗旨</h3>
            <div class="info">
                <p>与空乘机组人员互动，秀出你的美，有“脸”你就来！有“脸”就能赢！</p>
            </div>
            <h3 class="title">二、参赛要求</h3>
            <div class="info">
                <p>参赛选手提交的姓名、电话、照片等基本资料必须保证属于本人并真实有效。禁止盗用、冒用他人资料进行
            参赛，一经举报或发现，将取消参赛资格，产生严重不良后果的，将追究其责任。</p>
            </div>
            <h3 class="title">三、活动流程与规则</h3>
            <div class="info">
                <p>1、本次活动海选投票阶段不设评委，由微友以及好友投票决出前100强，工作人员将实时监测投票数据变化，发现恶意刷票，第一次将予以警告并扣除相应票数，第二次发现直接取消参赛资格，并在活动页面予以公告，希望各位男神女神不仅要颜值高，还要心灵美哟！</p>
                <p>2、投票阶段，每个微信用户可在活动页面输入自己关注的男神或者女神的编号，打开男神或者女神的个人SHOW页面，在页面中扫描指纹即可完成投票；每个微信账号每天都有10次投票的机会！ </p>
                <p>3、参赛者票数将以通缉令身价形式表现。参与线上线下活动（如：一战到底、方言大挑战等活动）将提高参赛者的身价。</p>
                <p>4、报名成功以后，每个男神女神都有一个自己的SHOW页面，自己的昵称，美照，参赛宣言都会在个人show页面显示（照片上传超过6小时将无法修改，请大家尽量选择最美的照片上传，第一张上传的照片默认为封面照）</p>
                <p>5、海选后进入复赛阶段，通过海选的参与者在各自分组内进行PK，选出前三十强 。</p>
                <p>6、最后进入终极挑战。在本阶段将所有同性别的组进行合并，进行抽签对决，加入才艺、微拍等娱乐对抗环节，最终决定排名。</p>
            </div>
            <h3 class="title">四、活动沟通</h3>
            <div class="info">
                <p>报名参与活动的朋友们请务必关注私密嗅公众微信平台，我们将通过微信平台随时发布活动相关动态和信息。</p>
                <p>私密嗅公众微信平台微信号：simixiu123或扫描下方二维码：</p>
            </div>
            <!--二维码 -->
            <div class="qrCode"><img src="../bgimg/qrcode.png" alt=""/></div>
        </div>
        <!-- /活动说明 -->
        <jsp:include page="searchCommon.jsp"/>
    </div>
    <jsp:include page="foot.jsp"/>
</div>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
       <script>
         var config = {};
         wx.config(config = {
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
    <script src="/simi/scripts/utils.js" charset="utf-8"></script>
    <script src="/simi/scripts/upload.js" charset="utf-8"></script>
</body>
</html>
