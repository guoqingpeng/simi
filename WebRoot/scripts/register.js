$('#j-save').on('click', function(eve){
    eve.preventDefault();
    var param = $('form').serializeObject();
    debugger
    var xhr = $.ajax({
        url: '/simi/user/reg.do',
        data: JSON.stringify(param, null, 4),
        contentType: 'application/json;charset=utf-8',
        type: 'POST'
    });

    xhr.done(function(json){
        alert('ok' + JSON.stringify(json, null, 4));
    }).fail(function(){
        alert('error');
    });
})