$(function(){
    var timer = 0;

    loadData();
    initEvent();

    function initEvent(){
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
    }

    function loadData(){
    	var xhr = utils.ajaxSend(
    		'/simi/user/info.do',
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
    	var $holds = $('[data-holder]');

    	$holds.each(function(){
    		var name = $(this).data('holder');
    		if(data[name]){
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

    	$('#j-imgs').html(html.join(''));
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
        var xhr = $.ajax({
            url: '/zan',
            data: {
                userID: userID
            },
            success: function(json){
                alert('ok')
            },
            error: function(){
                alert('error')
            }
        })
    }

    function startAni(){
        $('#j-line').addClass('line');
    }

    function stopAni(){
        $('#j-line').removeClass('line');
    }
});