$(function(){
    utils.initSearch();
    utils.initNav();
    // 上传图片
    var images = {
        serverId: [],
        localId:[]
    };
    var voice = {
        localId: ''
    };

    initVoiceText();

    function initVoiceText(){
        var text = {
            "1": [
                '女士们先生们：飞机很快就要起飞，现在客舱乘务员将进行安全检查，请您调直椅背，收起小桌板、脚踏板及杯托。请确认安全带已扣好系紧，电子设备的电源请关闭（包括飞行模式的手机）。靠窗的旅客请协助我们打开避光板。本次航班为禁烟航班。我们将与您共同营造一个温馨的客舱氛围，祝您旅途愉快！谢谢',
                '女士们先生们：（长时间滑行等待）：感谢您的耐心等待我们的飞机很快就要起飞，请您再次确认安全带已扣好系紧，手机等电子设备已关闭。谢谢',
                '女士们先生们：我们正在等待航空管制的命令，飞机将很快起飞，请您不要起身，并系好安全带。谢谢',
                '女士们先生们：受到机流影响飞机有些颠簸，为了您的安全，请您不要在客舱中站立走动并请系好安全带，正在使用洗手间的旅客请您抓好扶手。我们将暂停提供热饮。感谢您的理解',
                '女士们先生们：请您将手提物品放在行李架内或座椅下方，严禁放在过道或应急出口处。谢谢'
            ],
            "2": [
                "从现在开始，你只许疼我一个人，要宠我，不能骗我，答应我的每一件事都要做到，对我讲的每一句话都要真心，不许欺负我、骂我，要相信我。别人欺负我，你要在第一时间出来帮我，我开心了，你就要陪着我开心，我不开心了，你就要哄我开心，永远都要觉得我是最漂亮的，梦里也要见到我，在你的心里面只有我。",
                "什么叫成功人士你知道吗？成功人士就是买什么东西都买贵的不买最好的，所以我们做房地产的口号就是；不求最好，但求最贵。",
                "你想要啊？悟空，你要是想要的话你就说话嘛，你不说我怎么知道你想要呢，虽然你很有诚意地看着我，可是你还是要跟我说你想要的。你真的想要吗？那你就拿去吧！你不是真的想要吧？难道你真的想要吗？",
                "曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。你的剑在我的咽喉上割下去吧！不用再犹豫了！如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。如果非要在这份爱上加上一个期限，我希望是…… 一万年！",
                "一个男人和一个女人，他们在完全对对方没有任何了解和认识的情况下 竟然会在一个清晨拥抱在一起，他们在渴求的是什么？他们不是在要对方，他们在要自己。我们在所有经过的爱情当中，都不是看到的对方只是看到了自己。",
                "你是我的小呀小苹果儿，怎么爱你都不嫌多，红红的小脸儿温暖我的心窝，点亮我生命的火 火火火火，你是我的小呀小苹果儿，就像天边最美的云朵，春天又来到了花开满山坡，种下希望就会收获。",
                "老子明天不上班了不用七八点挤公交，明天不上班了老子今晚要耍通宵，到了明天白天老子想几点起就几点，只要愿意所有条条款款都算屁，老子明天不上班 爽翻 巴适的板，老子明天不上班 想咋懒我就咋懒，老子明天不上班 不用见客户装孙子，明天不上班可以活出一点真实。",
                "就这个feel 倍儿爽 倍儿爽！这个feel 倍儿爽 feel feel倍儿爽！爽爽爽爽！",
                "天空飘来五个字儿， 那都不是事！是事儿也就烦一会儿， 一会儿就完事儿！天空飘来五个字儿 那都不是事！是事儿也就烦一会儿， 一会儿就完事儿！"
            ]
        }[localStorage.getItem('usertype') || "1"];

        var len = text.length;

        $('#j-voice-text').text(text[Math.floor(Math.random() * len)])

    }


    $('.m-portraitPic').empty();
    $('#j-add').on('click', function(eve){
        eve.preventDefault();
        wx.chooseImage({
            success: function(res){
                var localIds = res.localIds;
                if(images.serverId.length + localIds.length > 8){
                    alert('最多只能选择8张图片');
                    return
                }

                uploadImage(localIds);
            }
        });
    });

    $('.m-portraitPic').on('click', '.close', function(eve){
        eve.preventDefault();
        var $parent = $(this).parent();
        var index = $parent.data('index');
        $parent.remove();
        //images.localId.splice(index, 1);
        images.serverId.splice(index, 1);
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
            $btn.find('p').text("正在录音...");
        }else{
            wx.stopRecord({
                success: function(res){
                    voice.localId = res.localId;
                    clearInterval(voiceTimer);
                    $btn.removeClass('recording').find('p').hide();
                    $btn.find('p').text("重新录音...");
                },
                fail: function(res){
                    alert(JSON.stringify(res));
                }
            });
        }
        isRecording = !isRecording;
    })/*.on('touchend-', function(eve){
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
    });*/

    // 保存
    var params = {
        id: utils.getQueryString('userid')
    }

    $('#j-save').click(function(eve){
        eve.preventDefault();

        //images.serverId = [];

        // 保存录音
        if(voice.localId !== '') {
            //alert('请先使用 startRecord 接口录制一段声音');
            wx.uploadVoice({
                localId: voice.localId,
                success: function(res){
                    //alert('上传语音成功，serverId 为' + res.serverId);
                    voice.serverId = res.serverId;
                    //uploadImage(images.localId);
                    save();
                }
            });
        }else{
            //uploadImage(images.localId);
            save()
        }
    });

    function uploadImage(all){
        var a = all.slice(0);
        wx.uploadImage({
            localId: all[0],
            success: function (res) {
                //alert('图片成功，图片成功');
                images.serverId.push(res.serverId);
                a.shift();
                if(a.length){
                    uploadImage(a)
                }else{
                    showImage();
                    //save(images.serverId)
                }
            },
            fail: function (res) {
                alert(JSON.stringify(res));
            }
        });
    }

    function showImage(){
        var ids = getUrls(images.serverId);
        var start = $('.m-portraitPic').find('img').length;

        for(var i = start, len = ids.length; i < len; i++) {
            $('.m-portraitPic').append('<span class="imgbox" data-index="' + i + '"><i class="close"></i><img src="'
                + ids[i] + '" alt=""/></span>');
        }
    }

    function save(urls){
        if(!images.serverId.length){
            alert('请先选择图片哦');
            return
        }
        params.images = getUrls(images.serverId);
        if(voice.serverId){
            params.voice = {
                id: voice.serverId,
                url: getURL(voice.serverId),
                voiceLastTime : recordTime
            };
        }

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
