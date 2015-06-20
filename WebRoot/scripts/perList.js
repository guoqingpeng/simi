$(function(){
    var page = 1;

    loadData();
    initEvent();

    function initEvent(){
        $('#j-load-more').on('click', function(eve){
            page++;
            loadData();
        })
    }

    function loadData(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/uList.do',
            {
                type: utils.getQueryString('type'),
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
                '<a href="/simi/user/personal.do?userid={{id}}">' +
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
                temp.replace(/\{\{img\}\}/g, ele.img || '../img/img4.jpg')
                    .replace(/\{\{name\}\}/g, ele.name || '')
                    .replace(/\{\{price\}\}/g, ele.price || 0)
                    .replace(/\{\{company\}\}/g, ele.company || '')
                    .replace(/\{\{job\}\}/g, ele.job || '')
                    .replace(/\{\{index\}\}/g, (((page - 1) * 20) + index + 101 + '').slice(1))
            )
        });

        $('#j-per-list').append(html.join(''))
    }
});
