$(function(){
    var timer = 0;

    loadData();
    initEvent();

    function initEvent(){
        // 点赞
        $('#j-scan').on('touchstart', function(eve){
            eve.preventDefault();

            var target = eve.target,
                time = 0;

            timer = setInterval(function(){
                if(++time === 3){
                    console.info('点赞...');
                    zan();
                }
            }, 1000);

            startAni();
        }).on('touchend', function(eve){
            clearInterval(timer);
            timer = null;
            stopAni();
        });

        function getURL(url){
            return location.protocol + "//" + location.hostname + url
        }

        // 预览图片
        $('#j-imgs').on('click', 'img', function(eve){
            // eve.preventDefault();
            var imgs = $('#j-imgs').data('images');
            var urls = [];
            $.each(imgs, function(index, element){
                urls.push(getURL(element))
            })
            wx.previewImage({
                current: getURL($(this).attr('src')),
                urls: urls
            });
        });

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
            '/simi/user/perList.do',
            {
                type: utils.getQueryString('type')
            },
            function(json){
                rendInfo(json.data);
            }
        )
    }

    function rendInfo(data){
        var temp = '<li>' +
            '<div class="item">' +
                '<a href="/simi/user/personal.do?userid={{id}}">' +
                    '<span class="onePiece ">WANTED</span>' +
                    '<span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>01</span>' +
                    '<img src="{{img}}" alt=""/>' +
                    '<div class="info">' +
                        '<p>姓名：{{name}}</p>' +
                        '<p>身价：{{price}}</p>' +
                        '<p>公司：{{company}}</p>' +
                        '<p>职业：{{zhiye}}</p>' +
                    '</div>' +
                    '<span class="cloud"></span>' +
                '</a>' +
            '</div>' +
        '</li>';

        var html = [];

        $.each(data.list, function(index, ele){
            html.push(
                temp.replace(/\{\{img\}\}/g, ele.img)
                    .replace(/\{\{name\}\}/g, ele.name)
            )
        });

        $('#j-per-list').html(html.join(''))
    }
});
