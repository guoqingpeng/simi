$(function(){
    var timer = 0;

    loadData();
    initEvent();

    function initEvent(){
    	// 点赞
    	$('#j-scan').on('touchstart', function(eve){
	        eve.preventDefault();

	        var target = eve.target,
	            time = 0;

	        timer = setInterval(function(){
	            console.log('timer' + time);
	            //target.innerHTML = '录音时间: ' + time++ + '\'';
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

	    // 预览图片
	    $('#j-imgs').on('click', 'img', function(eve){
	    	// eve.preventDefault();
	    	wx.previewImage({
                current: $(this).attr('src'),
                urls: $('#j-imgs').data('images')
            });
	    })
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
    		}
    	)
    }

    function rendInfo(data){
    	console.log(data);
    	var baseInfo = data.baseInfo;
    	var $holds = $('[data-holder]');

    	$holds.each(function(){
    		var name = $(this).data('holder');
    		if(baseInfo[name]){
    			$(this).text(data[name])
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
    	var id = data.voice.id;
    	$('#j-voice')
    		//.data('id', id)
    		.find('time').text(data.voice.time + '"')
    		.on('click', function(eve){
    			eve.preventDefault();

    			wx.playVoice({
	                localId: id
	            });
    		})
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