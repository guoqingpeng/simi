// 个人首页
// $(function(){
//     var timer = 0;
//     $('#j-scan').on('touchstart', function(eve){
//         eve.preventDefault();

//         var target = eve.target,
//             time = 0;

//         timer = setInterval(function(){
//             console.log('timer' + time);
//             //target.innerHTML = '录音时间: ' + time++ + '\'';
//             if(++time === 3){
//                 console.info('点赞...');
//                 zan();
//             }
//         }, 1000);

//         startAni();
//     }).on('touchend', function(eve){
//         clearInterval(timer);
//         timer = null;
//         stopAni();
//     });

//     function zan(){
//         stopAni();
//         var xhr = $.ajax({
//             url: '/zan',
//             data: {
//                 userID: userID
//             },
//             success: function(json){
//                 alert('ok')
//             },
//             error: function(){
//                 alert('error')
//             }
//         })
//     }

//     function startAni(){
//         $('#j-line').addClass('line');
//     }

//     function stopAni(){
//         $('#j-line').removeClass('line');
//     }
// });

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
        wx.chooseImage({
            success: function(res){
                var localIds = res.localIds;
                var localId = images.localId;
                
                localId = localId.concat(localIds);
                localId = localId.slice(0, 4);

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
        imgIDS.splice(index, 1);
        alert(imgIDS)
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
                    //$('#j-r-time').text(((+new Date() - startRecordTime) / 1000).toFixed(1) + '"')
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
        userID: 'dddd'
    }
    
    $('#j-save').click(function(eve){
        eve.preventDefault();

        // 保存录音
        if(voice.localId !== '') {
            //alert('请先使用 startRecord 接口录制一段声音');
            wx.uploadVoice({
                localId: voice.localId,
                success: function(res){
                    alert('上传语音成功，serverId 为' + res.serverId);
                    voice.serverId = res.serverId;

                    var url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=' + config.access_token + '&media_id=' + res.serverId;
                    
                    params.recordID = voice.serverId;
                    params.url = url;
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
                    alert('图片成功，图片成功');
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
        alert('保存上传：'+ urls);

        params.images = getUrls(images.serverId);
        params.voiceId = voice.serverId;
        params.voiceURL = getURL(voice.serverId);
        alert('images::::' + params.images);
        $.ajax({
            url: '/record',
            //data: JSON.stringify(params, null, 4),
            //contentType:'application/json;charset=UTF-8',
            data: params,
            success: function(json){
                alert('ok')
            },
            error: function(){
                alert('error')
            }
        })
    }

    function getUrls(serverId){
        return serverId.map(function(ele, idx){
            return 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=' + config.access_token + '&media_id=' + ele;
        })
    }

    function getURL(id){
        return 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=' + config.access_token + '&media_id=' + id;
    }
})
