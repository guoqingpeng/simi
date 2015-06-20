$(function(){
    var page = 1;
    var type = 0;

    loadData();
    initEvent();

    TouchSlide({
        slideCell:"#J_slide",
        titCell:".state ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
        mainCell:".picbox ul",
        effect:"leftLoop",
        autoPage:true,//自动分页
        autoPlay:true //自动播放
    });

    if(utils.getQueryString('type') == 2){
        $('h2').text('非乘务组')
    }

    function initEvent(){
        $('.cw-item').on('click', function(eve){
            $('.cw-item').removeClass('active');
            type = $(this).data('type').addClass('active');
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
                rendInfo(json.data);
            }
        )
    }

    function rendInfo(data){
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

        var html = [];

        $.each(data.uList, function(index, ele){
            html.push(
                temp.replace(/\{\{img\}\}/g, ele.filePath || '../img/img4.jpg')
                    .replace(/\{\{name\}\}/g, ele.name || '')
                    .replace(/\{\{id\}\}/g, ele.id || '')
                    .replace(/\{\{price\}\}/g, ele.price || 0)
                    .replace(/\{\{company\}\}/g, ele.company || '')
                    .replace(/\{\{job\}\}/g, ele.job || '')
                    .replace(/\{\{index\}\}/g, (((page - 1) * 2) + index + 101 + '').slice(1))
            )
        });

        $('#j-per-list').html(html.join(''))
    }
});
