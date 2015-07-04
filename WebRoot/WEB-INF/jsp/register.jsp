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
                <span class="label"><i class="warn">*</i>姓名：</span>
                <div class="label-info">
                    <span class="ipt-box">
                    <input name="name" value="" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">年龄：</span>
                <div class="label-info">
                    <span class="ipt-box">
                        <input name="age" value="" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">性别：</span>
                <div class="label-info">
                    <span class="select">
                        <select name="sex" >
                            <option value="2">男</option>
                            <option value="1" selected>女</option>
                        </select>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">所属公司：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="company" value="" type="text"/>
                    </span>
                    <span class="tips">乘务员必填公司简称，例：东航</span>
                </div>
            </div>
            <div class="rows">
                <span class="label">类型：</span>
                <div class="label-info">
                    <label>
                        <input type="radio" name="userType" value="1">
                        乘务
                    </label>
                    <label>
                        <input type="radio" name="userType" value="2">
                        非乘务
                    </label>
                </div>
            </div>
            <div class="rows" style="display:none">
                <span class="label">职业：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="job" value="" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label"><i class="warn">*</i>昵称：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input name="nickName" value="" type="text"/>
                    </span>
                    <span class="tips">由字母或者数字组成</span>
                </div>
            </div>
            <div class="rows" style="display:none">
                <span class="label">身高：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input name="height" value="" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">三维：</span>
                <div class="label-info">
                    <span  class="select">
                        <select name="sanwei" id="j-sanwei">
                            <option value="1">骨感</option>
                            <option value="2">匀称</option>
                            <option value="3" selected="">性感</option>
                            <option value="4">丰满</option>
                        </select>
                    </span>
                    <%-- <span  class="select" style="display:none" class="select" >
                        <select name="sanwei">
                            <option value="1">条顺</option>
                            <option value="2">匀称</option>
                            <option value="3">健壮</option>
                            <option value="4">健硕</option>
                        </select>
                    </span> --%>
                </div>
            </div>
            <div class="rows">
                <span class="label">星座：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                        <input type="text" name="xinzuo" value=""/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label"><i class="warn">*</i>手机号：</span>
                <div class="label-info">
                    <span class="ipt-box">
                        <input name="phone" value="" maxlength="11" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows" style="display:none">
                <span class="label"><i class="warn">*</i>邮箱：</span>
                <div class="label-info">
                    <span class="ipt-box">
                        <input name="email" value="" type="text"/>
                    </span>
                </div>
            </div>
            <div class="rows">
                <span class="label">微博：</span>
                <div class="label-info">
                    <span  class="ipt-box">
                    <input name="weibo" value="" type="text"/>
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
                   <textarea name="anouncement" placeholder="拉票宣言"></textarea>
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
    <jsp:include page="foot.jsp"/>
</div>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script src="/simi/scripts/utils.js" charset="utf-8"></script>
<script src="/simi/scripts/jquery.serialize-object.js" charset="utf-8"></script>
<script src="/simi/scripts/register.js" charset="utf-8"></script>
</body>
</html>
