utils.initNav();
$('#j-save').on('click', function(eve){
    eve.preventDefault();

    if($('[name="name"]').val() == ''){
        alert('姓名必须填写');
        return
    }

    var nickName = $('[name="nickName"]').val();
    if(nickName == ''){
        alert('昵称必须填写');
        return
    }

    if(!/^[a-zA-Z0-9]{6,}$/.test(nickName)){
        alert('昵称只能是数字和字母，不得少于6位');
        return
    }

    var phone = $('[name="phone"]').val();
    if(phone == ''){
        alert('请填写手机号');
        return
    }
    if(!/^1\d{10}$/.test(phone)){
        alert('手机号只能是11位数字');
        return
    }

    // var email = $('[name="email"]').val();
    // if(email == ''){
    //     alert('请填写邮箱');
    //     return
    // }
    // if(!/^([a-z0-9A-Z]+[-|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/.test(email)){
    //     alert('邮箱格式不对');
    //     return
    // }

    var type = $('[name="userType"]:checked').val();
    if(!type){
        alert('请先选择乘务类型');
        return
    }

    if(type == 1 && !$('[name="company"]').val()){
        alert('乘务组需要填写公司名称');
        return
    }

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
            localStorage.setItem('usertype', json.data.userType);
            location.href = '/simi/user/uploadInit.do?userid=' + json.data.id
        }else{
            alert(json.errmsg)
        }
    }).fail(function(){
        alert('网络繁忙，请联系管理员!')
    });
});

$('[name="sex"]').on('change', function(eve){
    updateOptions($(this).val());
});

function updateOptions(val) {
    var mapping = {
        "1": ['骨感', '匀称', '性感', '丰满'],
        "2": ['条顺', '匀称', '健壮', '健硕']
    }
    var options = mapping[val];
    var html = [];
    $.each(options, function(i, e){
        html.push('<option value="' + (val + i) + '">' + e + '</option>')
    });
    $('#j-sanwei').empty().html(html.join(''))
}
