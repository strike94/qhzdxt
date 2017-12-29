<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/19
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="Description" content=""/>
    <meta name="keywords" content=""/>
    <title>青海省征地信息公开系统-首页</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/default.css" />
    <script type="text/javascript" src="<%=basePath %>javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/common.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".i_user").hoverDelay({
                hoverDuring: 0,
                outDuring: 300,
                hoverEvent: function() {
                    $(".userbox", $(".i_user")).slideDown("fast");
                },
                outEvent: function() {
                    $(".userbox", $(".i_user")).slideUp("fast");
                }
            });
        });
        //延时通用
        (function($) {
            $.fn.hoverDelay = function(options) {
                var defaults = {
                    hoverDuring: 200,
                    outDuring: 200,
                    hoverEvent: function() {
                        $.noop();
                    },
                    outEvent: function() {
                        $.noop();
                    }
                };
                var sets = $.extend(defaults, options || {});
                var hoverTimer, outTimer;
                return $(this).each(function() {
                    $(this).hover(function() {
                            clearTimeout(outTimer);
                            hoverTimer = setTimeout(sets.hoverEvent, sets.hoverDuring);
                        },
                        function() {
                            clearTimeout(hoverTimer);
                            outTimer = setTimeout(sets.outEvent, sets.outDuring);
                        });
                });
            }
        })(jQuery);
    </script>
</head>
<body>
<div class="header">
    <h1 class="logoText">青海省征地信息公开系统</h1>
    <div class="menuGroup">
        <ul>
            <li><a href="default.html" class="home"><i></i>首页</a></li>
            <li><a href="javascript:;" onclick="showMessage(this)" class="message"><i><em class="iconState"></em></i>待办提醒</a></li>
            <li><a href="setting.html" class="setting"><i></i>系统设置</a></li>
            <li class="i_user"><a href="user.html" class="user"><i></i>我的账号</a>
                <div class="userbox"> <span class="username"><em>西宁市大通县</em>张三：欢迎您！</span>
                    <div class="s_group">
                        <div class="it_group"><a href="changepassaord.html" class="grayColor">修改密码</a> </div>
                        <div class="it_group"><a href="login.html" class="s_btn">退出系统</a></div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="dashboard">
    <ul class="clearfix">
        <li class="fadeInUp f1"><a href="allnotice.html" class="hdBox befor"><b class="hoverMaskBg"></b> <img src="<%=basePath %>uploadfiles/notice.png" /> <span class="subSys twoLine">批前征地信息公告</span> </a>
            <div class="stat"> <a href="<%=basePath%>page/notice.jsp"><i>23</i><b>我发起的公告</b></a> <a href="notice.html"><i>0</i><b>我的待办</b></a> </div>
            <div class="funprocess">项目审批前</div>
            <div class="taskBox"> <a href="<%=basePath%>page/addNotice.jsp" class="initiate">发布批前征地信息公告</a> </div>
        </li>
        <li class="fadeInUp f3"><a href="project.html" class="hdBox after"><img src="<%=basePath %>uploadfiles/report.png" /> <span class="subSys">批后征地信息项目</span></a>
            <div class="stat"> <a href="project.html"><i>23</i><b>我办理的项目</b></a> <a href="project.html"><i>13</i><b>我的待办</b></a> </div>
            <div class="funprocess">项目审批后</div>
            <div class="taskBox"> <a href="addproject.html" class="initiate disabledBtn">发起批后征地信息项目</a> </div>
        </li>
        <li class="fadeInUp f2"><a href="article.html" class="hdBox article"><img src="<%=basePath %>uploadfiles/plan.png" /> <span class="subSys">征地信息文章</span></a>
            <div class="stat allPart"> <a href="article.html"><i>18</i><b>我发起的文章</b></a> </div>
            <div class="funprocess">&nbsp;&nbsp;</div>
            <div class="taskBox"> <a href="<%=basePath%>page/newArticle.jsp" class="initiate">发布征地信息文章</a> </div>
        </li>
    </ul>
</div>
<div class="messageBox">
    <div class="messageBoxContent">
        <div class="messageMain">
            <ul>
                <li class="messageItem">
                    <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
                    <div class="messageBlock">
                        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
                        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
                        <a class="messageTodo" href="plan.html">立即处理</a>
                    </div>
                </li>
                <li class="messageItem">
                    <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
                    <div class="messageBlock">
                        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
                        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
                        <a class="messageTodo" href="plan.html">立即处理</a>
                    </div>
                </li>
                <li class="messageItem">
                    <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
                    <div class="messageBlock">
                        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
                        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
                        <a class="messageTodo" href="plan.html">立即处理</a>
                    </div>
                </li>
            </ul>
            <div class="loadMore">
                <a href="javascript:;">加载更多</a>
            </div>
        </div>
    </div>
    <a class="closeMessageBox" href="javascript:;" onClick="closeMessage(this)"></a>
    <script type="text/javascript">
        function closeMessage(obj){
            $(obj).parent().slideUp("fast");
        }
        function showMessage(){
            $(".messageBox").slideToggle("fast");
        }
    </script>
</div>
</body>
</html>
