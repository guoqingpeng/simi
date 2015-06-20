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
            '<h4>' + idx + '：' + ele.question + '</h4>' +
            '<ul class="next">' +
                '<li><label ><input type="radio" name="a" checked/>A. RVML</label></li>' +
                '<li><label ><input type="radio" name="a"/>B. IDML</label></li>' +
                '<li><label ><input type="radio" name="a"/>C. HNML</label></li>' +
                '<li><label ><input type="radio" name="a"/>D. MSML</label></li>' +
            '</ul>' +
        '</li>');
    });

    
});
