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
            '/simi/user/userList.do',
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

        $('#j-per-list').append(html.join(''))
    }
});
