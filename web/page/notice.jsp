<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/28
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>青海省征地信息公开系统-拟征收土地公告</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>themes/css/default.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>javascript/chosen/chosen.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>javascript/artDialog-master/css/ui-dialog.css" />
    <script type="text/javascript" src="<%=basePath%>javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>javascript/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>javascript/chosen/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>javascript/artDialog-master/dist/dialog-plus-min.js"></script>
    <script type="text/javascript">
        function checkboxSelect(obj){
            if($(obj).hasClass("selected")){
                $(obj).removeClass("selected");
                $("input",$(obj)).attr("checked",false);
            }
            else{
                $(obj).addClass("selected");
                $("input",$(obj)).attr("checked", "checked");
            }
        }
        $(function(){
            $('.delPlan').on('click',
                function() {
                    var d = dialog({
                        title: '删除确认',
                        content: '',
                        cancelValue: '取消',
                        okValue: '确定',
                        ok: function() {},

                        cancel: function() {}
                    });
                    var elem = $("#confirmBox");
                    d.content(elem).showModal();
                });
        });
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
<div class="content">
    <div class="menu">
        <ul>
            <li><a href="notice.html" class="all"><i></i><span>所有公告</span></a></li>
            <li><a href="notice.html" class="active"><i></i><span>待办公告</span></a></li>
            <li><a href="notice.html"><i></i><span>待审核公告</span></a></li>
            <li><a href="notice.html" class="end"><i></i><span>已发布公告</span></a></li>
        </ul>
    </div>
    <div class="wrp hasleft clearfix">
        <div class="subTab Margin30">
            <div class="subTabInner"><a href="allnotice.html" class="active"><em>全部</em><b></b></a><a href="notice.html"><em>拟征收土地公告</em><b></b></a><a href="plan.html"><em>拟征收土地补偿安置方案公告</em><b></b></a></div>
        </div>
        <!--<h2 class="wrpTitle"><em>拟征收土地公告</em> <b class="reportType">项目审批前</b></h2>-->
        <div class="functionBar clearfix">
            <div class="selectionGroup">
                <div class="dropDown"  style="width:120px;">
                    <select data-placeholder="所属区县" class="chosen-select-no-single" tabindex="9">
                        <option value=""></option>
                        <option value="United States">全部</option>
                        <option value="United States">已发布</option>
                        <option value="United States">未发布</option>
                    </select>
                </div>
            </div>
            <div class="selectionGroup">
                <div class="dropDown"  style="width:120px;">
                    <select data-placeholder="所在街道" class="chosen-select-no-single" tabindex="9">
                        <option value=""></option>
                        <option value="United States">全部</option>
                        <option value="United States">已发布</option>
                        <option value="United States">未发布</option>
                    </select>
                </div>
            </div>
            <div class="queryGroup"> <span class="searchBox">
        <input type="text" placeholder="请输入公告名称或文号的关键字" class="searchMain">
        <a href="javascript:;" class="removeText"><i></i></a>
        <button class="searchBtn"><i></i></button>
        </span> </div>
        </div>
        <div class="dataWrap">
            <div class="dataGrid">
                <div class="gridMain">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th><span class="btnChose ctrlChosen" onclick="checkboxSelect(this)">
                <input name="" type="checkbox" checked="checked" value="" />
                <i></i><em>全选</em></span></th>
                            <th>公告名称</th>
                            <th>文号</th>
                            <th>项目位置</th>
                            <th>公告日期</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${applicationScope.notice}" var="obj">
                        <tr>
                            <td><span class="btnChose ctrlChosen selected" onclick="checkboxSelect(this)">
                <input name="" type="checkbox" value="" />
                <i></i></span></td>
                            <td><a href="noticeDetail.html" class="heightColor">${obj.notice_name}</a></td>
                            <td>${obj.notice_docnum}</td>
                            <td>${obj.notice_address}</td>
                            <td>${obj.notice_date }</td>
                            <td><span class="heightColor moreTips">详情<i class="tipsIcon"></i>
                <div class="menuGroupBox">
                  <ul>
                    <li><a href="noticeDetail.html">详情</a></li>
                    <li><a href="javascript:;">发布</a></li>
                    <li><a href="javascript:;" class="delPlan">删除</a></li>
                  </ul>
                </div>
                </span></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <ul class="pagination">
                <li class="gotoPage">
                    <input type="text">
                    <a class="pageBtn">跳转</a> </li>
                <li> <a class="pageBtn nextPage" href="<%=basePath%>notice/show?PageNum=${requestScope.pageNum+1}">><i class="arrow"></i></a> </li>
                <li> <span class="pageNum"><em class="cur">${requestScope.pageNum}</em><em class="integral">/</em><em class="all">${requestScope.maxPage}</em></span> </li>
                <li> <a class="pageBtn prevPage" href="<%=basePath%>notice/show?PageNum=${requestScope.pageNum-1}"><i class="arrow"></i></a> </li>
            </ul>
        </div>
    </div>
</div>
<div class="confirmBox hide" id="confirmBox">
    <div class="uplayoutBox">
        <div class="addTwoLevelbox"> <span class="tips_icon confirm_icon48"></span>
            <div class="confirmBoxRight">
                <h4>删除确认</h4>
                <p>删除后该公告将不能恢复。</p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var config = {
        '.chosen-select'           : {},
        '.chosen-select-deselect'  : {allow_single_deselect:true},
        '.chosen-select-no-single' : {disable_search_threshold:10},
        '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
        '.chosen-select-width'     : {width:"100%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
    $('.chosen-select').chosen();
</script>
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
            </ul><div class="loadMore">
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
