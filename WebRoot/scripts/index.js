$(function(){
    var page = 1;
    var type = 0;

    loadData();
    loadRenQiStar();
    initEvent();

    TouchSlide({
        slideCell:"#slideBox",
        titCell:".state ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
        mainCell:".picbox ul",
        effect:"leftLoop",
        interTime: 5000,
        autoPage:true,//自动分页
        autoPlay:true //自动播放
    });

    if(utils.getQueryString('type') == 2){
        $('h2').text('非乘务组')
    }

    function initEvent(){
        $('.cw-item').on('click', function(eve){
            $('.cw-item').removeClass('active');
            type = $(this).addClass('active').data('type');
            loadData();
        });
    }

    function loadData(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/uList.do',
            {
                type: type,
                page: page
            },
            function(json){
                rendInfo('def', json.data);
            }
        )
    }

    function loadRenQiStar(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/popularity.do',
            {
                type: type,
                page: page
            },
            function(json){
                rendInfo('rq', json.data);
            }
        )
    }

    function rendInfo(type, data){
        var temp = '<li>' +
            '<div class="item">' +
                '<a href="/simi/user/personalInit.do?userid={{id}}">' +
                    '<span class="onePiece ">WANTED</span>' +
                    '<span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>{{index}}</span>' +
                    '<img src="{{img}}" alt=""/>' +
                    '<div class="info">' +
                        '<p>姓名：{{name}}</p>' +
                        '<p>身价：{{price}}</p>' +
                        '<p>公司：{{company}}</p>' +
                        '<p>职业：{{job}}</p>' +
                    '</div>' +
                    '<span class="cloud"></span>' +
                '</a>' +
            '</div>' +
        '</li>';
        var tempRQ = '<div class="item">' +
            '<a href="/simi/user/personalInit.do?userid={{id}}">' +
                '<p>' +
                    '<i class="g-ico g-ico-crown"></i>' +
                    '<img src="{{img}}" alt=""/>' +
                '</p>' +
                '<span class="name">{{name}}</span>' +
            '</a>' +
        '</div>'

        var html = [];
        var tmpl = {
            'rq': tempRQ,
            'def': temp
        }[type];
        var selector = {
            'def': '#j-per-list',
            'rq': '#j-rq-list'
        }[type]

        $.each(data.uList, function(index, ele){
            html.push(
                tmpl.replace(/\{\{img\}\}/g, ele.filePath || '../img/img4.jpg')
                    .replace(/\{\{name\}\}/g, ele.name || '')
                    .replace(/\{\{id\}\}/g, ele.id || '')
                    .replace(/\{\{price\}\}/g, ele.price || 0)
                    .replace(/\{\{company\}\}/g, ele.company || '')
                    .replace(/\{\{job\}\}/g, ele.job || '')
                    .replace(/\{\{index\}\}/g, (((page - 1) * 2) + index + 101 + '').slice(1))
            )
        });

        $(selector).html(html.join(''))
    }
});
