$(function(){
    var timus = [];
    var length = timu.length;
    var total = 10;
    var index = 0;

    while(total--){
        index = Math.floor(Math.random() * length--);
        timus.push(timu.splice(index, 1)[0])
    }

    $('#j-quiz').jquizzy({
        questions: timus
    });
});
