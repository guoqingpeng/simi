$(function(){
    var page = 1;

    loadData();
    initEvent();

    function initEvent(){
        // 评论
        $('#j-discuss').on('click', function(eve){
            eve.preventDefault();

            var text = $('#j-text').val();
            if(text){
                utils.ajaxSendJSON(
                    '/simi/user/commnet.do',
                    {
                        beCommentedUser: utils.getQueryString('userid'),
                        content: text,
                        commentUser: localStorage.getItem('userid') || ""
                    },
                    function(json){
                        $('#j-text').val('');
                        alert('评论成功!');
                        loadDiscuss();
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
            '/simi/user/askList.do',
            {
                //type: utils.getQueryString('type'),
                //page: page
            },
            function(json){
                rendDiscuss(json.data);
            }
        )
    }

    function rendDiscuss(data){
        var $list = $('#j-dis-list');
        var html = [];
        var data = data.comments || [];
        var length = data.length;
        $.each(data, function(index, element){
            html.push('<li>' +
                        '<span class="portrait"></span>' +
                        '<div class="info">' +
                            '<div class="userName">' +
                                '<i class="storey">' + (length - index) + '楼</i>' +
                                '<h2>' + (element.name || '游客') + '</h2>' +
                            '</div>' +
                            '<p>' + element.comment + '</p>' +
                        '</div>' +
                    '</li>')
        });

        $list.html(html.join(''))
    }
});
