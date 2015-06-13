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
    var imgIDS = [];
    $('.m-portraitPic').empty();
    $('#j-add').on('click', function(eve){
        eve.preventDefault();
        wx.chooseImage({
            success: function(res){
                var localIds = res.localIds;
                
                imgIDS = imgIDS.concat(localIds);
                imgIDS = imgIDS.slice(0, 4);
                $('.m-portraitPic').empty();
                for(var i = 0, len = imgIDS.length; i < len; i++) {
                    $('.m-portraitPic').append('<span class="imgbox" data-index="' + i + '"><i class="close"></i><img src="' 
                        + imgIDS[i] + '" alt=""/></span>');
                }
                alert(imgIDS);
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
    var voice = {
        localId: ''
    };
    var voiceTimer = 0;
    $('.recordStar').on('touchstart', function(eve){
        eve.preventDefault();
        wx.startRecord({
            cancel: function(){
                alert('用户拒绝授权录音');
            }
        });
        voiceTimer = setInterval(function(){
            $('#j-r-time').text(time++ + '"');
            //target.innerHTML = '录音时间: ' + time++ + '\'';
        }, 1000);

        $(this).addClass('recording');
    }).on('touchend', function(eve){
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
            alert('请先使用 startRecord 接口录制一段声音');
            wx.uploadVoice({
                localId: voice.localId,
                success: function(res){
                    alert('上传语音成功，serverId 为' + res.serverId);
                    voice.serverId = res.serverId;

                    var url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=' + config.access_token + '&media_id=' + res.serverId;
                    document.getElementById('log').innerHTML += '<a href="' + url + '">' + url + '</a><br/><br/>';
                    params.recordID = voice.serverId;
                    params.url = url;
                    uploadImage();
                }
            });
        }else{
            uploadImage();
        }

        $.ajax({
            url: '/record',
            data: params,
            success: function(json){
                alert('ok')
            },
            error: function(){
                alert('error')
            }
        })
    });

    function uploadImage(){
                
    }
})
