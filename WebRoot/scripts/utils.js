/**
 * @fileOverview 通用工具对象
 * @author daiying.zhang
 */

var cache = {};
function padNumber(number){
    return number >= 10 ? number : '0' + number
}
var patterns = {
    yyyy: function(date){
        return date.getFullYear();
    },
    mm: function(date){
        return padNumber(date.getMonth() + 1);
    },
    dd: function(date){
        return padNumber(date.getDate())
    }
    ,hh : function(date){
        return padNumber(date.getHours())
    }
    ,MM : function(date){
        return padNumber(date.getMinutes())
    }
    ,ss : function(date){
        return padNumber(date.getSeconds())
    }
};

window.utils = {
    /**
     * 获取url中的参数，返回Object
     * @returns {{}}
     */
    getQueryObj: function(data){
        var dt = data ? data:location.search;
        var qs = (dt || '').replace('?',''),
            params = qs ? qs.split('&') : [],
            len = params.length,
            i = 0,
            keyVal,
            result = {};

        for(i; i<len; i++){
            keyVal = params[i].split('=');
            result[keyVal[0]] = keyVal[1]
        }
        //cache.queryObj = result;
        return result
    },

    /**
     * 获取url中指定的参数
     * @param key
     * @returns {*|string}
     */
    getQueryString: function(key){
        if(!cache.queryObj){
            var res =  location.search.match(new RegExp("\\b" + key + "=([^&]*)", "i"));
            return res && res[1] || ''
        }
        return cache.queryObj[key] || ''
    },
    /**
     * 日期对象格式化
     * @param {Date} date 要格式化的日期对象
     * @param {String} [pattern=yyyy-mm-dd] 格式化模板
     * @return {String}
     */
    formatDate: function(date, pattern){
        if($.type(pattern) !== "string"){
            pattern = "yyyy-mm-dd";
        }

        var result = pattern.replace(/\b(\w+)\b/g,function(match){
            return patterns[match](date);
        });

        return result || date.toString();
    },
    copy2Clipboard: function (text) {
        if (window.clipboardData) // Internet Explorer
        {
            window.clipboardData.setData("Text", text);
        }
    },
    getID: (function(){
        var ID = 0;
        return function(){
            return ++ID
        }
    })(),
    getCache: function(){
        if(typeof window.__cache__ === 'undefined'){
            window.__cache__ = {}
        }
        return window.__cache__;
    },
    /**
     * 发送Ajax请求
     * @param {String} url 请求的url
     * @param {Object|String} params 请求附加的参数
     * @param {Function} fnDone 成功回调函数,有返回值并且ret为true时调用
     * @param {Function} fnFail 失败回调函数,没有返回值后者ret不为true时调用
     * @param {Object} opt 配置参数
     */
    "ajaxSend": function (url, params, fnDone, fnFail, opt) {
        var settings = $.extend({
            type: 'GET',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
        }, opt);
        var xhr = $.ajax({
                url: url,
                type: settings.type,
                contentType: settings.contentType,
                data: params,
                cache: false
            }),
            _fnFail = function (msg) {
                msg = typeof msg === 'string' ? msg : '网络繁忙，请稍后再试';
                fnFail ? fnFail(msg) : alert(msg);
            };

        xhr.done(function(json){
            if(json && json.ret === true){
                fnDone && fnDone(json)
            }else{
                _fnFail(json ? json.errmsg : "操作失败，请稍后再试", json)
            }
        }).fail(_fnFail)

        return xhr
    },
    "ajaxSendJSON": function(url, params, fnDone, fnFail, opt){
        opt = opt || {};
        opt.contentType = "application/json";
        opt.type = 'POST';
        params = $.type(params) === 'string' ? params : JSON.stringify(params, null, 4);
        return this.ajaxSend(url, params, fnDone, fnFail, opt)
    },

    "initNav": function(){
        $('.m-foot').on('click', 'a', function(eve) {
            var $next = $(this).nextAll('.next');
            if($next.length){
                eve.preventDefault();
                eve.stopPropagation();
                $next.toggle();
            }
        });

        $(document.body).on('click', function(eve){
            $('.m-foot .next').hide();
        })
    }
};
