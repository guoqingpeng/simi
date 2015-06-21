$(function(){
    var page = 1;

    loadData();
    initEvent();

    // utils.initNav();
    utils.initSearch();

    function initEvent(){
        $('#j-load-more').on('click', function(eve){
            page++;
            loadData();
        })
    }

    function loadData(){
        var xhr = utils.ajaxSendJSON(
            '/simi/user/askList.do',
            {
                //type: utils.getQueryString('type'),
                //page: page
            },
            function(json){
                rendInfo(json.data);
            }
        )
    }

    function rendInfo(data){
        var html = [];
        $.each(data.uList, function(index, ele){
            html.push('<li><a href="/ask.do?id=' + ele.id +'">' + e.title + '</a></li>')
        });

        $('#j-ask-list').append(html.join(''))
    }
});
