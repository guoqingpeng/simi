$('#j-save').on('click', function(eve){
    utils.initNav();

    eve.preventDefault();
    var param = $('form').serializeJSON();
    //var deviceID = localStorage.getItem('deviceID');

    // if(!deviceID){
    //     deviceID = String(Manth.random()).replace('.', '');
    //     localStorage.setItem('deviceID', deviceID);
    // }

    //param.deviceID = deviceID;

    var xhr = $.ajax({
        url: '/simi/user/reg.do',
        data: JSON.stringify(param, null, 4),
        contentType: 'application/json;charset=utf-8',
        type: 'POST'
    });

    xhr.done(function(json){
        //alert('ok' + JSON.stringify(json, null, 4));
        if(json.ret === true){
            localStorage.setItem('userid', json.data.id);
            localStorage.setItem('usertype', json.data.type);
            location.href = '/simi/user/uploadInit.do?userid=' + json.data.id
        }else{
            alert(json.errmsg)
        }
    }).fail(function(){
        alert('网络繁忙，请联系管理员!')
    });
})
