<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="advert">招商广告位</div>
<div class="doc-ft">
    <a href="http://www.miibeian.gov.cn/" target="_blank" rel="nofollow">京ICP备15034347号</a>
    <%-- <span class="visit">访问量：<i></i></span> --%>
</div>
<footer class="m-foot">
    <ul class="first">
        <li><a href="/simi/user/mainInit.do" title="首页">首页</a></li>
        <li><a href="/simi/user/actInit.do" title="活动规则">活动规则</a></li>
        <li>
            <a href="javascript:;" title="线上活动">线上活动</a>
            <ul class="next">
                <li><a href="/simi/user/quizInit.do">一战到底</a></li>
                <li><a href="/simi/question/askInit.do">无节操问答</a></li>
            </ul>
        </li>
        <li><a href="/simi/user/regInit.do" title="首页">我要报名</a></li>
    </ul>
</footer>
