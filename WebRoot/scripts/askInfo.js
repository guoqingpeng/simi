$(function(){
    var page = 1;

    loadData();
    initEvent();

    utils.initSearch();
    utils.fixbug();

    setImage();

    function initEvent(){
        // 评论
        $('#j-discuss').on('click', function(eve){
            eve.preventDefault();

            var text = $('#j-text').val();
            if(text){
                utils.ajaxSendJSON(
                    '/simi/question/reply.do',
                    {
                        questionId: utils.getQueryString('id'),
                        reply: text,
                        userId: localStorage.getItem('userid') || ""
                    },
                    function(json){
                        $('#j-text').val('');
                        alert('评论成功!');
                        loadData();
                    },
                    function(msg){
                        alert('评论失败，请联系管理员！');
                    }
                )
            }else{
                alert('请先输入评论内容');
            }
        });
    }

    function loadData(){
        var xhr = utils.ajaxSendJSON(
            '/simi/question/rList.do',
            {
                id: utils.getQueryString('id')
            },
            function(json){
                rendDiscuss(json.data);
            }
        )
    }

    function rendDiscuss(data){
        var $list = $('#j-dis-list');
        var html = [];
        var replys = data.replys || [];
        var length = replys.length;

        $('#content').text(data.title);

        $.each(replys, function(index, element){
            html.push('<li>' +
            '<span class="portrait"' + (element.pic ? ' style="background: url(' + element.pic + ') no-repeat;background-size: cover;border-radius:50%;"' : '')+ '></span>' +
                        '<div class="info">' +
                            '<div class="userName">' +
                                '<i class="storey">' + (length - index) + '楼</i>' +
                                '<h2>' + (element.name || '游客') + '</h2>' +
                            '</div>' +
                            '<p>' + element.reply + '</p>' +
                        '</div>' +
                    '</li>')
        });

        $list.html(html.join(''))
    }

    function setImage() {
        $('#j-img').find('img').attr('src', '/simi/bgimg/ask/ask-' + utils.getQueryString('id') + '.jpg')
    }
});
