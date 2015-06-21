<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <footer class="m-foot">
        <ul class="first">
            <li><a href="javascript:;" title="首页">首页</a></li>
            <li><a href="actRule.html" title="活动规则">活动规则</a></li>
            <li>
                <a href="javascript:;" title="线上活动">线上活动</a>
                <ul class="next">
                    <li><a href="decisiveBattle.html">一战到底</a></li>
                    <li><a href="ask.html">无节操问答</a></li>
                </ul>
            </li>
            <li>
            <a href="register.html" title="首页">我要报名</a>
            </li>
        </ul>
    </footer>
