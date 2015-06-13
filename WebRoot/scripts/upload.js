$(function(){
    // 上传图片
    var images = {
        serverId: [],
        localId:[]
    };
    var voice = {
        localId: ''
    };
    $('.m-portraitPic').empty();
    $('#j-add').on('click', function(eve){
        eve.preventDefault();
        if(images.localId.length >= 8){
            alert('最多只能选择8张图片');
            return
        }
        wx.chooseImage({
            success: function(res){
                var localIds = res.localIds;
                var localId = images.localId;
                alert('lcaID::::::' + localId)
                localId = localId.concat(localIds);

                localId = localId.slice(0, 8);
                alert(res.localIds.length + '/' + localId.length)
                $('.m-portraitPic').empty();
                for(var i = 0, len = localId.length; i < len; i++) {
                    $('.m-portraitPic').append('<span class="imgbox" data-index="' + i + '"><i class="close"></i><img src="' 
                        + localId[i] + '" alt=""/></span>');
                }

                images.localId = localId
            }
        });
    });

    $('.m-portraitPic').on('click', '.close', function(eve){
        eve.preventDefault();
        var $parent = $(this).parent();
        var index = $parent.data('index');
        $parent.remove();
        images.localId.splice(index, 1);
    });

    // 录音
    var voiceTimer = 0;
    var isRecording = false;
    var startRecordTime = 0;
    var recordTime = 0;

    $('.recordStar').on('touchstart', function(eve){
        eve.preventDefault();
        var $btn = $(this);
        if(!isRecording){
            wx.startRecord({
                success: function(){
                    voiceTimer = setInterval(function(){
                        $('#j-r-time').text(recordTime++ + '"');
                    }, 1000)
                    // startRecordTime = +new Date();
                },
                cancel: function(){
                    alert('用户拒绝授权录音');
                }
            });

            $btn.addClass('recording').find('p').show();
        }else{
            wx.stopRecord({
                success: function(res){
                    voice.localId = res.localId;
                    clearInterval(voiceTimer);
                    $btn.removeClass('recording').find('p').hide();
                },
                fail: function(res){
                    alert(JSON.stringify(res));
                }
            });
        }
        isRecording = !isRecording;
    }).on('touchend-', function(eve){
        eve.preventDefault();
        wx.stopRecord({
            success: function(res){
                voice.localId = res.localId;
                clearInterval(voiceTimer);
                voiceTimer = 0;
            },
            fail: function(res){
                alert(JSON.stringify(res));
            }
        });
    });

    // 保存
    var params = {
        id: utils.getQueryString('userid')
    }
    
    $('#j-save').click(function(eve){
        eve.preventDefault();

        images.serverId = [];

        // 保存录音
        if(voice.localId !== '') {
            //alert('请先使用 startRecord 接口录制一段声音');
            wx.uploadVoice({
                localId: voice.localId,
                success: function(res){
                    //alert('上传语音成功，serverId 为' + res.serverId);
                    voice.serverId = res.serverId;
                    uploadImage(images.localId);
                }
            });
        }else{
            uploadImage(images.localId);
        }
    });

    function uploadImage(all){
        alert('uploadd' + all);
        var a = all.slice(0);
        if(a.length){
            wx.uploadImage({
                localId: all[0],
                success: function (res) {
                    //alert('图片成功，图片成功');
                    images.serverId.push(res.serverId);
                    a.shift();
                    if(a.length){
                        uploadImage(a)
                    }else{
                        save(images.serverId)
                    }
                },
                fail: function (res) {
                    alert(JSON.stringify(res));
                }
            });     
        }
    }

    function save(urls){
        params.images = getUrls(images.serverId);
        params.voice = {
            id: voice.serverId,
            url: getURL(voice.serverId)
        };

        utils.ajaxSendJSON(
            '/simi/user/uploadFile.do',
            params,
            function(json){
                if(json.ret === true){
                    clear();
                    location.href = '/simi/user/personalInit.do?userid=' + json.data.id;
                }
            }
        )
    }

    var URL = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=';
    function getUrls(serverId){
        return serverId.map(function(ele, idx){
            return URL + config.access_token + '&media_id=' + ele;
        })
    }

    function getURL(id){
        return URL + config.access_token + '&media_id=' + id;
    }

    function clear(){
        $('.m-portraitPic').find('.close').remove();
    }
})