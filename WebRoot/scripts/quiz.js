$(function(){
    if(utils.getQueryString('type') == '2'){
        timu = timu1;
        $('.m-decisive-hd').find('a').last().parent().addClass('active');
    }else{
        $('.m-decisive-hd').find('a').first().parent().addClass('active');
    }
    var timus = [];
    var length = timu.length;
    var total = 5;
    var index = 0;
    var j = total;


    utils.initNav();
    utils.fixbug();

    var SHARE_TITLE = '我在#真空.秀#参加了#一站到底#, 得分: {{score}}分, 你也来参加吧~~';
    var SHARE_LINK = 'http://haiyilingdong.com/simi/user/quizInit.do';
    var SHARE_DESC = '快来真空秀参加活动吧';
    var title = '';

    var resultComments = {
        perfect: '你是爱因斯坦么?',
        excellent: '非常优秀!',
        good: '很好，发挥不错!',
        average: '一般般了。',
        bad: '太可怜了！',
        poor: '好可怕啊！',
        worst: '悲痛欲绝！'
    };
    var score = 0;

    // if(!localStorage.getItem('userid')){
    //     alert('您还没有注册哦，请先注册了再参加可以啵~');
    //     location.href = '/simi/user/regInit.do';
    //     return
    // }

    while(j--){
        index = Math.floor(Math.random() * length--);
        timus.push(timu.splice(index, 1)[0])
    }

    // $('#j-quiz').jquizzy({
    //     questions: timus
    // });

    var html = [];
    $.each(timus, function(idx, ele){
        html.push('<li>' +
            '<h4>' + (idx + 1) + ': ' + ele.question + '</h4>' +
            '<ul class="next">' +
                getItems(ele, idx) +
            '</ul>' +
        '</li>');
    });

    $('#j-quiz').html(html.join(''));

    $('#j-enter').click(function(eve){
        eve.preventDefault();

        var answers = getAnswers();
        var rightAns = getCorrectAnswers();
        score = getScore(answers, rightAns);
        if(score !== -1){
            showMask();
            //alert(answers + "   " + rightAns + "  " + score);
            $(this).hide();
            $('#j-score').text(score + '分');
            $('#j-comment').text(judgeSkills(score));
            title = SHARE_TITLE.replace("{{score}}", score)
            //alert('您的得分是: ' + score)
        }
    });

    $('#j-share').on('click', function(eve) {
        // 分享到朋友圈
        wx.onMenuShareTimeline({
            title: title, // 分享标题
            link: SHARE_LINK, // 分享链接
            imgUrl: 'http://haiyilingdong.com/simi/bgimg/logo_1x.png', // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                addPrice();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        // 分享给朋友
        wx.onMenuShareAppMessage({
            title: title, // 分享标题
            desc: SHARE_DESC, // 分享描述
            link: SHARE_LINK, // 分享链接
            imgUrl: 'http://haiyilingdong.com/simi/bgimg/logo_1x.png', // 分享图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                addPrice();
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        // 分享到QQ
        wx.onMenuShareQQ({
            title: title, // 分享标题
            desc: SHARE_DESC, // 分享描述
            link: SHARE_LINK, // 分享链接
            imgUrl: 'http://haiyilingdong.com/simi/bgimg/logo_1x.png', // 分享图标
            success: function () {
               // 用户确认分享后执行的回调函数
               addPrice();
            },
            cancel: function () {
               // 用户取消分享后执行的回调函数
            }
        });

        hideMask();
    })

    function getItems(ele, index){
        var item = [];
        $.each(ele.answers, function(i, e){
            item.push('<li><label ><input type="radio" name="f_' + index + '" value="' + i + '"/>' + String.fromCharCode(65 + i) + ': ' + e + '</label></li>')
        });

        return item.join('')
    }

    function getAnswers() {
        var ans = [];
        var $fm = $('form');

        for(var i=0; i<total; i++){
            ans.push($fm.find('[name="f_' + i + '"]').filter(':checked').val());
        }

        return ans
    }

    function getCorrectAnswers() {
        var ans = [];
        var ques = timus;
        var code = 0;
        for(var i=0, len = ques.length; i<len; i++){
            code = ques[i].correctAnswer.charCodeAt(0) - 65;
            ans.push(code);
        }

        return ans
    }

    function getScore(answers, rightAns){
        var len = rightAns.length;
        var score = 0;
        var base = 100 / len;
        if(len > answers.join('').length){
            alert('请认真答完题再提交');
            return -1;
        }

        $.each(rightAns, function(i, e){
            if(e == answers[i]){
                score += base;
            }
        })

        score = Math.ceil(score);
        return score
    }

    function judgeSkills(score) {
        var returnString;
        if (score === 100) return resultComments.perfect;
        else if (score > 90) return resultComments.excellent;
        else if (score > 70) return resultComments.good;
        else if (score > 50) return resultComments.average;
        else if (score > 35) return resultComments.bad;
        else if (score > 20) return resultComments.poor;
        else return resultComments.worst;
    }

    function addPrice(){
        var count = localStorage.getItem('quizScoreCount') || '';
        count = Number(count);

        if(!localStorage.getItem('userid') || count > 1){
            return
        }
        localStorage.setItem('quizScoreCount', ++count);

        var _score = score * 1;
        utils.ajaxSendJSON(
            '/simi/user/addPrice.do',
            {
                userId: localStorage.getItem('userid'),
                price: _score
            },
            function(json){
                alert(':) 恭喜恭喜, 您的身价已经增加#' + _score + '#');
                location.href = '/simi/user/mainInit.do';
            },
            function(){
                alert(':( 实在抱歉，身价增加失败，请刷新后再试!')
            }
        )
    }

    function showMask(){
        $('#j-mask, #j-dialog').show();
    }

    function hideMask(){
        $('#j-mask, #j-dialog').hide();
    }
});
