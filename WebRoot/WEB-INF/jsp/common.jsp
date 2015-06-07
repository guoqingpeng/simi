<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Hello, SiMiXiu</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/simi/styles/lib/swiper.min.css" media="screen" title="no title" charset="utf-8">
    <style media="screen">
    .swiper-container {
        width: 100%;
        height: 300px;
    }
    </style>
  </head>
  <body>
      <script src="/simi/scripts/lib/jquery-1.9.1.min.js"></script>
      <script src="/simi/scripts/lib/swiper.jquery.min.js"></script>
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


    <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide" style="background-image:url(http://lorempixel.com/1000/1000/nightlife/1)"></div>
            <div class="swiper-slide" style="background-image:url(http://lorempixel.com/1000/1000/nightlife/2)"></div>
            <div class="swiper-slide" style="background-image:url(http://lorempixel.com/1000/1000/nightlife/3)"></div>
            <div class="swiper-slide" style="background-image:url(http://lorempixel.com/1000/1000/nightlife/4)"></div>
            <div class="swiper-slide" style="background-image:url(http://lorempixel.com/1000/1000/nightlife/5)"></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination swiper-pagination-white"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next swiper-button-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>
    </div>


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
    <a href="javascript:;" id="save" class="btn">[上传图片]</a>

    <div id="log"></div>


    <h2>图片预览</h2>
    <a href="javascript:;" id="previewImage">图片预览</a>
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


    <script>
      var swiper = new Swiper('.swiper-container', {
          pagination: '.swiper-pagination',
          paginationClickable: '.swiper-pagination',
          nextButton: '.swiper-button-next',
          prevButton: '.swiper-button-prev',
          spaceBetween: 30,
          effect: 'fade'
      });
    </script>

    <script>


    wx.ready(function(){
        var localID = '';
        // 在这里调用 API
        document.getElementById('cimg').addEventListener('click', function(eve){
            wx.chooseImage({
                success: function(res){
                    var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                    var imgs = [];
                    for(var i = 0, len = localIds.length; i < len; i++) {
                        alert('localID:   ' + localIds[i])
                        imgs[i] = new Image();
                        imgs[i].src = localIds[i];
                        imgs[i].style.width = '80%';
                        document.getElementById('imgs').appendChild(imgs[i]);
                        //alert('paths:' + localIds);
                    }
                    localID = localIds;
                }
            });
        });

        document.getElementById('save').addEventListener('click', function(eve){
            alert('localID   ' + localID);
            wx.uploadImage({

                localId: localID[0], // 需要上传的图片的本地ID，由chooseImage接口获得
                isShowProgressTips: 1, // 默认为1，显示进度提示
                success: function(res){
                    var serverId = res.serverId; // 返回图片的服务器端ID
                    alert('urls: ' + serverId);
                    var img = new Image();
                    var url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=${config.access_token}&media_id=' + serverId;
                    document.getElementById('log').innerHTML += '<a href="' + url + '">' + url + '</a><br/><br/>';
                    img.src = url;
                    img.style.width = '80%';
                    document.getElementById('imgss').appendChild(img);
                },
                /*success: function(res) {
                 i++;
                 alert('已上传：' + i + '/' + length);
                 images.serverId.push(res.serverId);
                 if (i < length) {
                 upload();
                 }
                 },*/
                fail: function(res){
                    alert(JSON.stringify(res));
                }
            });
        });


        // 4 音频接口
        var voice = {
            localId: '',
            serverId: ''
        };
        // 4.2 开始录音
        document.querySelector('#startRecord').onclick = function(){
            wx.startRecord({
                cancel: function(){
                    alert('用户拒绝授权录音');
                }
            });
        };

        // 4.3 停止录音
        document.querySelector('#stopRecord').onclick = function(){
            wx.stopRecord({
                success: function(res){
                    voice.localId = res.localId;
                },
                fail: function(res){
                    alert(JSON.stringify(res));
                }
            });
        };


        document.querySelector('#playVoice').onclick = function(){
            if(voice.localId == '') {
                alert('请先使用 startRecord 接口录制一段声音');
                return;
            }
            wx.playVoice({
                localId: voice.localId
            });
        };


        document.querySelector('#playVoiceServer').onclick = function(){
            var id = "S6ktfwoiZmz-hDJ9t86IXANxz3E3M9X4jMU8wGq95SBc2kA-iAnQg5GBVf08bzjH";
            wx.downloadVoice({
                serverId: id,
                success: function(res){
                    alert('下载语音成功，即将播放, localId 为' + res.localId);
                    voice.localId = res.localId;
                    wx.playVoice({
                        localId: voice.localId
                    });
                }
            });
        };

        document.querySelector('#playVoiceServerNew').onclick = function(){
            var id = "igEFki8roMbGamDf0CCGGfxnjuwNFvbyjMXdGTkE7gpVLcYiivJRA_tATwIg8GjJ";
            wx.downloadVoice({
                serverId: id,
                success: function(res){
                    alert('下载新串的语音成功，即将播放, localId 为' + res.localId);
                    voice.localId = res.localId;
                    wx.playVoice({
                        localId: voice.localId
                    });
                }
            });

        };


        // 4.8 上传语音
        document.querySelector('#uploadVoice').onclick = function(){
            if(voice.localId == '') {
                alert('请先使用 startRecord 接口录制一段声音');
                return;
            }
            wx.uploadVoice({
                localId: voice.localId,
                success: function(res){
                    alert('上传语音成功，serverId 为' + res.serverId);
                    voice.serverId = res.serverId;

                    var url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=${config.access_token}&media_id=' + res.serverId;
                    document.getElementById('log').innerHTML += '<a href="' + url + '">' + url + '</a><br/><br/>';

                    var audio = document.createElement('audio');
                    audio.src = url;
                    document.getElementById('log').appendChild(audio);
                }
            });
        };

        // 4.9 下载语音
//    document.querySelector('#downloadVoice').onclick = function() {
//        if (voice.serverId == '') {
//            alert('请先使用 uploadVoice 上传声音');
//            return;
//        }
//        wx.downloadVoice({
//            serverId: voice.serverId,
//            success: function(res) {
//                alert('下载语音成功，localId 为' + res.localId);
//                voice.localId = res.localId;
//            }
//        });
//    };
        // 5.2 图片预览
        document.querySelector('#previewImage').onclick = function(){
            wx.previewImage({
                //current: 'http://img5.douban.com/view/photo/photo/public/p1353993776.jpg',
                urls: [
                    'http://img3.douban.com/view/photo/photo/public/p2152117150.jpg',
                    'http://img5.douban.com/view/photo/photo/public/p1353993776.jpg',
                    'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg',
                    'http://imgsrc.baidu.com/baike/pic/item/a50f4bfbfbedab64d9546f70f436afc379311e5f.jpg',
                    'http://img5.duitang.com/uploads/blog/201403/29/20140329185610_VdGun.jpeg',
                    'http://pic.4j4j.cn/upload/pic/20150112/608dd6829d.jpg',
                    'http://www.k73.com/up/article/2014/0317/164814_35877760.jpg'
                ]
            });
        };


    });
    </script>

  </body>
</html>
