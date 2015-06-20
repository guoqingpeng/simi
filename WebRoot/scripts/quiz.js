$(function(){
    var timus = [];
    var length = timu.length;
    var total = 3;
    var index = 0;

    while(total--){
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
            ans.push($fm.find('f_' + i).filter(':checked').val());
        }

        return ans
    }
});
