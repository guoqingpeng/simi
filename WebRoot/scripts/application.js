$(function(){
    var timer = 0;
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
