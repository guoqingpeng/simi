$('#j-save').on('click', function(eve){
    eve.preventDefault();
    var param = $('form').serializeJSON();
    var xhr = $.ajax({
        url: '/simi/user/reg.do',
        data: JSON.stringify(param, null, 4),
        contentType: 'application/json;charset=utf-8',
        type: 'POST'
    });

    xhr.done(function(json){
        alert('ok' + JSON.stringify(json, null, 4));
        if(json.ret === true){
            location.href = '/simi/user/uploadInit.do?userid=' + json.data.id
        }else{
            alert(json.errmsg)
        }
    }).fail(function(){
        alert('网络繁忙，请联系管理员!')
    });
})