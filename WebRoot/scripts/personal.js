$(function(){
    var timer = 0;

    loadData();
    initEvent();
    loadDiscuss();

    utils.initNav();
    utils.initSearch();
    utils.fixbug();

    function initEvent(){
        // 点赞
        $('#j-scan').on('touchstart', function(eve){
            eve.preventDefault();

            var target = eve.target,
                time = 0;

            timer = setInterval(function(){
                if(++time === 2){
                    zan();
                }
            }, 1000);

            startAni();
        }).on('touchend', function(eve){
            clearInterval(timer);
            timer = null;
            stopAni();
        });

        function getURL(url){
            return location.protocol + "//" + location.hostname + url
        }

        // 预览图片
        $('#j-imgs').on('click', 'img', function(eve){
            // eve.preventDefault();
            var imgs = $('#j-imgs').data('images');
            var urls = [];
            $.each(imgs, function(index, element){
                urls.push(getURL(element))
            })
            wx.previewImage({
                current: getURL($(this).attr('src')),
                urls: urls
            });
        });

        // 评论
        $('#j-discuss').on('click', function(eve){
            eve.preventDefault();

            var text = $('#j-text').val();
            if(text){
                utils.ajaxSendJSON(
                    '/simi/user/commnet.do',
                    {
                        beCommentedUser: utils.getQueryString('userid'),
                        content: text,
                        commentUser: localStorage.getItem('userid') || ""
                    },
                    function(json){
                        $('#j-text').val('');
                        alert('评论成功!');
                        loadDiscuss();
                    },
                    function(msg){
                        alert('评论失败，请联系管理员！');
                    }
                )
            }else{
                alert('请先输入评论内容');
            }
        });
    }

    function loadData(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/userInfo.do',
            {
                id: utils.getQueryString('userid')
            },
            function(json){
                rendInfo(json.data);
                rendImages(json.data);
                rendVoice(json.data);
                scrollBgImg(json.data);
            }
        )
    }

    function loadDiscuss(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/comList.do',
            {
                id: utils.getQueryString('userid')
            },
            function(json){
                rendDiscuss(json.data);
            }
        )
    }

    function rendInfo(data){
        var baseInfo = data.baseInfo;
        var $holds = $('[data-holder]');

        $holds.each(function(){
            var name = $(this).data('holder');
            if(baseInfo[name]){
                $(this).text(baseInfo[name])
            }
        })
    }

    function rendImages(data){
        var images = data.images;
        var html = [];
        if(images.length > 8){
            images = images.slice(0, 8);
        }
        $('#j-portrait').css('background-image', 'url(' + (images[0] || '/simi/bgimg/cover.jpg') + ')');

        $.each(images, function(idx, ele){
            html.push('<span class="imgbox"><img src="' + ele + '" alt=""/></span>')
        });

        $('#j-imgs').data('images', images).html(html.join(''));
    }
    var isPlaying = false;
    function rendVoice(data){
        var id = data.voice.voiceId;
        var voiceId = '';
        $('#j-voice')
            //.data('id', id)
            .find('time').text((data.voice.voiceTime || 0) + '"')
            .end()
            .on('touchend', function(eve){
                if(isPlaying){
                    return
                }
                isPlaying = true;
                eve.preventDefault();
                if(voiceId){
                    playVoice(voiceId);
                    return;
                }
                wx.downloadVoice({
                    serverId: id,
                    success: function(res){
                        playVoice(res.localId);
                        voiceId = res.localId;
                    }
                });
            });

        function playVoice(id){
            wx.playVoice({
                localId: id
            });
        }

        wx.onVoicePlayEnd({
            complete: function (res) {
              alert('录音播放结束');
              isPlaying = false;
            }
        });
    }

    function rendDiscuss(data){
        var $list = $('#j-dis-list');
        var html = [];
        var data = data.comments || [];
        var length = data.length;
        $.each(data, function(index, element){
            html.push('<li>' +
                        '<span class="portrait"' + (element.pic ? ' style="background: url(' + element.pic + ') no-repeat;background-size: cover;border-radius:50%;"' : '')+ '></span>' +
                        '<div class="info">' +
                            '<div class="userName">' +
                                '<i class="storey">' + (length - index) + '楼</i>' +
                                '<h2>' + (element.name || '游客') + '</h2>' +
                            '</div>' +
                            '<p>' + element.comment + '</p>' +
                        '</div>' +
                    '</li>')
        });

        $list.html(html.join(''))
    }

    function zan(){
        stopAni();
        var list = localStorage.getItem('commendUsers');
        var id = utils.getQueryString('userid');

        if((',' + list + ',').indexOf(',' + id + ',') !== -1){
            alert('您已经点赞过了');
            return
        }

        utils.ajaxSendJSON(
            '/simi/user/praise.do',
            {
                beZanUserId: id,
                zanUserId: localStorage.getItem('userid')
            },
            function(json){
                //TODO 点赞成功后处理
                $('#j-zan-tips').text('点赞成功');
                $('#j-scan').off('touchstart touchend');
                updatePrice(json.data.price);

                localStorage.setItem('commendUsers', list ? list + ',' + id : id)
            },
            function(msg){
                alert(msg);
                //$('#j-zan-tips').text('点赞失败')
            }
        )
    }

    function updatePrice(price) {
        $('[data-holder="price"]').text(price)
    }

    var aniTimer = null;
    function startAni(){
        // $('#j-line').addClass('line');
        if(aniTimer){
            clearInterval(aniTimer);
            aniTimer = null;
        }
        aniTimer = setInterval(ani, 1000);

        function ani(){
            $('#j-line').show().animate({top:0}, 500).animate({'top':93}, 500)
        }

        ani();
    }

    function stopAni(){
        clearInterval(aniTimer);
        aniTimer = null;
        $('#j-line').hide()
        //$('#j-line').removeClass('line');
    }

    function scrollBgImg(data){
        // $('#j-portrait').css('background-position-y', '0')
        var images = data.images;
        var img = new Image();
        var timer = 0;
        var h = 0;

        img.src = images[0];

        timer = setInterval(function(){
            h = img.height;
            if(h){
                h = h * $('#j-portrait').width() / img.width - 180;
                clearInterval(timer);
                // $('#j-portrait').animate({'background-position-y':0}, 5000)
                setInterval(ani, 18000);
            }
        }, 50);

        function ani(){
            $('#j-portrait').delay(1000).animate({'background-position-y':'0%'}, 8000).animate({'background-position-y': '99.99%'}, 8000)
        }
        ani();
    }
});
