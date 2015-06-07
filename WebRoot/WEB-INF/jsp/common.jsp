<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>
  <body>
       <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
       <script>
         wx.config({
            debug: true,
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
    <br/>
    <br/>
    <a class="btn" href="javascript:;" id="startRecord">开始录音</a><br/>
    <a class="btn" href="javascript:;" id="stopRecord">停止录音</a><br/>
    <a class="btn" href="javascript:;" id="playVoice">播放录音</a><br/>
    <a class="btn" href="javascript:;" id="uploadVoice">上传录音</a><br/>

    <p style="padding: 20px 0">---------------------------</p>

    <a class="btn" href="javascript:;" id="cimg">选择图片</a><br/>

    <h2>预览图片</h2>

    <div id="imgs"></div>
    <h2>服务器端图片</h2>

    <div id="imgss" class="clear"></div>
    <a href="javascript:;" id="save" class="btn">上传图片</a>

    <div id="log"></div>


    <h2>图片预览</h2>
    <a href="javascript:;" id="previewImage">图片预览</a>

    <div style="height: 200px; width: 100%; background: orange">
        <audio controls src="">
            <source src="http://www.w3schools.com/html/horse.ogg" type="audio/ogg"/>
        </audio>
    </div>
    <br/>
    <br/>
    <br/>

    <div>线上的一个</div>
    <div>
        <a href="http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=DWP-DlQiYgPH0yX07O0EQuc7gKfLPlvgIa4rRLTMMKlQdelWYNJOb15A_AoyVjbcQA_RqtztGmzPjLPPQskPGNEmge3Arc5BbdIpA7C1s-I&media_id=S6ktfwoiZmz-hDJ9t86IXANxz3E3M9X4jMU8wGq95SBc2kA-iAnQg5GBVf08bzjH"></a>
    </div>
    <div>id = S6ktfwoiZmz-hDJ9t86IXANxz3E3M9X4jMU8wGq95SBc2kA-iAnQg5GBVf08bzjH</div>
    <div>
        <a href="javascript:;" id="playVoiceServer">播放上吗这一个
        </a>
    </div>
    <div>重新串上去的id： igEFki8roMbGamDf0CCGGfxnjuwNFvbyjMXdGTkE7gpVLcYiivJRA_tATwIg8GjJ</div>
    <div>
        <a href="javascript:;" id="playVoiceServerNew">播放上吗这一个</a>
    </div>
  </body>
</html>
