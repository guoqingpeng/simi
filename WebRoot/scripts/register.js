$('#j-save').on('click', function(eve){
    eve.preventDefault();
    var param = $('form').serialize();
    var xhr = $.ajax({
        url: '/user/reg',
        data: param,
        contentType: 'application/json;charset=utf-8'
        type: 'POST'
    });

    xhr.done(function(json){
        alert('ok' + JSON.stringify(json, null, 4));
    }).fail(function(){
        alert('error');
    });
})