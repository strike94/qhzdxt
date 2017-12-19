<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/18
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="Description" content=""/>
    <meta name="keywords" content=""/>
    <title>青海省征地信息公开系统-系统登录</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/login.css" />
    <script type="text/javascript" src="<%=basePath %>javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">

    </script>
</head>

<body>
<div class="warp warpBg">
    <header>
        <h1 class="systitle">青海省征地信息公开系统</h1>
    </header>
    <
    <form action="<%=basePath %>login/show" method="post">
    <div class="loginbox">
        <div class="errorbox"><i class="error"></i>用户名或密码错误，请重新输入！</div>
        <div class="logongroup">
            <input class="intext" id="username" type="text" name="username"  placeholder="用户名" />
            <i class="user"></i>
        </div>
        <div class="logongroup">
            <input class="intext" id="password" type="password" name="password"  placeholder="密码" />
            <i class="password"></i>
        </div>
        <div class="logongroup submitbox">
            <button class="submitbtn" type="submit">登&nbsp;&nbsp;录</button>
        </div>
    </div>
    </form>
    <div class="copyright">推荐IE8或以上版本浏览器，分辨率1280*800或以上显示器使用本系统</div>
</div>
</body>
</html>
