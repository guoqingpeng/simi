$(function(){
    var timer = 0;

    loadData();
    initEvent();
    loadDiscuss();

    function initEvent(){
    	// 点赞
    	$('#j-scan').on('touchstart', function(eve){
	        eve.preventDefault();

	        var target = eve.target,
	            time = 0;

	        timer = setInterval(function(){
	            if(++time === 3){
	                console.info('点赞...');
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
    	$('#j-portrait').attr('src', images[0]);

    	$.each(images, function(idx, ele){
    		html.push('<span class="imgbox"><img src="' + ele + '" alt=""/></span>')
    	});

    	$('#j-imgs').data('images', images).html(html.join(''));
    }

    function rendVoice(data){
    	var id = data.voice.voiceId;
    	var voiceId = '';
    	$('#j-voice')
    		//.data('id', id)
    		.find('time').text(data.voice.time || 0 + '"')
    		.end()
    		.on('click', function(eve){
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
    }

    function rendDiscuss(data){
        var $list = $('#j-dis-list');
        var html = [];
        var data = data.comments || [];
        var length = data.length;
        $.each(data, function(index, element){
            html.push('<li>' +
                        '<span class="portrait"></span>' + 
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
        utils.ajaxSend(
        	'/simi/user/zan.do',
        	{
        		id: utils.getQueryString('userid')
        	},
        	function(json){
                $('#j-zan-tips').text('点赞成功');
                $('#j-scan').off('touchstart touchend');
            },
            function(){
                $('#j-zan-tips').text('点赞失败')
            }
        )
    }

    function startAni(){
        $('#j-line').addClass('line');
    }

    function stopAni(){
        $('#j-line').removeClass('line');
    }
});