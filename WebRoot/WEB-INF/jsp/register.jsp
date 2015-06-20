<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection" />
    <!-- UC默认竖屏 ，UC强制全屏 -->
    <meta name="full-screen" content="yes"/>
    <meta name="browsermode" content="application"/>
    <!-- QQ强制竖屏 QQ强制全屏 -->
    <meta name="x5-orientation" content="portrait"/>
    <meta name="x5-fullscreen" content="true"/>
    <meta name="x5-page-mode" content="app"/>
    <title>真.空秀-注册</title>
    <link rel="stylesheet" href="../styles/release/register.css" />
    <script src="/simi/scripts/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="doc">
    <div class="doc-bd">
        <!-- 注册 -->
        <div class="m-title">
            <h2>注册</h2>
        </div>
        <form class="m-register">
            <div class="rows">
                <span class="label">姓名：</span>
                <div class="label-info">
                    <span class="ipt-box">
                    <input name="name" value="张三" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">年龄：</span>
                <div class="label-info">
                    <span class="ipt-box">
                        <input name="age" value="23" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">性别：</span>
                <div class="label-info">
                    <span class="select">
                        <select name="sex" >
                            <option value="1">男</option>
                            <option value="2" selected>女</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">所属公司：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="company" value="Qunar" type="text"/>
                    </span>
                    <br/>
                    <span class="tips">乘务员必填公司简称，例：东航</span>
                </div>
            </div>
            <div class="rows">
                <span class="label">类型：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <label>
                        <input type="radio" name="userType" value="1">
                        乘务
                    </label>
                    <label>
                        <input type="radio" name="userType" value="2">
                        非乘务
                    </label>
                    </span>
                    <br/>
                    <span class="tips">乘务员必填公司简称，例：东航</span>
                </div>
            </div>
            <div class="rows">
                <span class="label">职业：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="job" value="jisuanji" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">昵称：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input name="nickName" value="nickName" type="text"/>
                    </span>
                    <br/>
                    <span class="tips">由字母或者数字组成</span>
                </div>
            </div>
            <div class="rows">
                <span class="label">身高：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input name="height" value="189" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">三维：</span>
                <div class="label-info">
                    <span  class="select">
                        <select name="sanwei">
                            <option value="1">骨感</option>
                            <option value="2">匀称</option>
                            <option value="3" selected="">性感</option>
                            <option value="4">丰满代替</option>
                        </select>
                    </span>
                    <span  class="select" style="display:none" class="select" >
                        <select name="sanwei">
                            <option value="1">条顺</option>
                            <option value="2">匀称</option>
                            <option value="3">健壮</option>
                            <option value="4">健硕</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">星座：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input type="text" name="xinzuo" value="天平座"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">微博：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="weibo" value="weibo.com" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">微信：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="weixin" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">爱好：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="hobby" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">拉票宣言：</span>
                <div class="label-info">
                   <span  class="textarea">
                   <textarea name="anouncement" placeholder="拉票宣言">啦啦啦，我是卖报的小行家...</textarea>
                   </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">&nbsp;</span>
                <div class="label-info">
                    <button id="j-save" class="g-btn g-btn-s g-btn-warn"><span>保存并下一步</span></button>
                </div>
            </div>
        </form>
        <!-- /注册 -->
    </div>
    <footer class="m-foot">
        <ul class="first">
            <li><a href="index.html" title="首页">首页</a></li>
            <li><a href="actRule.html" title="活动规则">活动规则</a></li>
            <li>
                <a href="javascript:;" title="线上活动">线上活动</a>
                <ul class="next">
                    <li><a href="decisiveBattle.html">一战到底</a></li>
                    <li><a href="ask.html">无节操问答</a></li>
                </ul>
            </li>
            <li><a href="register.html" title="首页">我要报名</a></li>
        </ul>
    </footer>
</div>
<script src="/simi/scripts/jquery.serialize-object.js" charset="utf-8"></script>
<script src="/simi/scripts/register.js" charset="utf-8"></script>
</body>
</html>
