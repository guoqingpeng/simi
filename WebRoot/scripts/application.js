$('#j-scan').on('touchstart', function(eve){
    eve.preventDefault();

    var target = eve.target,
        time = 0;

    timer = setInterval(function(){
        console.log('timer');
        //target.innerHTML = '录音时间: ' + time++ + '\'';
        if(time === 3){
            console.info('点赞...');
        }
    }, 1000);

    $('#j-line').addClass('line');
}, false);

$('#j-test').addEventListener('touchend', function(eve){
    clearInterval(timer);
    timer = null;
}, false);
