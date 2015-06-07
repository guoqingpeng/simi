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
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  </head>
   <body>
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
    <br>
  </body>
</html>