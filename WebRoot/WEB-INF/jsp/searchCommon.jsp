<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="m-search">
    <i class="g-ico g-ico-s g-ico-search"></i>
    <span class="sch-ipt"><input type="text" value="" placeholder="搜索昵称或手机号"/></span>
</div>
