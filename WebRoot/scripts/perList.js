$(function(){
    var page = 1;

    loadData();
    initEvent();

    utils.initSearch();
    utils.initNav();
    utils.fixbug();

    if(utils.getQueryString('type') == 2){
        $('h2').text('非乘务组')
    }

    function initEvent(){
        $('#j-load-more').on('click', function(eve){
            // page++;
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
            '<div class="item {{cls}}">' +
                '<a href="/simi/user/personalInit.do?userid={{id}}">' +
                    '<span class="onePiece ">WANTED</span>' +
                    '<span class="rank"><i class="g-ico g-ico-s g-ico-heart"></i>{{index}}</span>' +
                    '<div class="img-con"><img src="{{img}}" alt=""/></div>' +
                    '<div class="info">' +
                        '<p>姓名：{{name}}</p>' +
                        '<p>身价：<span class="fzm">{{price}}$</span></p>' +
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
                    .replace(/\{\{index\}\}/g, (((page - 1) * 20) + index + 101 + '').slice(1))
                    .replace(/\{\{cls\}\}/g, ele.price >= 8000 ? 'celeb' : '')
            )
        });

        if(data.uList.length){
            page++
        }

        $('#j-per-list').append(html.join(''))
    }
});
