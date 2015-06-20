$(function(){
    var timus = [];
    var length = timu.length;
    var total = 4;
    var index = 0;
    var j = total;
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
        var score = getScore(answers, rightAns);
        //alert(answers + "   " + rightAns + "  " + score);
        $(this).hide();
        alert('您的得分是: ' + score)
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
        if(len > answers){
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
});
