<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title></title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style type="text/css">
.demo{width:760px; margin:60px auto 10px auto}
</style>
<script src="/simi/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/simi/scripts/lib/quiz.js"></script>
<script type="text/javascript" src="/simi/scripts/timu.js"></script>
<script type="text/javascript" src="/simi/scripts/quiz.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="demo">
    <div id='quiz-container'></div>
</div>
</body>
</html>
